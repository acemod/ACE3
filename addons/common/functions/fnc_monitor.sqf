/*
 * Author: commy2
 * hint retun value of given function every frame
 *
 * Argument:
 * <CODE>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

if (!isNil QGVAR(MonitorFnc)) then {
    [GVAR(MonitorFnc)] call CBA_fnc_removePerFrameHandler;
};

GVAR(MonitorFnc) = [{
    hintSilent str (call (_this select 0));
}, 0, _this] call CBA_fnc_addPerFrameHandler;
