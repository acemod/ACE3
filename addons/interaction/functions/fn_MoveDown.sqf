/*
	Name: AGM_Interaction_fnc_MoveDown
	
	Author: Garth de Wet (LH)
	
	Description:
		Depending on the passed value, either scrolls down through the list or up.
	
	Parameters: 
		NUMBER - Amount to increase current interaction target
	
	Returns:
		Nothing
	
	Example:
		1 call AGM_Interaction_fnc_MoveDown;
		-1 call AGM_Interaction_fnc_MoveDown;
*/
#define CLAMP(x,low,high) (if(x > high)then{high}else{if(x < low)then{low}else{x}})
if (isNil "AGM_Interaction_MainButton") exitWith{};
if (isNil "AGM_Interaction_Buttons") exitWith{};
_count = (count AGM_Interaction_Buttons)- 1;
AGM_Interaction_SelectedButton = CLAMP(AGM_Interaction_SelectedButton + _this, 0, _count);

_target = AGM_Interaction_Target;
_player = AGM_player;
_vehicle = vehicle _player;

disableSerialization;
_dlgInteractionDialog = uiNamespace getVariable "AGM_Flow_Display";
_top = AGM_Interaction_SelectedButton - 2;
_i = 0;
while {_i <= 4} do {
	_index =_i + _top;
	_ctrl = _dlgInteractionDialog displayCtrl (1200 + _i);
	if (_index >= 0 && {_index <= _count}) then {
		_action = AGM_Interaction_Buttons select _index;
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
_ctrl ctrlSetText ((AGM_Interaction_Buttons select AGM_Interaction_SelectedButton) select 0);
_ctrl = _dlgInteractionDialog displayCtrl 1100;
_current = (AGM_Interaction_Buttons select AGM_Interaction_SelectedButton);
_infoText = "";
if !([_target, _player] call (_current select 2)) then {
	_infoText = "Unavailable";
};
_ctrl ctrlSetText _infoText;
_ctrl ctrlShow (_infoText != "");
