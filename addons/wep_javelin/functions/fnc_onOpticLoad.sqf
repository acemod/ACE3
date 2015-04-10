//#define DEBUG_MODE_FULL
#include "script_component.hpp"
TRACE_1("enter", _this);

if((count _this) > 0) then {
    uiNameSpace setVariable ['ACE_RscOptics_javelin',_this select 0];
};

ACE_player setVariable ["ace_missileguidance_target",nil, false];

__JavelinIGUISeek ctrlSetTextColor __ColorGray;
__JavelinIGUINFOV ctrlSetTextColor __ColorGray;

__JavelinIGUITargetingConstrains ctrlShow false;
__JavelinIGUITargetingGate ctrlShow false;
__JavelinIGUITargetingLines ctrlShow false;

uiNameSpace setVariable [QGVAR(arguments), 
    [
        0,         // Last runtime
        objNull,   // currentTargetObject
        0,         // Run Time
        0,          // Lock Time
        0           // Sound timer
    ]
];