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
#include "script_component.hpp"
private ["_speedDial", "_found"];
_speedDial = ace_player getVariable [QGVAR(SpeedDial), []];
_found = false;

EXPLODE_2_PVT(_this,_name,_code);

if ((_code) == "") ExitWith {
    [_name] call FUNC(removeFromSpeedDial);
};
{
    if ((_x select 0) == _name) exitWith {
        _speedDial set [_foreachindex, _this];
        _found = true;
    };
} foreach _speedDial;
if (!_found) then {
    _speedDial pushBack _this;
};

ace_player setVariable [QGVAR(SpeedDial), _speedDial];
