#include "script_component.hpp"
/*
 * Author: commy2
 * hint retun value of given function every frame
 *
 * Arguments:
 * <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [{code}] call ace_common_fnc_monitor
 *
 * Public: Yes
 */

if (!isNil QGVAR(MonitorFnc)) then {
    [GVAR(MonitorFnc)] call CBA_fnc_removePerFrameHandler;
};

GVAR(MonitorFnc) = [{
    hintSilent str (call (_this select 0));
}, 0, _this] call CBA_fnc_addPerFrameHandler;
