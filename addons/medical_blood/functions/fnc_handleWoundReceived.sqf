#include "..\script_component.hpp"
/*
 * Author: Glowbal, commy2
 * Handles the wounds received event by triggering any needed blood creation.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Damage <NUMBER or ARRAY>
 * 2: Shooter <OBJECT>
 * 3: Ammo classname or damage type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 0.5, badGuy, "bullet"] call ace_medical_blood_fnc_handleWoundReceived
 *
 * Public: No
 */

params ["_unit", "_damage", "_shooter", "_damageType"];

if (_damage isEqualTo []) exitWith {};

if (_damage isEqualType []) then {
    _damage = _damage select 0 select 0;
};

// Don't bleed if damage type does not cause bleeding
if (_damageType in (uiNamespace getVariable QGVAR(noBloodDamageTypes))) exitWith {};

// Don't bleed when players only and a non-player unit is wounded
if (GVAR(enabledFor) == BLOOD_ONLY_PLAYERS && {!isPlayer _unit && {_unit != ACE_player}}) exitWith {};

// Don't bleed on the ground if in a vehicle
if (!isNull objectParent _unit && {!(vehicle _unit isKindOf "StaticWeapon")}) exitWith {};

private _bulletDir = if (isNull _shooter) then {
    random 360 // Cannot calculate the direction properly, pick a random direction
} else {
    _shooter getDir _unit // Calculate the bullet direction
};

[QGVAR(spurt), [_unit, _bulletDir, _damage min 1]] call CBA_fnc_serverEvent;
