/*
 * Author: esteldunedain
 * Render a single interaction icon
 *
 * Arguments:
 * 0: 2d position <ARRAY>
 * 1: Icon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[2, 5], "icon"] call ACE_interact_menu_fnc_renderSelector
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_sPos", "_icon"];

if(GVAR(iconCount) > (count GVAR(iconCtrls))-1) then {
    private _displayNum = [[46, 12] select visibleMap,91919] select (uiNamespace getVariable [QGVAR(cursorMenuOpened),false]);
    GVAR(iconCtrls) pushBack ((findDisplay _displayNum) ctrlCreate ["RscStructuredText", 54021+GVAR(iconCount)]);
    if (GVAR(useCursorMenu)) then {
        ((finddisplay _displayNum) displayctrl (54021+GVAR(iconCount))) ctrlAddEventHandler ["MouseMoving", DFUNC(handleMouseMovement)];
        ((finddisplay _displayNum) displayctrl (54021+GVAR(iconCount))) ctrlAddEventHandler ["MouseButtonDown", DFUNC(handleMouseButtonDown)];
    };
};

private _ctrl = GVAR(iconCtrls) select GVAR(iconCount);

private _pos = if (GVAR(UseListMenu)) then {
    [_ctrl, GVAR(iconCount), format ["<img image='%1' color='#FF0000' size='1.6'/>", _icon]] call FUNC(ctrlSetParsedTextCached);
    [(_sPos select 0)-(0.014*SafeZoneW), (_sPos select 1)-(0.014*SafeZoneW), 0.05*SafeZoneW, 0.035*SafeZoneW]
} else {
    [_ctrl, GVAR(iconCount), format ["<img image='%1' color='#FF0000' size='1.6' align='center'/>", _icon]] call FUNC(ctrlSetParsedTextCached);
    [(_sPos select 0)-(0.050*SafeZoneW), (_sPos select 1)-(0.014*SafeZoneW), 0.1*SafeZoneW, 0.035*SafeZoneW]
};

GVAR(iconCount) = GVAR(iconCount) + 1;

if (GVAR(cursorKeepCentered) && {uiNamespace getVariable [QGVAR(cursorMenuOpened),false]}) then {
    _pos set [0, ((_pos select 0) - (GVAR(cursorPos) select 0) + 0.5)];
    _pos set [1, ((_pos select 1) - (GVAR(cursorPos) select 1) + 0.5)];
};

_ctrl ctrlSetPosition _pos;
_ctrl ctrlCommit 0;
