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
_elements = [IDC_COMP,IDC_TOOL,IDC_UNIT];
_show = [GVAR(showComp),GVAR(showTool),GVAR(showUnit)];

// Hide/show interface elements as appropriate
if (GVAR(showInterface)) then {
    // Hide while map is open to prevent active element weirdness
    {
        (_display displayCtrl _x) ctrlShow ([(_show select _forEachIndex),false] select GVAR(showMap));
    } forEach _elements;
} else {
    {
        (_display displayCtrl _x) ctrlShow GVAR(showInterface);
    } forEach _elements;
};

// Map and help operate seperate from interface
(_display displayCtrl IDC_HELP) ctrlShow GVAR(showHelp);
(_display displayCtrl IDC_MAP) ctrlShow GVAR(showMap);
