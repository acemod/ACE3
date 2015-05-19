//#define DEBUG_MODE_FULL
#include "script_component.hpp"
TRACE_1("enter", _this);
private["_args", "_disableFireEH", "_pfh"];

uiNameSpace setVariable ['ACE_RscOptics_javelin',nil];

_pfh = uiNamespace getVariable["ACE_RscOptics_javelin_PFH", nil ];
if(!isNil "_pfh") then {
    [_pfh] call CBA_fnc_removePerFrameHandler;
    uiNameSpace setVariable ['ACE_RscOptics_javelin_PFH',nil];
};

_args = uiNamespace getVariable[QGVAR(arguments), nil ];
if(!isNil "_args") then {
    _disableFireEH = _args select 6;
    if(_disableFireEH > 0  && difficulty > 0) then {
        [ACE_player, "DefaultAction", _disableFireEH] call EFUNC(common,removeActionEventHandler);
    };
    uiNameSpace setVariable [QGVAR(arguments),nil];
};
