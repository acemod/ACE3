/*
    Author:
    voiper

    Description:
    Respawn EH for remote clients.

    Arguments:
    0: Unit <Object>

    Example:
    ["Init", [false]] call ace_spectator_fnc_camera;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

_unit = _this select 0;
_unit setVariable [QGVAR(name), name _unit, true];
//_unit setVariable [QGVAR(listed), false];