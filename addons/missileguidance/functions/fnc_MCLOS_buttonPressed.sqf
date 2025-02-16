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
 * [[0, 0, 1], player] call ace_missileguidance_fnc_MCLOS_buttonPressed
 *
 * Public: No
 */

params ["_accelerationDirection", "_player"];

private _shooter = vehicle _player;
if (_player == _shooter) exitWith {};
private _turret = _shooter unitTurret _player;

if (((_shooter weaponsTurret _turret) findIf {
    (getNumber (configFile >> "CfgWeapons" >> _x >> QGVAR(hasMCLOSControl))) == 1
}) == -1) exitWith { false };


playSound "ACE_Sound_Click_20db";

private _currentDirection = _shooter getVariable [QGVAR(MCLOS_direction), [0, 0, 0]];
// Send data across network for handling non-local projectiles
// This is the case in a wanted development for a proper Malyutka implementation where projectiles will
// have their locality change via script
_shooter setVariable [QGVAR(MCLOS_direction), _currentDirection vectorAdd _accelerationDirection, true];

// Shouldn't have too many projectiles sent across the network. Planned max is 4 at a time
private _controlled = _shooter getVariable [QGVAR(mclos_projectiles), []];
_controlled = _controlled select { !isNull _x };
_shooter setVariable [QGVAR(mclos_projectiles), _controlled, true];

// if we are controlling missiles, we want the input to be captured
_controlled isNotEqualTo []
