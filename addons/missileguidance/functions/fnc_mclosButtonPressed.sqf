#include "script_component.hpp"
/*
 * Author: Dani (TCVM)
 * Handles MCLOS guidance via keyboard keys
 *
 * Arguments:
 * Acceleration vector
 *
 * Return Value:
 * None
 *
 * Example:
 * [0, 0, 1] call ace_missileguidance_fnc_mclosButtonPressed
 *
 * Public: No
 */
params ["_accelerationDirection", "_player"];
private _projectiles = _player getVariable [QGVAR(MCLOS_Projectiles), []];
_projectiles = _projectiles select { _x isNotEqualTo objNull };
_player setVariable [QGVAR(MCLOS_Projectiles), _projectiles];

private _vehicleHasMCLOS = 1 == getNumber ((configOf vehicle _player) >> QGVAR(hasMCLOSControl));
if (_vehicleHasMCLOS) then {
    playSound "ACE_Sound_Click";
};

private _currentDirection = _player getVariable [QGVAR(MCLOS_direction), [0, 0, 0]];
_player setVariable [QGVAR(MCLOS_direction), _currentDirection vectorAdd _accelerationDirection];

