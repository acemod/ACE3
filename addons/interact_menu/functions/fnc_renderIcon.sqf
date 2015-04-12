/*
 * Author: NouberNou and esteldunedain
 * Render a single interaction icon
 *
 * Argument:
 * 0: Text <STRING>
 * 1: Color <STRING>
 * 2: 2d position <ARRAY>
 * 3: ?
 * 4: ?
 * 5: ?
 * 6: Icon <STRING>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"
#define DEFAULT_ICON QUOTE(\z\ace\addons\interaction\ui\dot_ca.paa)
private ["_color", "_sPos", "_ctrl", "_icon"];
_text = _this select 0;
_color = _this select 1;
_sPos = _this select 2;
_icon = _this select 6;

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
_text = format ["<img image='%1' color='%2' align='center'/><br/><t color='%3' size='0.80' align='center' shadow='1' shadowColor='#000000' shadowOffset='0.07'>%4</t>", _icon, _color, _color, "ace_breakLine" callExtension _text];
_ctrl ctrlSetStructuredText (parseText _text);
_ctrl ctrlSetPosition [(_sPos select 0)-(0.125*SafeZoneW), (_sPos select 1)-(0.0095*SafeZoneW), 0.25*SafeZoneW, 0.1*SafeZoneW];
//_ctrl ctrlSetBackgroundColor [1, 0, 0, 0.1];
_ctrl ctrlCommit 0;
