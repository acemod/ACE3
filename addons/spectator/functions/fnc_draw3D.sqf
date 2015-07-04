/*
    Author:
    voiper

    Description:
    Draw3D EH for spectator.

    Arguments:
    None

    Example:
    call ace_spectator_fnc_draw3D;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

_map = uiNameSpace getVariable QGVAR(map);
if (!isNull _map) exitWith {};

_compass = uiNamespace getVariable QGVAR(compass);
_status = uiNamespace getVariable QGVAR(status);
if (!isNull _compass) then {[_compass] call FUNC(compass)};
if (!isNull _status) then {[_status] call FUNC(status)};

if (GVAR(markers) > 0) then {
    call FUNC(drawMines3D);
    call FUNC(drawUnits3D);
};
