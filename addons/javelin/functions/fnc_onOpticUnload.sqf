/*
 * Author: Jaynus
 * ?
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_javelin_fnc_onOpticUnload
 *
 * Public: No
 */
#include "script_component.hpp"
TRACE_1("enter", _this);
private["_args", "_disableFireEH"];

// uiNameSpace setVariable ['ACE_RscOptics_javelin',nil];

if(GVAR(pfehID) != -1) then {
    [GVAR(pfehID)] call CBA_fnc_removePerFrameHandler;
    GVAR(pfehID) = -1;
};

_args = GVAR(arguments);
if(!isNil "_args") then {
    _disableFireEH = _args select 6;
    if(_disableFireEH > 0  && difficulty > 0) then {
        [ACE_player, "DefaultAction", _disableFireEH] call EFUNC(common,removeActionEventHandler);
    };
    missionNameSpace setVariable [QGVAR(arguments),nil];
};
