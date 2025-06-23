#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Custom wounds handler for armor penetration. Calculates damage based on round material penetration and unit armor
 *
 * Arguments:
 * 0: Unit that was hit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 *    0: Engine damage <NUMBER>
 *    1: Body part <STRING>
 *    2: Real damage <NUMBER>
 * 2: Type of the damage done <STRING>
 * 3: Ammo <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [[0.5, "Body", 1]], "bullet"] call ace_medical_damage_fnc_woundsHandlerArmorPenetration
 *
 * Public: No
 */

// This gets close to vanilla values on FMJ ammo
#define DAMAGE_SCALING_FACTOR 10
#define UNSCALED_BASE_ARMOR 2

if (!EGVAR(medical,alternateArmorPenetration)) exitWith {_this};

params ["_unit", "_allDamages", "_typeOfDamage", "_ammo"];
TRACE_4("woundsHandlerArmorPenetration",_unit,_allDamages,_typeOfDamage,_ammo);

// See (https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#caliber),
// _penFactor is ammo "caliber" * RHA penetrability, armor plates according to BI are just made of RHAe material
(_ammo call FUNC(getAmmoData)) params ["_hit", "_penFactor", "_typicalSpeed"];

// Skip bad ammo
if (_hit <= 0) exitWith {_this};

private _damageData = _allDamages select 0; // selection specific
_damageData params ["_engineDamage", "_bodyPart", "_realDamage"];

private _armorLevelStep = [2, 4] select (_bodyPart == "body");
private _armor = (_realDamage/_engineDamage) - UNSCALED_BASE_ARMOR; // remove base armor

// There's no need to calculate penetration if there is no armor to begin with, base damage handling is good enough in this case
if (_armor <= _armorLevelStep) exitWith {
    TRACE_3("skipping no armor",_armor,_bodyPart,_armorLevelStep);
    _this // return
};

// Cap at Armor Level V
// Jumping from no armor to armor level 1 is 2 steps
private _armorLevel = 0 max (round ((_armor - (_armorLevelStep * 2)) / _armorLevelStep)) min 4;
TRACE_3("gotArmorLevel",_armorLevel,_armor,_armorLevelStep);

// Armor RHA equivalent, non-linear, ref \a3\Data_F\Penetration\armour_plate/thin/medium/heavy.bisurf
// Divided by 2 to keep inline with vanilla caliber values
private _armorThickness = [
    6,
    15,
    21,
    40,
    55
] select _armorLevel;
TRACE_1("gotArmorThickness",_armorThickness);

// Impact damage is hit * (impactSpeed / typicalSpeed): https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#typicalSpeed
// Impact damage is already lowered by engine based on hit angle, so speed and therefore penetration are also naturally lowered
// Assume typicalSpeed < 1 means no damage dropoff
private _impactSpeed = (_realDamage/_hit) * (_typicalSpeed max 1);

private _penDepth = _penFactor * _impactSpeed;

// Max damage is the config value, go down from there based on armor penetration
private _finalDamage = (_hit * ((_penDepth/_armorThickness) min 1)) / DAMAGE_SCALING_FACTOR;
_damageData set [0, _finalDamage];

TRACE_3("Armor penetration handled, passing damage",_finalDamage,_damageData,_allDamages);

_this // return
