/*
 * Author: SilentSpike
 * Correctly handles toggling of spectator interface elements for clean UX
 *
 * Arguments:
 * None <NIL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [] call ace_spectator_fnc_updateInterface
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_display","_elements","_show"];
disableSerialization;

_display = GETUVAR(GVAR(display),displayNull);
_elements = [IDC_COMP,IDC_HELP,IDC_MAP,IDC_TOOL,IDC_UNIT];
_show = [GVAR(showComp),GVAR(showHelp),GVAR(showMap),GVAR(showTool),GVAR(showUnit)];

// Hide/show interface elements as appropriate
if (GVAR(showInterface)) then {
    {
        (_display displayCtrl _x) ctrlShow (_show select _forEachIndex);
    } forEach _elements;
} else {
    {
        (_display displayCtrl _x) ctrlShow GVAR(showInterface);
    } forEach _elements;
};
