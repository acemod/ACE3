/**
 * fn_gui_displayIcon.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 *
 * @Example ["myID", true, QUOTE(PATHTOF(data\icon_group.paa)), [1,1,1,1]] call ace_gui_fnc_displayIcon;
 */

#include "script_component.hpp"

#define MAX_N_ICONS 6

private ["_iconId", "_show", "_icon", "_spot", "_idc", "_display","_next_IDC", "_nextText"];
_iconId = _this select 0;
_show = _this select 1;
_icon = _this select 2;
_color = _this select 3;

disableSerialization;
_list = missionNamespace getvariable [QGVAR(displayIconList),[]];
_display = uiNamespace getvariable QGVAR(iconsDisplay);

if (isNil "_display") then {
	// Display the icons
	11401 cutRsc [QGVAR(iconsDisplay),"PLAIN"];
	_display = uiNamespace getvariable QGVAR(iconsDisplay);
};

if (_show) then {
	if ({(_x select 0 == _iconId)} count _list == 0) then {
		_list pushback [_iconId, _icon, _color];
	} else {
		{
			if (_x select 0 == _iconId) exitwith {
				_list set [_foreachIndex, [_iconId, _icon, _color]];
			};
		}foreach _list;
	};

	missionNamespace setvariable [QGVAR(displayIconList), _list];

	{
		if (_x select 0 == _iconId) exitwith {
			_idc = 10501 + _foreachIndex;
			_ctrl = _display displayCtrl _idc;
			_ctrl ctrlsetText _icon;
			_ctrl ctrlSetTextColor _color;
		};
	}foreach _list;
} else {
	if ({(_x select 0 == _iconId)} count _list == 1) then {
		_newList = [];
		{
			if (_x select 0 != _iconId) then {
				_newList pushback _x;
			};
		}foreach _list;

		missionNamespace setvariable [QGVAR(displayIconList), _newList];

		for "_i" from 0 to (MAX_N_ICONS - 1) /* step +1 */ do {
			_idc = 10501 + _i;
			_ctrl = _display displayCtrl _idc;
			_ctrl ctrlsetText "";
			_ctrl ctrlSetTextColor [1,1,1,1];
		};

		{
			_idc = 10501 + _foreachIndex;
			_ctrl = _display displayCtrl _idc;
			_ctrl ctrlsetText (_x select 1);
			_ctrl ctrlSetTextColor (_x select 2);
		}foreach _newList;
	};
};
