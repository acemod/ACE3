/*
 * Author: Commy2 and esteldunedain
 * Make the player check the temperature of his weapon
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, currentWeapon player] call ace_overheating_fnc_checkTemperature
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_weapon"];
TRACE_2("params",_player,_weapon);

// Play animation and report temperature
private _action = getText (configFile >> "CfgWeapons" >> _weapon >> "ACE_checkTemperatureAction");

if (_action == "") then {
    _action = "Gear";
};

_player playActionNow _action;

// Waits a sec before displaying the temperature
[FUNC(displayTemperature), [_player, _weapon], 1.0] call EFUNC(common,waitAndExecute);
