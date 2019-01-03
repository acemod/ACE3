#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Called when the Dragon is disassembled. Sets the new tripods variables if the Dragon was fired
 *
 * Arguments:
 * 0: New Tripod <OBJECT>
 * 1: Previous Weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, player] call ace_dragon_fnc_onDisassemble;
 *
 * Public: No
 *
 */
params ["_newTripod", "_oldWeapon"];

if (_oldWeapon getVariable [QGVAR(fired), false]) then {
    _newTripod setVariable [QGVAR(fired), true, true];
    _newTripod animate ["missile_hide", 1];
};

