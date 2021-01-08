#include "script_component.hpp"
/*
 * Author: Glowbal, commy2
 * Handles the wounds received event by triggering any needed blood creation.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Shooter <OBJECT>
 * 2: Ammo (not used) <STRING>
 * 2: Damage <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, badGuy, "", 0.5] call ace_medical_blood_fnc_handleWoundReceived
 *
 * Public: No
 */

params ["_unit", "_shooter", "", "_damage"];

// Don't bleed when players only and a non-player unit is wounded
if (GVAR(enabledFor) == BLOOD_ONLY_PLAYERS && {!isPlayer _unit && {_unit != ACE_player}}) exitWith {};

// Don't bleed on the ground if in a vehicle
if (vehicle _unit != _unit && {!(vehicle _unit isKindOf "StaticWeapon")}) exitWith {};

private _bulletDir = if (isNull _shooter) then {
    random 360 // Cannot calculate the direction properly, pick a random direction
} else {
    _shooter getDir _unit // Calculate the bullet direction
};

[QGVAR(spurt), [_unit, _bulletDir, _damage min 1]] call CBA_fnc_serverEvent;
