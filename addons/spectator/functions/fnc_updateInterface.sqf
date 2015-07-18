#include "script_component.hpp"

private ["_display","_elements","_show"];
disableSerialization;

_display = GETUVAR(GVAR(display),displayNull);
_elements = [IDC_COMP,IDC_HELP,IDC_MAP,IDC_TOOL,IDC_UNIT];
_show = [GVAR(showComp),GVAR(showHelp),GVAR(showMap),GVAR(showTool),GVAR(showUnit)];

// Hide/show interface elements in accordance with good UX design
if (GVAR(showInterface)) then {
    {
        (_display displayCtrl _x) ctrlShow (_show select _forEachIndex);
    } forEach _elements;
} else {
    {
        (_display displayCtrl _x) ctrlShow GVAR(showInterface);
    } forEach _elements;
};
