/*
    Author:
    voiper

    Description:
    Automatically set crosshair colour.

    Arguments:
    None

    Example:
    call ace_spectator_fnc_crosshair;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

_xhair = uiNamespace getVariable QGVAR(crosshair);
if (!isNull _xhair) then {
    _colour = if ((GVAR(lock) select 0) > -1) then {[1,0,0,0.8]} else {
        if (!isNull GVAR(attach)) then {[1,1,0,0.8]} else {[1,1,1,0.8]};
    };
    (_xhair displayCtrl 0) ctrlSetTextColor _colour;
};