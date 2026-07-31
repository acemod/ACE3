#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Custom wounds handler for armor penetration. Calculates damage based on round penetration and armor plate level.
 *
 * Arguments:
 * 0: Unit that was hit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 *    0: Engine damage <NUMBER>
 *    1: Body part <STRING>
 *    2: Real damage <NUMBER>
 *    3: Engine hitpoint <STRING>
 * 2: Type of the damage done <STRING>
 * 3: Ammo <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [[0.5, "Body", 1, "HitChest"]], "bullet"] call ace_medical_damage_fnc_woundsHandlerArmorPenetration
 *
 * Public: No
 */

// Maps ammo "hit" onto the wound damage scale used by ACE_Medical_Injuries, hit/10 puts
// a pistol round around a minor wound and .50 BMG at an avulsion
#define DAMAGE_SCALING_FACTOR 10
// The head tolerates far less energy than the torso
#define HEAD_DAMAGE_MULTIPLIER 1.5
// Behind armor blunt trauma must stay below PENETRATION_THRESHOLD, a defeated round never penetrates
#define MAX_BABT_DAMAGE 0.34
// How much a layer behind the outermost hard one is worth. Layered armor is less effective than a
// single plate of the same total thickness, but vanilla does stack these additively, and an armored
// suit under a heavy plate carrier is meant to be absurd - at this value it beats tungsten AP and
// still loses to anti-materiel calibers
#define ARMOR_LAYER_EFFICIENCY 0.5
// Penetration depth in mm is velocity * caliber * penetrability / 1000, RHA penetrability is 15
// ref https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#caliber
#define ARMOR_PENETRABILITY 0.015
// Spread of the ballistic limit. Armor defeats rounds over a velocity band rather than at a hard
// cutoff, and this also stands in for the two things we can't derive from a HandleDamage event:
// impact obliquity, which lengthens the path through the plate by 1/cos and so only ever raises
// the limit (+41% at 45 degrees), and plate coverage, where edges, gaps and soft-panel-only areas
// leave less protection than the nominal level. Hence the asymmetry
#define BALLISTIC_LIMIT_COVERAGE 0.25
#define BALLISTIC_LIMIT_OBLIQUITY 0.45

if (!EGVAR(medical,alternateArmorPenetration)) exitWith {_this};

params ["_unit", "_allDamages", "_typeOfDamage", "_ammo"];
TRACE_4("woundsHandlerArmorPenetration",_unit,_allDamages,_typeOfDamage,_ammo);

(_ammo call FUNC(getAmmoData)) params ["_hit", "_caliber", "_typicalSpeed", "_explosive"];

// Skip ammo we can't reason about. At explosive >= 1 no part of hit is scaled by speed,
// so impact velocity can't be recovered from the damage at all
if (_hit <= 0 || {_caliber <= 0} || {_typicalSpeed <= 0} || {_explosive >= 1}) exitWith {
    TRACE_4("skipping unusable ammo",_hit,_caliber,_typicalSpeed,_explosive);
    _this // return
};

// Selection specific, but #structural can outrank every body part on high damage rounds and the
// base handler ignores it and wounds the next part down, so target the entry it will actually use
private _damageIndex = _allDamages findIf {(_x select 1) != "#structural"};

if (_damageIndex < 0) exitWith {
    TRACE_1("no body part damaged",_allDamages);
    _this // return
};

private _damageData = _allDamages select _damageIndex;
_damageData params ["", "_bodyPart", "_realDamage", "_hitpoint"];

// Engine damage is hit * (speed/typicalSpeed), and only the (1 - explosive) portion is scaled by speed,
// so this recovers the true impact speed. Damage is already lowered by the engine for hit angle
// ref https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#hit
private _impactSpeed = (((_realDamage/_hit) - _explosive) / (1 - _explosive)) * _typicalSpeed;

if (_impactSpeed <= 0) exitWith {
    TRACE_2("no impact speed",_impactSpeed,_realDamage);
    _this // return
};

