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
 * If the button is pressed with an MCLOS context
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

private _inMclosControlled = false;

private _shooter = vehicle _player;
if (getNumber ((configOf _shooter) >> QGVAR(hasMCLOSControl) == 1) then {
    playSound "ACE_Sound_Click";

    private _currentDirection = _shooter getVariable [QGVAR(MCLOS_direction), [0, 0, 0]];
    // Send direction across network for non-local projectiles
    // This is the case in a wanted development for a proper Malyutka implementation
    _shooter setVariable [QGVAR(MCLOS_direction), _currentDirection vectorAdd _accelerationDirection, true];
    _inMclosControlled = true;
};

_inMclosControlled
