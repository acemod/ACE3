/*
 * Author: NouberNou and esteldunedain
 * Render a single interaction icon
 *
 * Argument:
 * 0: Text <STRING>
 * 1: Icon <STRING>
 * 2: 2d position <ARRAY>
 * 3: Color <STRING>
 * 4: Shadow Color <STRING>
 * 5: Icon Color <STRING>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"
#define DEFAULT_ICON QUOTE(\z\ace\addons\interaction\ui\dot_ca.paa)
private ["_ctrl", "_pos"];
PARAMS_6(_text,_icon,_sPos,_textColor,_shadowColor,_iconColor);

//systemChat format ["Icon %1 - %2,%3", _text, _sPos select 0, _sPos select 1];

if(GVAR(iconCount) > (count GVAR(iconCtrls))-1) then {
    _displayNum = [[46, 12] select visibleMap,91919] select (uiNamespace getVariable [QGVAR(cursorMenuOpened),false]);
    GVAR(iconCtrls) pushBack ((findDisplay _displayNum) ctrlCreate ["RscStructuredText", 54021+GVAR(iconCount)]);
};
_ctrl = GVAR(iconCtrls) select GVAR(iconCount);
GVAR(iconCount) = GVAR(iconCount) + 1;
if(_icon == "") then {
    _icon = DEFAULT_ICON;
};

_text = if (GVAR(UseListMenu)) then {
    format ["<img image='%1' color='%2' align='left'/><t color='%3' size='0.80' shadow='1' shadowColor='%4' shadowOffset='0.06'>%5</t>", _icon, _iconColor, _textColor, _shadowColor, _text]
} else {
    format ["<img image='%1' color='%2' align='center'/><br/><t color='%3' size='0.80' align='center' shadow='1' shadowColor='%4' shadowOffset='0.06'>%5</t>", _icon, _iconColor, _textColor, _shadowColor, "ace_breakLine" callExtension _text];
};

//_ctrl ctrlSetStructuredText parseText _text;
[_ctrl, GVAR(iconCount), _text] call FUNC(ctrlSetParsedTextCached);

_pos = [];
if (GVAR(UseListMenu)) then {
    _pos = [(_sPos select 0)-(0.0095*SafeZoneW), (_sPos select 1)-(0.0095*SafeZoneW), 0.20*SafeZoneW, 0.035*SafeZoneW];
} else {
    _pos = [(_sPos select 0)-(0.0750*SafeZoneW), (_sPos select 1)-(0.0095*SafeZoneW), 0.15*SafeZoneW, 0.100*SafeZoneW];
};

if (GVAR(cursorKeepCentered) && {uiNamespace getVariable [QGVAR(cursorMenuOpened),false]}) then {
    _pos set [0, ((_pos select 0) - (GVAR(cursorPos) select 0) + 0.5)];
    _pos set [1, ((_pos select 1) - (GVAR(cursorPos) select 1) + 0.5)];
};

_ctrl ctrlSetPosition _pos;
_ctrl ctrlCommit 0;
