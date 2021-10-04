#include "script_component.hpp"
/*
 * Author: Glowbal, commy2
 * Handles the wounds received event by triggering any needed blood creation.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Body Part (not used) <STRING>
 * 2: Damage <NUMBER>
 * 3: Shooter <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Body", 0.5, badGuy] call ace_medical_blood_fnc_handleWoundReceived
 *
 * Public: No
 */

params ["_unit", "", "_damage", "_shooter"];

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
