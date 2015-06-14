// by commy2
#include "script_component.hpp"

GVAR(ScrollWheelFrame) = diag_frameno;

GVAR(onScrollWheel) = {
    private ["_scroll"];
    _scroll = _this select 1;

    if (GVAR(ScrollWheelFrame) == diag_frameno) exitWith {};
    GVAR(ScrollWheelFrame) = diag_frameno;

    {
        [_scroll] call _x;
    } count ((missionNamespace getVariable ["ACE_EventHandler_ScrollWheel", [-1, [], []]]) select 2);
};
