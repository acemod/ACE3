/*
 * Author: esteldunedain
 * Render a single interaction icon
 *
 * Argument:
 * 0: 2d position <ARRAY>
 * 1: Icon <STRING>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_sPos,_icon);

if(GVAR(iconCount) > (count GVAR(iconCtrls))-1) then {
    _displayNum = [[46, 12] select visibleMap,91919] select (uiNamespace getVariable [QGVAR(cursorMenuOpened),false]);
    GVAR(iconCtrls) pushBack ((findDisplay _displayNum) ctrlCreate ["RscStructuredText", 54021+GVAR(iconCount)]);
};

private ["_ctrl", "_pos"];
_ctrl = GVAR(iconCtrls) select GVAR(iconCount);
GVAR(iconCount) = GVAR(iconCount) + 1;

_pos = [];
if (GVAR(UseListMenu)) then {
	[_ctrl, GVAR(iconCount), format ["<img image='%1' color='#FF0000' size='1.6'/>", _icon]] call FUNC(ctrlSetParsedTextCached);
	_pos = [(_sPos select 0)-(0.014*SafeZoneW), (_sPos select 1)-(0.014*SafeZoneW), 0.05*SafeZoneW, 0.035*SafeZoneW];
} else {
	[_ctrl, GVAR(iconCount), format ["<img image='%1' color='#FF0000' size='1.6' align='center'/>", _icon]] call FUNC(ctrlSetParsedTextCached);
	_pos = [(_sPos select 0)-(0.050*SafeZoneW), (_sPos select 1)-(0.014*SafeZoneW), 0.1*SafeZoneW, 0.035*SafeZoneW];
};

if (GVAR(cursorKeepCentered) && {uiNamespace getVariable [QGVAR(cursorMenuOpened),false]}) then {
    _pos set [0, ((_pos select 0) - (GVAR(cursorPos) select 0) + 0.5)];
    _pos set [1, ((_pos select 1) - (GVAR(cursorPos) select 1) + 0.5)];
};

_ctrl ctrlSetPosition _pos;
_ctrl ctrlCommit 0;
