/**
 * fn_setRadialMenuOptions_gui.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define DEFAULT_ENTRY ["","",{}, false, ""]

private ["_display","_availableOptions","_buttonCtrl","_iconCtrl","_textCtrl","_entry","_textCtrl", "_entries", "_target", "_title", "_backgroundCtrl"];

_target = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_Param;
_entries = [_this, 1, [], [[]]] call BIS_fnc_Param;
CSE_interactionTarget = _target;


disableSerialization;
_display = uiNamespace getvariable "CSE_RADIAL_MENU";
_availableOptions = [10, 11, 12, 13, 14, 15, 16, 17];
{
	_buttonCtrl = _display displayCtrl _x;
	_iconCtrl = _display displayCtrl (_x + 90);
	_textCtrl = _display displayCtrl (_x + 190);
	_backgroundCtrl = _display displayCtrl (_x + 790);
	_buttonCtrl ctrlEnable true;
	_entry = [_entries, _foreachIndex, DEFAULT_ENTRY,[[]],[4,5]] call BIS_fnc_Param;
	if (typeName (_entry select 3) == typeName {}) then {
		if ([player, _target] call (_entry select 3)) then {
			_textCtrl ctrlSetText (_entry select 0);
			_iconCtrl ctrlSetText (_entry select 1);
			_title = _entry select 4;
			if (isnil "_title") then {
				_title = _entry select 0;
			};
			missionnamespace setvariable ["CSE_RADIAL_MENU_CODE_ON_MOUSE_IN_BUTTON_"+ str _x, format["if (!([] call cse_fnc_isOpenSecondRing_GUI) && CSE_ALLOW_ON_MOUSE_OVER_OPEN_RADIALMENU) then {[player,CSE_interactionTarget, %1, '%3'] call %2; }; true;",_x, _entry select 2, _title]];
			_buttonCtrl ctrlSetEventHandler ["ButtonClick", format["[player,CSE_interactionTarget, %1, '%3'] call %2; true;",_x, _entry select 2, _title]];
			_buttonCtrl ctrlSetTooltip (_entry select 4);
			_backgroundCtrl ctrlSetTextColor [0,0,0,0.66];
			_iconCtrl ctrlSetTextColor [1,1,1,0.66];
			_textCtrl ctrlSetTextColor [1,1,1,0.66];
		} else {
			_buttonCtrl ctrlEnable false;
			_textCtrl ctrlSetText (_entry select 0);
			_iconCtrl ctrlSetText (_entry select 1);
			_iconCtrl ctrlSetTextColor [1,1,1,0.2];
			_textCtrl ctrlSetTextColor [1,1,1,0.2];
			_buttonCtrl ctrlSetTooltip "";
			_backgroundCtrl ctrlSetTextColor [0,0,0,0.66];

			missionnamespace setvariable ["CSE_RADIAL_MENU_CODE_ON_MOUSE_IN_BUTTON_"+ str _x, ""];
		};
	} else {
		if (_entry select 3) then {
			_textCtrl ctrlSetText (_entry select 0);
			_iconCtrl ctrlSetText (_entry select 1);

			_iconCtrl ctrlSetTextColor [1,1,1,0.66];
			_textCtrl ctrlSetTextColor [1,1,1,0.66];
			_title = _entry select 4;
			if (isnil "_title") then {
				_title = _entry select 0;
			};
			missionnamespace setvariable ["CSE_RADIAL_MENU_CODE_ON_MOUSE_IN_BUTTON_"+ str _x, format["if (!([] call cse_fnc_isOpenSecondRing_GUI) && CSE_ALLOW_ON_MOUSE_OVER_OPEN_RADIALMENU) then {[player,CSE_interactionTarget, %1, '%3'] call %2; }; true;",_x, _entry select 2, _title]];
			_buttonCtrl ctrlSetEventHandler ["ButtonClick", format["[player,CSE_interactionTarget,%1 , '%3'] call %2; true;",_x, _entry select 2, _title]];
			_buttonCtrl ctrlSetTooltip (_entry select 4);
			_backgroundCtrl ctrlSetTextColor [0,0,0,0.66];
		} else {
			_buttonCtrl ctrlEnable false;
			_textCtrl ctrlSetText (_entry select 0);
			_iconCtrl ctrlSetText (_entry select 1);
			_iconCtrl ctrlSetTextColor [1,1,1,0.2];
			_textCtrl ctrlSetTextColor [1,1,1,0.2];
			missionnamespace setvariable ["CSE_RADIAL_MENU_CODE_ON_MOUSE_IN_BUTTON_"+ str _x, ""];
			_buttonCtrl ctrlSetTooltip "";
			_backgroundCtrl ctrlSetTextColor [0,0,0,0.66];
		};
	};

	_textCtrl ctrlCommit 0;
	_iconCtrl ctrlCommit 0;
	_backgroundCtrl ctrlCommit 0;
	_buttonCtrl ctrlCommit 0;
}foreach _availableOptions;