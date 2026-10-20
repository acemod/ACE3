#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Sets the speed dial for the UI.
 *
 * Arguments:
 * 0: Name of speed dial <STRING> (default: "")
 * 1: Code to add to speed dial <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * ["My Speed Dial", "2131"] call ace_explosives_fnc_addToSpeedDial
 *
 * Public: Yes
 */

params [["_name", "", [""]], ["_code", "", [""]]];
TRACE_2("params",_name,_code);

if (_name == "") exitWith {};

if (_code == "") exitWith {
    _name call FUNC(removeFromSpeedDial);
};

private _speedDial = ACE_player getVariable [QGVAR(speedDial), []];
private _index = _speedDial findIf {(_x select 0) == _name};

if (_index == -1) then {
    _speedDial pushBack _this;
} else {
    _speedDial set [_index, _this];
};

ACE_player setVariable [QGVAR(speedDial), _speedDial];