// RHA equivalent thickness in mm per level.
// Torso plates are anchored so each level barely defeats its NIJ test round:
// I/IIA 9mm, II/IIIA .44 Magnum, IV/III 7.62x51 ball, V/IV .30-06 AP. Level III sits above its
// own IIIA anchor on purpose - a vest named "Carrier" should carry plates, and at the IIIA value
// the Carrier Lite performs like a TacVest against every rifle round in the game. Level II
// inherits the vacated IIIA anchor, otherwise I and II sit 1.1mm apart and integrated soft armor
// (CSAT fatigues) ends up worth almost nothing when layered under a vest.
// Helmets need their own anchors, one Ops-Core model per level, using their published V0
// resistance to penetration figures run through the same formula:
// I FAST SF (9mm @ 364), II FAST XP/LE (9mm @ 427), III TBH-IIIA (7.62x25 @ 450),
// IV RF1 (7.62x39 MSC @ 725), V RF2 (7.62x51 M80 @ 847).
// Only the last two are rifle rated, everything below is fragmentation and pistol only
private _torsoPoints = [0, 6.7, 9.2, 12.5, 20.4, 26.4];
private _helmetPoints = [0, 6.6, 7.7, 9.2, 13.5, 20.4];

private _fnc_levelToThickness = {
    params ["_level", "_points"];
    private _lowerLevel = floor _level;
    private _thickness = _points select _lowerLevel;

    // Levels are continuous, interpolate between the anchors
    if (_lowerLevel < MAX_PLATE_LEVEL) then {
        _thickness = _thickness + (_level - _lowerLevel) * ((_points select (_lowerLevel + 1)) - _thickness);
    };

    _thickness // return
};

// Uniforms are on the same ladder as vests (CSAT fatigues are level II, Viper suits level III),
// headgear gets its own table since helmets are rated against different threats
([uniform _unit, _hitpoint] call EFUNC(medical_engine,getItemPlate)) params ["_uniformLevel", "_uniformPassThrough"];
([vest _unit, _hitpoint] call EFUNC(medical_engine,getItemPlate)) params ["_vestLevel", "_vestPassThrough"];
([headgear _unit, _hitpoint] call EFUNC(medical_engine,getItemPlate)) params ["_headLevel", "_headPassThrough"];

private _layers = [
    [[_uniformLevel, _torsoPoints] call _fnc_levelToThickness, _uniformPassThrough],
    [[_vestLevel, _torsoPoints] call _fnc_levelToThickness, _vestPassThrough],
    [[_headLevel, _helmetPoints] call _fnc_levelToThickness, _headPassThrough]
];

_layers sort false;

// Layers stack, but nowhere near additively - the outermost hard layer does almost all the work
// and what sits behind it only catches the residual. Anything else would let a plate carrier over
// an armored suit sum its way past the top of the ladder
(_layers select 0) params ["_thickness", "_passThrough"];
_thickness = _thickness + ARMOR_LAYER_EFFICIENCY * ((_layers select 1 select 0) + (_layers select 2 select 0));

// Speed at which this round's penetration exactly equals the plate.
// Real armor has a zone of mixed results rather than a hard cutoff - the limit is a V50, where
// half the rounds get through - so vary it a little to avoid an unnaturally sharp step
private _ballisticLimit = (_thickness / (_caliber * ARMOR_PENETRABILITY)) * random [1 - BALLISTIC_LIMIT_COVERAGE, 1, 1 + BALLISTIC_LIMIT_OBLIQUITY];

// Recht-Ipson residual velocity, zero when the plate defeats the round
private _residualSpeed = sqrt (0 max (_impactSpeed^2 - _ballisticLimit^2));

private _damageMultiplier = [1, HEAD_DAMAGE_MULTIPLIER] select (_bodyPart == "head");

// Feeding residual speed back through the engine's own damage formula keeps this on the same
// scale as an unarmored hit, so no plate means no discontinuity
private _penetratingDamage = (_hit/DAMAGE_SCALING_FACTOR) * (_residualSpeed/_typicalSpeed) * _damageMultiplier;

// Behind armor blunt trauma - the speed the plate bled off, scaled by how much of it reaches the
// wearer. Using the absorbed fraction rather than a flat ratio keeps this proportional to how hard
// the round actually hit, and makes the two branches complementary: a fully defeated round puts its
// whole damage budget here, a clean pass-through puts none of it.
// Capped so it always reads as a contusion rather than a penetrating wound
private _babtDamage = ((_hit/DAMAGE_SCALING_FACTOR) * ((_impactSpeed - _residualSpeed)/_typicalSpeed) * _passThrough * _damageMultiplier) min MAX_BABT_DAMAGE;

private _finalDamage = _penetratingDamage max _babtDamage;
_damageData set [0, _finalDamage];

TRACE_4("Armor penetration handled",_plateLevel,_impactSpeed,_ballisticLimit,_finalDamage);
TRACE_3("passing damage",_finalDamage,_damageData,_allDamages);

_this // return
