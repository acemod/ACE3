#include "script_component.hpp"
/*
 * Author: Alganthe
 * Open arsenal.
 *
 * Arguments:
 * 0: Box <OBJECT>
 * 1: Unit to open the arsenal on <OBJECT>
 * 2: Ignore virtual items and fill arsenal <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box, player] call ace_arsenal_fnc_openBox
 *
 * Public: Yes
*/

params [["_object", objNull, [objNull]], ["_center", objNull, [objNull]], ["_mode", false, [false]]];

if (
    isNull _object ||
    {isNull _center} ||
    {!(_center isKindOf "CAManBase")} ||
    {!(isNull objectParent _center) && {!is3DEN}}
) exitWith {};

if (isNil {_object getVariable [QGVAR(virtualItems), nil]} && {!_mode}) exitWith {
    [localize LSTRING(noVirtualItems), false, 5, 1] call EFUNC(common,displayText);
};

if (canSuspend) exitWith {
    [{_this call FUNC(openBox)}, _this] call CBA_fnc_directCall;
};

private _displayToUse = [findDisplay 46, findDIsplay 312] select (!isNull findDisplay 312);
_displayToUse = [_displayToUse, findDisplay 313] select (is3DEN);

if (isNil "_displayToUse" || {!isnil QGVAR(camera)}) exitWith {
    [localize LSTRING(CantOpenDisplay), false, 5, 1] call EFUNC(common,displayText);
};

if (_mode) then {
    GVAR(virtualItems) = +(uiNamespace getVariable QGVAR(configItems));
} else {
    GVAR(virtualItems) = +(_object getVariable [QGVAR(virtualItems), [
        [[], [], []], [[], [], [], []], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []
    ]]);
};

GVAR(center) = _center;

if (is3DEN) then {
    _displayToUse createDisplay QGVAR(display);
} else {
    [{(_this select 0) createDisplay (_this select 1)}, [_displayToUse, QGVAR(display)]] call CBA_fnc_execNextFrame;
};
