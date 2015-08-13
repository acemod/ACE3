/*
 * Author: Jaynus
 * ?
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_javelin_fnc_onOpticLoad
 *
 * Public: No
 */
#include "script_component.hpp"
TRACE_1("enter", _this);

#define __LOCKONTIMERANDOM 2    // Deviation in lock on ACE_time

if((count _this) > 0) then {
    uiNameSpace setVariable ['ACE_RscOptics_javelin',_this select 0];
};

ACE_player setVariable ["ace_missileguidance_target",nil, false];

__JavelinIGUISeek ctrlSetTextColor __ColorGray;
__JavelinIGUINFOV ctrlSetTextColor __ColorGray;

__JavelinIGUITargeting ctrlShow false;
__JavelinIGUITargetingConstrains ctrlShow false;
__JavelinIGUITargetingGate ctrlShow false;
__JavelinIGUITargetingLines ctrlShow false;

if(GVAR(pfehID) != -1) then {
    [] call FUNC(onOpticUnload); // Unload optic if it was already loaded
};

QGVAR(arguments) = [
                        ACE_diagTime,         // Last runtime
                        objNull,   // currentTargetObject
                        0,         // Run Time
                        0,          // Lock Time
                        0,           // Sound timer
                        (random __LOCKONTIMERANDOM), // random lock ACE_time addition
                        -1
                    ];

GVAR(pfehID) = [FUNC(onOpticDraw), 0, []] call CBA_fnc_addPerFrameHandler;
