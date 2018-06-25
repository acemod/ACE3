#include "script_component.hpp"
/*
 * Author: Dslyecxi, Jonpas
 * Mouse button down event.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_advanced_throwing_fnc_onMouseButtonDown
 *
 * Public: No
 */

if !(ACE_player getVariable [QGVAR(inHand), false]) exitWith {};

params ["", "_key"];

// Left mouse button
// "DefaultAction" doesn't get executed when in driver seat or in FFV seat with weapon lowered
if (_key == 0) exitWith {
    if (!isNull (ACE_player getVariable [QGVAR(activeThrowable), objNull])) then {
        // Look gets automatically pointed at weapon direction on first LMB press when in FFV seat, require weapon to be up if in vehicle
        private _inVehicle = vehicle ACE_player != ACE_player;
        if (!_inVehicle || {_inVehicle && {!weaponLowered ACE_player}}) then {
            [ACE_player] call FUNC(throw);
        };
    };
};

private _primed = ACE_player getVariable [QGVAR(primed), false];

// Right mouse button
if (_key == 1) exitWith {
    if (!_primed) then {
        [ACE_player, "Storing throwable"] call FUNC(exitThrowMode);
    };
};

// Middle mouse button
if (_key == 2 && {!_primed}) exitWith {
    [ACE_player, true] call FUNC(prime);
};
