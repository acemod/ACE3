#include "script_component.hpp"

params ["_display"];

private _export = [GVAR(center), "init", true] call bis_fnc_exportInventory;

"ace_clipboard" callExtension _export;
"ace_clipboard" callExtension "--COMPLETE--";

[_display, localize "STR_a3_RscDisplayArsenal_message_clipboard"] call FUNC(message);

