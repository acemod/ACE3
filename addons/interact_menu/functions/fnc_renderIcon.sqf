/*
 * Author: NouberNou and esteldunedain
 * Render a single interaction icon
 *
 * Arguments:
 * 0: Text <STRING>
 * 1: Icon <STRING>
 * 2: 2d position <ARRAY>
 * 3: Text Settings <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["text", "icon", [5, 6], "text"] call ACE_interact_menu_fnc_renderIcon
 *
 * Public: No
 */
#include "script_component.hpp"
#define DEFAULT_ICON QUOTE(\z\ace\addons\interaction\ui\dot_ca.paa)

params ["_text", "_icon", "_sPos", "_textSettings"];

TRACE_2("Icon",_text,_sPos);

if(GVAR(iconCount) > (count GVAR(iconCtrls))-1) then {
    private _displayNum = [[46, 12] select visibleMap, 91919] select (uiNamespace getVariable [QGVAR(cursorMenuOpened),false]);
    GVAR(iconCtrls) pushBack ((findDisplay _displayNum) ctrlCreate ["RscStructuredText", 54021 + GVAR(iconCount)]);
    if (GVAR(useCursorMenu)) then {
        ((finddisplay _displayNum) displayctrl (54021 + GVAR(iconCount))) ctrlAddEventHandler ["MouseMoving", DFUNC(handleMouseMovement)];
        ((finddisplay _displayNum) displayctrl (54021 + GVAR(iconCount))) ctrlAddEventHandler ["MouseButtonDown", DFUNC(handleMouseButtonDown)];
    };
};
private _ctrl = GVAR(iconCtrls) select GVAR(iconCount);

if(_icon == "") then {
    _icon = DEFAULT_ICON;
};

_text = if (GVAR(UseListMenu)) then {
    format ["<img image='%1' align='left'/><t %2>%3</t>", _icon, _textSettings, _text]
} else {
    format ["<img image='%1' align='center'/><br/><t %2 align='center'>%3</t>", _icon, _textSettings, "ace_break_line" callExtension _text];
};

[_ctrl, GVAR(iconCount), _text] call FUNC(ctrlSetParsedTextCached);
GVAR(iconCount) = GVAR(iconCount) + 1;

private _pos = if (GVAR(UseListMenu)) then {
    [(_sPos select 0) - (0.0095 * SafeZoneW), (_sPos select 1) - (0.0095 * SafeZoneW), 0.20 * SafeZoneW, 0.035 * SafeZoneW]
} else {
    [(_sPos select 0) - (0.0750 * SafeZoneW), (_sPos select 1) - (0.0095 * SafeZoneW), 0.15 * SafeZoneW, 0.100 * SafeZoneW]
};

if (GVAR(cursorKeepCentered) && {uiNamespace getVariable [QGVAR(cursorMenuOpened),false]}) then {
    _pos set [0, ((_pos select 0) - (GVAR(cursorPos) select 0) + 0.5)];
    _pos set [1, ((_pos select 1) - (GVAR(cursorPos) select 1) + 0.5)];
};

_ctrl ctrlSetPosition _pos;
_ctrl ctrlCommit 0;
