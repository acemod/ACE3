#include "..\script_component.hpp"
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

params ["_sPos", "_icon"];

if(GVAR(iconCount) > (count GVAR(iconCtrls))-1) then {
    private _displayNum = [[46, 12] select visibleMap,91919] select (uiNamespace getVariable [QGVAR(cursorMenuOpened),false]);
    GVAR(iconCtrls) pushBack ((findDisplay _displayNum) ctrlCreate ["RscStructuredText", 54021+GVAR(iconCount)]);
    if (GVAR(useCursorMenu)) then {
        ((findDisplay _displayNum) displayCtrl (54021+GVAR(iconCount))) ctrlAddEventHandler ["MouseMoving", DFUNC(handleMouseMovement)];
        ((findDisplay _displayNum) displayCtrl (54021+GVAR(iconCount))) ctrlAddEventHandler ["MouseButtonDown", DFUNC(handleMouseButtonDown)];
    };
};

private _ctrl = GVAR(iconCtrls) select GVAR(iconCount);

private _pos = if (GVAR(UseListMenu)) then {
    [_ctrl, GVAR(iconCount), format ["<img image='%1' color='%2' size='1.6'/>", _icon, GVAR(selectorColorHex)]] call FUNC(ctrlSetParsedTextCached);
    [(_sPos select 0)-(0.014*safeZoneW), (_sPos select 1)-(0.014*safeZoneW), 0.05*safeZoneW, 0.035*safeZoneW]
} else {
    [_ctrl, GVAR(iconCount), format ["<img image='%1' color='%2' size='1.6' align='center'/>", _icon, GVAR(selectorColorHex)]] call FUNC(ctrlSetParsedTextCached);
    [(_sPos select 0)-(0.050*safeZoneW), (_sPos select 1)-(0.014*safeZoneW), 0.1*safeZoneW, 0.035*safeZoneW]
};

GVAR(iconCount) = GVAR(iconCount) + 1;

if (([GVAR(cursorKeepCentered), GVAR(cursorKeepCenteredSelfInteraction)] select GVAR(keyDownSelfAction)) && {uiNamespace getVariable [QGVAR(cursorMenuOpened), false]}) then {
    _pos set [0, ((_pos select 0) - (GVAR(cursorPos) select 0) + 0.5)];
    _pos set [1, ((_pos select 1) - (GVAR(cursorPos) select 1) + 0.5)];
};

_ctrl ctrlSetPosition _pos;
_ctrl ctrlCommit 0;
