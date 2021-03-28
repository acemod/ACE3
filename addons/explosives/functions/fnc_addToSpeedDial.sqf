#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Sets the speed dial for the UI.
 *
 * Arguments:
 * 0: Name of speed dial <STRING>
 * 1: Code to add to speed dial <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["My Speed Dial","2131"] call ACE_explosives_fnc_addToSpeedDial;
 *
 * Public: Yes
 */

params ["_name", "_code"];
TRACE_2("params",_name,_code);

private _speedDial = ace_player getVariable [QGVAR(SpeedDial), []];
private _found = false;

if ((_code) == "") exitWith {
    [_name] call FUNC(removeFromSpeedDial);
};
{
    if ((_x select 0) == _name) exitWith {
        _speedDial set [_forEachIndex, _this];
        _found = true;
    };
} forEach _speedDial;
if (!_found) then {
    _speedDial pushBack _this;
};

ace_player setVariable [QGVAR(SpeedDial), _speedDial];
