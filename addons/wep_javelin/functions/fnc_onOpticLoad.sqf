#define DEBUG_MODE_FULL
#include "script_component.hpp"
TRACE_1("enter", _this);

if((count _this) > 0) then {
    uiNameSpace setVariable ['ACE_RscOptics_javelin',_this select 0];
};

uiNameSpace setVariable [QGVAR(arguments), 
    [
        0,         // Last runtime
        objNull    // currentTargetObject
    ]
];