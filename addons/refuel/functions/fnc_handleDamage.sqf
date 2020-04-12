#include "script_component.hpp"
/*
 * Author: Dystopian
 * Restores vanilla fuel cargo when refuel vehicle is destroyed.
 *
 * Arguments:
 * HandleDamage EH <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_refuel_fnc_handleDamage
 *
 * Public: No
 */

params ["_source"];

// prevent multiple HD fires in one frame
if (_source getVariable [QGVAR(handled), false]) exitWith {};
_source setVariable [QGVAR(handled), true];

// in this frame restore vanilla fuel cargo
if (alive _source) then {
    private _fuel = _source getVariable QGVAR(currentFuelCargo);
    if (isNil "_fuel") then {
        _source setFuelCargo 1;
    } else {
        _source setFuelCargo (_fuel / (_source call FUNC(getFuelCargo)));
    };
};

// in the next frame disable fuel cargo if vehicle is not dead yet
[{
    params ["_source", "_ehid"];
    if (alive _source) then {
        _source setFuelCargo 0;
    } else {
        _source removeEventHandler ["HandleDamage", _ehid];
        if (-1 < _source getVariable [QGVAR(HDEHID), -1]) then {
            _source setVariable [QGVAR(HDEHID), nil];
        };
    };
    _source setVariable [QGVAR(handled), false];
}, [_source, _thisEventHandler]] call CBA_fnc_execNextFrame;

nil
