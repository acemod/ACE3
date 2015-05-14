/*
 * Author: Garth de Wet (LH)
 * Scrolls through the list down or up
 *
 * Arguments:
 * 0: Amount <NUMBER>
 *
 * Return value:
 * None
 *
 * Example:
 * [2] call ace_interaction_fnc_moveDown
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_count", "_player", "_vehicle", "_dlgInteractionDialog", "_top", "_i", "", "_ctrl", "_index", "_action", "_color", "_current", "_infoText"];

#define CLAMP(x,low,high) (if(x > high)then{high}else{if(x < low)then{low}else{x}})
if (isNil QGVAR(MainButton)) exitWith{};
if (isNil QGVAR(Buttons)) exitWith{};
_count = (count GVAR(Buttons))- 1;
GVAR(SelectedButton) = CLAMP(GVAR(SelectedButton) + _this, 0, _count);

_target = GVAR(Target);
_player = ACE_player;
_vehicle = vehicle _player;

disableSerialization;
_dlgInteractionDialog = uiNamespace getVariable QGVAR(Flow_Display);
_top = GVAR(SelectedButton) - 2;
_i = 0;
while {_i <= 4} do {
    _index =_i + _top;
    _ctrl = _dlgInteractionDialog displayCtrl (1200 + _i);
    if (_index >= 0 && {_index <= _count}) then {
        _action = GVAR(Buttons) select _index;
        _ctrl ctrlShow true;
        _ctrl ctrlSetText (_action select 5);
        _color = [1,1,1,1];
        if !([_target, _player] call (_action select 2)) then {
            _color = [0.3,0.3,0.3,0.8];
        };
        if (_i == 0 || _i == 4) then {
            _color set [3, 0.5];
        };
        if (_i == 1 || _i == 3) then {
            _color set [3, 0.75];
        };
        _ctrl ctrlSetTextColor _color;
    }else{
        _ctrl ctrlShow false;
    };
    _i = _i + 1;
};

_ctrl = _dlgInteractionDialog displayCtrl 1000;
_ctrl ctrlSetText ((GVAR(Buttons) select GVAR(SelectedButton)) select 0);
_ctrl = _dlgInteractionDialog displayCtrl 1100;
_current = (GVAR(Buttons) select GVAR(SelectedButton));
_infoText = "";
if !([_target, _player] call (_current select 2)) then {
    _infoText = "Unavailable";
};
_ctrl ctrlSetText _infoText;
_ctrl ctrlShow (_infoText != "");
