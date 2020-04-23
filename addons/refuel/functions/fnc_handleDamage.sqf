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
        _fuel = 1;
    } else {
        _fuel = _fuel / (_source call FUNC(getFuelCargo));
    };
    if (_source getVariable [QGVAR(isTerrainPump), false]) then {
        TRACE_1("alive terrain",_source);
        [QGVAR(setFuelCargo), [_source, _fuel]] call CBA_fnc_globalEvent;
    } else {
        TRACE_1("alive not terrain",_source);
        _source setFuelCargo _fuel;
    };
};

// in the next frame disable fuel cargo if vehicle is not dead yet
[{
    params ["_source", "_ehid"];
    if (alive _source) then {
        TRACE_1("next frame alive",_source);
        if (_source getVariable [QGVAR(isTerrainPump), false]) then {
            [QGVAR(setFuelCargo), [_source, 0]] call CBA_fnc_globalEvent;
        } else {
            _source setFuelCargo 0;
        };
    } else {
        TRACE_1("next frame dead",_source);
        _source removeEventHandler ["HandleDamage", _ehid];
        if (-1 < _source getVariable [QGVAR(HDEHID), -1]) then {
            _source setVariable [QGVAR(HDEHID), nil];
        };
    };
    _source setVariable [QGVAR(handled), false];
}, [_source, _thisEventHandler]] call CBA_fnc_execNextFrame;

nil
