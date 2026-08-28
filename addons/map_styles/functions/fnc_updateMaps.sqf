#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Updates the currently selected map layer
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_map_styles_fnc_updateMaps
 *
 * Public: No
 */

private _display = findDisplay 12;
TRACE_1("updateMaps",isNull _display);
if (isNull _display) exitWith {};

private _texButton = _display displayCtrl 1201;
if (_texButton getVariable [QGVAR(needEH), true]) then {
    _texButton setVariable [QGVAR(needEH), false];
    // button's normal action won't have any effect anymore, so we need to do it ourselves
    _texButton ctrlAddEventHandler ["ButtonClick", { [1] call FUNC(selectMap) }];
};

private _mainMap = _display displayCtrl 51;
private _mainPos = ctrlMapPosition _mainMap; // handle mid-game screen resizing
GVAR(mapCenter) = [_mainPos # 0 + (_mainPos # 2) / 2, _mainPos # 1 + (_mainPos # 3) / 2];

{
    private _ctrl = (findDisplay 12) displayCtrl _x;
    _ctrl ctrlMapSetPosition _mainPos; // does not need commit
    _ctrl ctrlEnable false;
    _ctrl ctrlShow (_x == GVAR(shownIDC));
} forEach GVAR(allMaps);

ctrlSetFocus _mainMap; // ensure main (51) is on top of the stack and will show legend
