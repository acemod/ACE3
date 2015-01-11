/////////////////////////////////////////////////////
// testkb.sqf
// by nou
//
// please see the documentation in add_ruler.sqf
/////////////////////////////////////////////////////
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

PARAMS_2(_event,_down);

if(_down) then {
	GVAR(RulerKeyDown) = (_event select 1);
    switch (GVAR(RulerKeyDown)) do {
        case (["CBA","events","ace_sys_maptools","Delete_Line","key"] call ace_settings_fnc_getNumber): {
            [] call FUNC(DeleteLine);
        };
        default {};
    };
} else {
	GVAR(RulerKeyDown) = -1000;
    [] call GVAR(UpHandlerFnc);
    GVAR(UpHandlerFnc) = {};
    GVAR(DragAction) = "";
};