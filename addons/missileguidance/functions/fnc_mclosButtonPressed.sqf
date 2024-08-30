#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Handles MCLOS guidance via keyboard keys
 *
 * Arguments:
 * 0: Acceleration vector <ARRAY>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[0, 0, 1], player] call ace_missileguidance_fnc_mclosButtonPressed
 *
 * Public: No
 */
params ["_accelerationDirection", "_player"];
private _projectiles = _player getVariable [QGVAR(MCLOS_Projectiles), []];
_projectiles = _projectiles select { !isNull _x };
_player setVariable [QGVAR(MCLOS_Projectiles), _projectiles];

if (getNumber ((configOf vehicle _player) >> QGVAR(hasMCLOSControl) == 1) then {
    playSound "ACE_Sound_Click";
};

private _currentDirection = _player getVariable [QGVAR(MCLOS_direction), [0, 0, 0]];
_player setVariable [QGVAR(MCLOS_direction), _currentDirection vectorAdd _accelerationDirection];

