/////////////////////////////////////////////////////
// mouseHandler.sqf
// by nou
//
// please see the documentation in add_ruler.sqf
/////////////////////////////////////////////////////
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_2(_event,_down);

if ((_event select 1) == 0) then {
    if(_down) then {
        GVAR(MouseShift) = _event select 4;
        GVAR(MouseDown) = true;
    } else {
        GVAR(MouseDown) = false;
        GVAR(DragOK) = false;
        GVAR(OffDrag) = false;
        GVAR(LastDragPosition) = [];
        GVAR(MouseShift) = false;
        GVAR(LastDragAzimuth) = -1000;
        [] call GVAR(UpHandlerFnc);
        GVAR(UpHandlerFnc) = {};
        GVAR(DragAction) = "";
    };
};
