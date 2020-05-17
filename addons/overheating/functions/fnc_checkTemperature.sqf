#include "script_component.hpp"
/*
 * Author: Commy2 and esteldunedain
 * Make the player check the temperature of his weapon
 *
 * Arguments:
 * 0: Unit checking <OBJECT>
 * 1: Unit that has the weapon <OBJECT>
 * 2: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, currentWeapon player] call ace_overheating_fnc_checkTemperature
 *
 * Public: No
 */

params ["_assistant", "_gunner", "_weapon"];
TRACE_3("params",_assistant,_gunner,_weapon);

// Play animation and report temperature
private _action = "PutDown";
if (_assistant isEqualTo _gunner) then {
    _action = getText (configFile >> "CfgWeapons" >> _weapon >> "ACE_checkTemperatureAction");
    if (_action == "") then {
        _action = "Gear";
    };
};
[_assistant, _action] call EFUNC(common,doGesture);

// Waits a sec before displaying the temperature
[FUNC(displayTemperature), [_gunner, _weapon], 1.0] call CBA_fnc_waitAndExecute;
