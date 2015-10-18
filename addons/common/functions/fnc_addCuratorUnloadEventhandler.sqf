/*
 * Author: commy2
 *
 * Arguments:
 * Display where the Unload event was added <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

private "_dlg";
_dlg = ctrlParent _this;

_dlg displayAddEventHandler ["unload", {
    if (_this select 1 == 1) then {
        [missionnamespace getvariable ["BIS_fnc_initCuratorAttributes_target", objNull]] call FUNC(fixCrateContent);
    };
}];
