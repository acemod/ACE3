#include "script_component.hpp"

params ["_display"];

private _center = missionNamespace getVariable [QGVAR(center), player];
private _export = copyToClipboard ([_center, "init", true] call bis_fnc_exportInventory);

[_display, localize "STR_a3_RscDisplayArsenal_message_clipboard"] call FUNC(arsenalMessage);