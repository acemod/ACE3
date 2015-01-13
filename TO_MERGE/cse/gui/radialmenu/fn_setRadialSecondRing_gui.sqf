/**
 * fn_setRadialSecondRing_gui.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define DEFAULT_ENTRY ["","",{}, false, ""]

#define ACTION_TOP 10
#define ACTION_TOP_LEFT 11
#define ACTION_TOP_RIGHT 12
#define ACTION_CENTER_LEFT 13
#define ACTION_CENTER_RIGHT 14
#define ACTION_BOTTOM_LEFT 15
#define ACTION_BOTTOM_RIGHT 16
#define ACTION_BOTTOM 17

#define OPTION_BOTTOM_LEFT_ONE 		300
#define OPTION_BOTTOM_LEFT_TWO 		301
#define OPTION_BOTTOM_LEFT_THREE 	302
#define OPTION_TOP_LEFT_ONE 		303
#define OPTION_TOP_LEFT_TWO 		304
#define OPTION_TOP_LEFT_THREE 		305
#define OPTION_TOP_RIGHT_ONE 		306
#define OPTION_TOP_RIGHT_TWO 		307
#define OPTION_TOP_RIGHT_THREE 		308
#define OPTION_BOTTOM_RIGHT_ONE 	309
#define OPTION_BOTTOM_RIGHT_TWO 	310
#define OPTION_BOTTOM_RIGHT_THREE 	311

private ["_entries","_fromInnerRing","_display","_entry","_actionFillOrder","_availableSpots","_availableOptionSpots","_buttonCtrl","_iconCtrl", "_textCtrl","_title"];
_target = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_Param;
_entries = [_this, 1, [], [[]]] call BIS_fnc_Param;
_fromInnerRing = [_this, 2, ACTION_TOP, [0]] call BIS_fnc_Param;

_availableOptionSpots = [OPTION_BOTTOM_LEFT_ONE, OPTION_BOTTOM_LEFT_TWO, OPTION_BOTTOM_LEFT_THREE, OPTION_TOP_LEFT_ONE, OPTION_TOP_LEFT_TWO, OPTION_TOP_LEFT_THREE, OPTION_BOTTOM_RIGHT_ONE, OPTION_BOTTOM_RIGHT_TWO, OPTION_BOTTOM_RIGHT_THREE, OPTION_TOP_RIGHT_ONE, OPTION_TOP_RIGHT_TWO, OPTION_TOP_RIGHT_THREE];

_bottomLeftCollection = [OPTION_BOTTOM_LEFT_ONE, OPTION_BOTTOM_LEFT_TWO, OPTION_BOTTOM_LEFT_THREE];
_topLeftCollection = [OPTION_TOP_LEFT_THREE, OPTION_TOP_LEFT_TWO, OPTION_TOP_LEFT_ONE];
_bottomRightCollection = [OPTION_BOTTOM_RIGHT_ONE, OPTION_BOTTOM_RIGHT_TWO, OPTION_BOTTOM_RIGHT_THREE];
_topRightCollection = [OPTION_TOP_RIGHT_ONE, OPTION_TOP_RIGHT_TWO, OPTION_TOP_RIGHT_THREE];

_actionFillOrder = switch (_fromInnerRing) do {
	case ACTION_TOP: { [ OPTION_TOP_LEFT_THREE,  OPTION_TOP_LEFT_TWO, OPTION_TOP_LEFT_ONE, OPTION_TOP_RIGHT_ONE, OPTION_TOP_RIGHT_TWO, OPTION_TOP_RIGHT_THREE , OPTION_BOTTOM_LEFT_THREE, OPTION_BOTTOM_LEFT_TWO , OPTION_BOTTOM_LEFT_ONE, OPTION_BOTTOM_RIGHT_ONE, OPTION_BOTTOM_RIGHT_TWO, OPTION_BOTTOM_RIGHT_THREE]};

	case ACTION_TOP_LEFT: {[OPTION_TOP_LEFT_THREE,  OPTION_TOP_LEFT_TWO, OPTION_TOP_LEFT_ONE, OPTION_BOTTOM_LEFT_THREE, OPTION_BOTTOM_LEFT_TWO , OPTION_BOTTOM_LEFT_ONE, OPTION_TOP_RIGHT_ONE, OPTION_TOP_RIGHT_TWO, OPTION_TOP_RIGHT_THREE, OPTION_BOTTOM_RIGHT_ONE, OPTION_BOTTOM_RIGHT_TWO, OPTION_BOTTOM_RIGHT_THREE ]};

	case ACTION_TOP_RIGHT: { [OPTION_TOP_RIGHT_ONE, OPTION_TOP_RIGHT_TWO, OPTION_TOP_RIGHT_THREE, OPTION_BOTTOM_RIGHT_ONE, OPTION_BOTTOM_RIGHT_TWO, OPTION_BOTTOM_RIGHT_THREE, OPTION_TOP_LEFT_THREE, OPTION_TOP_LEFT_TWO, OPTION_TOP_LEFT_ONE, OPTION_BOTTOM_LEFT_THREE, OPTION_BOTTOM_LEFT_TWO , OPTION_BOTTOM_LEFT_ONE  ]};

	case ACTION_CENTER_LEFT: {[OPTION_BOTTOM_LEFT_THREE, OPTION_BOTTOM_LEFT_TWO , OPTION_BOTTOM_LEFT_ONE, OPTION_TOP_LEFT_ONE,  OPTION_TOP_LEFT_TWO, OPTION_TOP_LEFT_THREE, OPTION_TOP_RIGHT_ONE, OPTION_TOP_RIGHT_TWO, OPTION_TOP_RIGHT_THREE, OPTION_BOTTOM_RIGHT_ONE, OPTION_BOTTOM_RIGHT_TWO, OPTION_BOTTOM_RIGHT_THREE]};

	case ACTION_CENTER_RIGHT: {[OPTION_BOTTOM_RIGHT_ONE, OPTION_BOTTOM_RIGHT_TWO, OPTION_BOTTOM_RIGHT_THREE, OPTION_TOP_RIGHT_THREE, OPTION_TOP_RIGHT_TWO, OPTION_TOP_RIGHT_ONE, OPTION_TOP_LEFT_THREE,  OPTION_TOP_LEFT_TWO,  OPTION_TOP_LEFT_ONE, OPTION_BOTTOM_LEFT_THREE, OPTION_BOTTOM_LEFT_TWO, OPTION_BOTTOM_LEFT_ONE]};

	case ACTION_BOTTOM_LEFT: {[OPTION_BOTTOM_LEFT_ONE, OPTION_BOTTOM_LEFT_TWO, OPTION_BOTTOM_LEFT_THREE, OPTION_TOP_LEFT_ONE, OPTION_TOP_LEFT_TWO, OPTION_TOP_LEFT_THREE, OPTION_TOP_RIGHT_ONE, OPTION_TOP_RIGHT_TWO, OPTION_TOP_RIGHT_THREE, OPTION_BOTTOM_RIGHT_ONE, OPTION_BOTTOM_RIGHT_TWO, OPTION_BOTTOM_RIGHT_THREE]};

	case ACTION_BOTTOM_RIGHT: {[OPTION_BOTTOM_RIGHT_THREE, OPTION_BOTTOM_RIGHT_TWO, OPTION_BOTTOM_RIGHT_ONE, OPTION_TOP_RIGHT_THREE, OPTION_TOP_RIGHT_TWO, OPTION_TOP_RIGHT_ONE, OPTION_TOP_LEFT_THREE,  OPTION_TOP_LEFT_TWO,  OPTION_TOP_LEFT_ONE, OPTION_BOTTOM_LEFT_THREE, OPTION_BOTTOM_LEFT_TWO, OPTION_BOTTOM_LEFT_ONE ] };

	case ACTION_BOTTOM: {[OPTION_BOTTOM_LEFT_ONE, OPTION_BOTTOM_LEFT_TWO, OPTION_BOTTOM_LEFT_THREE, OPTION_TOP_LEFT_ONE, OPTION_TOP_LEFT_TWO, OPTION_TOP_LEFT_THREE, OPTION_BOTTOM_RIGHT_ONE, OPTION_BOTTOM_RIGHT_TWO, OPTION_BOTTOM_RIGHT_THREE, OPTION_TOP_RIGHT_ONE, OPTION_TOP_RIGHT_TWO, OPTION_TOP_RIGHT_THREE]};

	default {[OPTION_BOTTOM_LEFT_ONE, OPTION_BOTTOM_LEFT_TWO, OPTION_BOTTOM_LEFT_THREE, OPTION_TOP_LEFT_ONE, OPTION_TOP_LEFT_TWO, OPTION_TOP_LEFT_THREE, OPTION_BOTTOM_RIGHT_ONE, OPTION_BOTTOM_RIGHT_TWO, OPTION_BOTTOM_RIGHT_THREE, OPTION_TOP_RIGHT_ONE, OPTION_TOP_RIGHT_TWO, OPTION_TOP_RIGHT_THREE]};
};

_showBottomLeft = false;
_showTopLeft = false;
_showTopRight = false;
_showBottomRight = false;

_determineShowBackGroundVariables = {
	private ["_idc"];
	_idc = (_this select 0);
	if (_idc in _bottomLeftCollection) then {
		_showBottomLeft = true;
	} else {
		if (_idc in _topLeftCollection) then {
				_showTopLeft = true;
		} else {
			if (_idc in _topRightCollection) then {
				_showTopRight = true;
			} else {
				if (_idc in _bottomRightCollection) then {
					_showBottomRight = true;
				};
			};
		};
	};
};




disableSerialization;
_display = uiNamespace getvariable "CSE_RADIAL_MENU";

{
	_buttonCtrl = _display displayCtrl _x;
	_iconCtrl = _display displayCtrl (_x + 50);
	_textCtrl = _display displayCtrl (_x + 100);
	_buttonCtrl ctrlEnable true;
	_entry = [_entries, _foreachIndex, DEFAULT_ENTRY,[[]],[4,5]] call BIS_fnc_Param;
	if (typeName (_entry select 3) == typeName {}) then {
		if ([player, _target] call (_entry select 3)) then {
			_textCtrl ctrlSetText (_entry select 0);
			_iconCtrl ctrlSetText (_entry select 1);
			if (count _entry < 5) then {
				_title = _entry select 0;
			} else {
				_title = _entry select 4;
			};
			_buttonCtrl ctrlSetEventHandler ["ButtonClick", format["[player,CSE_interactionTarget,%1 , '%3'] call %2; true;",_x, _entry select 2, _title]];
			_buttonCtrl ctrlSetTooltip _title;

			[_x] call _determineShowBackGroundVariables;
		} else {
			_buttonCtrl ctrlEnable false;
			_iconCtrl ctrlSetText "";
			_textCtrl ctrlSetText "";
			_buttonCtrl ctrlSetTooltip "";
		};
	} else {
		if (_entry select 3) then {
			_textCtrl ctrlSetText (_entry select 0);
			_iconCtrl ctrlSetText (_entry select 1);

			if (count _entry < 5) then {
				_title = _entry select 0;
			} else {
				_title = _entry select 4;
			};
			_buttonCtrl ctrlSetEventHandler ["ButtonClick", format["[player,CSE_interactionTarget,%1 , '%3'] call %2; true;",_x, _entry select 2, _title]];
			_buttonCtrl ctrlSetTooltip _title;
			[_x] call _determineShowBackGroundVariables;
		} else {
			_buttonCtrl ctrlEnable false;
			_iconCtrl ctrlSetText "";
			_textCtrl ctrlSetText "";
			_buttonCtrl ctrlSetTooltip "";
		};
	};

	_textCtrl ctrlCommit 0;
	_iconCtrl ctrlCommit 0;
	_buttonCtrl ctrlCommit 0;
}foreach _actionFillOrder;


if (_showBottomLeft) then {
 	(_display displayCtrl 702) ctrlSetTextColor [0,0,0,0.66];
} else {
	(_display displayCtrl 702) ctrlSetTextColor [0,0,0,0.0];
};
(_display displayCtrl 702) ctrlCommit 0;


if (_showTopLeft) then {
 	(_display displayCtrl 700) ctrlSetTextColor [0,0,0,0.66];
} else {
	(_display displayCtrl 700) ctrlSetTextColor [0,0,0,0.0];
};
(_display displayCtrl 700) ctrlCommit 0;


if (_showTopRight) then {
 	(_display displayCtrl 701) ctrlSetTextColor [0,0,0,0.66];
} else {
	(_display displayCtrl 701) ctrlSetTextColor [0,0,0,0.0];
};
(_display displayCtrl 701) ctrlCommit 0;


if (_showBottomRight) then {
 	(_display displayCtrl 703) ctrlSetTextColor [0,0,0,0.66];
} else {
	(_display displayCtrl 703) ctrlSetTextColor [0,0,0,0.0];
};
(_display displayCtrl 703) ctrlCommit 0;

