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
 * [] call ace_advancedthrowing_fnc_onMouseButtonDown
 *
 * Public: No
 */
#include "script_component.hpp"

if (!GVAR(inHand)) exitWith {};

params ["", "_key"];

// Left mouse button
// "DefaultAction" doesn't get executed when in driver seat or in FFV seat with weapon lowered
if (_key == 0) exitWith {
    if (!isNull GVAR(activeThrowable)) then {
        // Look gets automatically pointed at weapon direction on first LMB press when in FFV seat, require weapon to be up if in vehicle
        private _inVehicle = vehicle ACE_player != ACE_player;
        if (!_inVehicle || {_inVehicle && {!weaponLowered ACE_player}}) then {
            [ACE_player] call FUNC(throw);
        };
    };
};

// Right mouse button
if (_key == 1) exitWith {
    if (!GVAR(primed)) then {
        [ACE_player, "Storing throwable"] call FUNC(exitThrowMode);
    };
};

// Middle mouse button
if (_key == 2 && {!GVAR(primed)}) exitWith {
    [ACE_player, true] call FUNC(prime);
};
