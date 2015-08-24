/*
 * Author: commy2
 *
 * ?
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * ?
 *
 * Public: ?
 */
#include "script_component.hpp"

if (!isNil QGVAR(MonitorID)) then {
    [GVAR(MonitorID)] call CBA_fnc_removePerFrameHandler;
    GVAR(MonitorID) = nil;
};

[{
    hintSilent str(call ((_this select 0) select 0))
},0, [_this]] call CBA_fnc_addPerFrameHandler;
