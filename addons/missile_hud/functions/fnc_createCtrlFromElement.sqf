#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Create a UI control to be added to the display.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Line <CONTROL>
 * 2: Element <ARRAY>
 *
 * Return Value:
 * Control <CONTROL>
 *
 * Example:
 * [findDisplay 46, ["TEXT", "Hello, world!", [1, 1, 0]]] call ace_missile_hud_fnc_createCtrlFromElement
 *
 * Public: No
 */

params ["_display", "_line", "_element"];
TRACE_1("createCtrlFromElement",_this);

private _ctrl = controlNull;
switch (_element select 0) do {
    case "TEXT": {
        _element params ["", "_text", "_color"];
        private _controlConfig = GVAR(config) >> "text";
        _ctrl = _display ctrlCreate [_controlConfig, -1, _line];
        _ctrl ctrlSetText _text;
        if (3 == count _color) then { _color pushBack 1; };
        _ctrl ctrlSetTextColor _color;
    };
    case "ICON": {
        _element params ["", "_path", "_color"];
        private _controlConfig = GVAR(config) >> "icon";
        _ctrl = _display ctrlCreate [_controlConfig, -1, _line];
        _ctrl ctrlSetText _path;
        if (3 == count _color) then { _color pushBack 1; };
        _ctrl ctrlSetTextColor _color;
    };
    case "SPACER": {
        private _controlConfig = GVAR(config) >> "icon";
        _ctrl = _display ctrlCreate [_controlConfig, -1, _line];
        _ctrl ctrlSetText "\A3\ui_f\data\map\markers\system\empty_ca.paa";
        _ctrl ctrlSetTextColor [0, 0, 0, 0];
    };
};

_ctrl