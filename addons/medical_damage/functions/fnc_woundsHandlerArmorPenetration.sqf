#include "script_component.hpp"
/*
 * Author: LinkIsGrim
 * Custom wounds handler for armor penetration. Calculates damage based on round material penetration and unit armor
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 * 2: Type of the damage done <STRING>
 * 3: Projectile classname <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [[0.5, "Body", 1]], "bullet"] call ace_medical_damage_fnc_woundsHandlerArmorPenetration
 *
 * Public: No
 */
// armor 2 with passthrough 0.8
#define SCALED_UNPROTECTED_VALUE 4
#define ENGINE_DAMAGE_INDEX 0

params ["_unit", "_allDamages", "_typeOfDamage", ["_ammo", ""]];
TRACE_3("woundsHandlerArmorPenetration",_unit,_allDamages,_typeOfDamage);

if !(EGVAR(medical,alternateArmorPenetration) && {_ammo isNotEqualTo ""}) exitWith {_this};

private _damageData = (_allDamages select 0); // selection specific
_damageData params ["_engineDamage", "", "_realDamage"];

private _armor = _realDamage/_engineDamage;
// There's no need to calculate penetration if there is no armor to begin with, vanilla damage handling is good enough in this case
if (_armor <= SCALED_UNPROTECTED_VALUE) exitWith {
    _this // return
};

// See (https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#caliber),
// _penFactor is ammo "caliber" * penetrability * typicalSpeed, for simplification we consider an armor value of 1 to be equivalent to 1mm of RHA (penetrability 0.015)
// Above is not actually the case but a good enough approximation
([_ammo] call FUNC(getAmmoData)) params ["_hit", "_penFactor", "_typicalSpeed"];

// Impact damage is hit * (impactSpeed / typicalSpeed): https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#typicalSpeed
// Impact damage already takes into account hits at oblique angles, engine handles that
private _impactSpeed = (_realDamage/_hit) * _typicalSpeed;

// Energy transferred to target can be randomized a bit, final stage ballistics isn't a science
_hit = _hit * random [0.75, 1, 1.1];

private _penDepth = _penFactor * (_impactSpeed/_typicalSpeed)^2;

// We want to base damage on the round's energy and armor penetration exclusively, so we'll use the config value to get damage
// There's only so much damage a round can do, limited by its energy
// Divide by 10 to scale to 0-1
private _finalDamage = (_hit * ((_penDepth/_armor) min 1)^2) / 10;
_damageData set [ENGINE_DAMAGE_INDEX, _finalDamage];

TRACE_3("Armor penetration handled, passing damage", _finalDamage, _damageData, _allDamages);

_this // return
