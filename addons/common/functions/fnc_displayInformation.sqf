/**
 * fn_gui_displayInformation.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

#define DISPLAY_LAYER 32547

private["_title", "_content","_type","_display","_headerCtrl","_contentCtrl","_contentAmountOfChars","_pos","_icon","_iconCtrl"];
_title = [_this, 0, "",[""]] call BIS_fnc_Param;
_content = [_this, 1, [""],[[""]]] call BIS_fnc_Param;
_type = [_this, 2, 0, [0]] call BIS_fnc_Param;
_icon = [_this, 3, "",[""]] call BIS_fnc_Param;

if (_title != "") then {
	DISPLAY_LAYER cutRsc ['ACE_RscDisplayInformation',"PLAIN"];

	disableSerialization;
	_display = uiNamespace getvariable 'ACE_RscDisplayInformation';
	if (!isnil "_display") then {
		_headerCtrl = _display displayCtrl 1;
		_headerCtrl ctrlSetText _title;
		_iconCtrl = _display displayCtrl 10;
		_iconCtrl ctrlSetText _icon;

		_idc = 2;
		{
			_text = _x;
			if (_text != "") then {
				_contentCtrl = _display displayCtrl _idc;
				_contentCtrl ctrlSetText _text;

				_contentAmountOfChars = count (toArray _text);
				_pos = ctrlPosition _contentCtrl;
				_pos set [2, _contentAmountOfChars * ((((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)/ 3.3) max (safeZoneW / 11)];
				_contentCtrl ctrlSetPosition _pos;
				_contentCtrl ctrlCommit 0;


				if (_type >0) then {
					if (_type == 1) then {
						_contentCtrl ctrlSetBackgroundColor [0.7,0.2,0.2,0.8];
						_contentCtrl ctrlSetTextColor [1,1,1,0.9];
					};
				};
				_idc = _idc + 1;
			};
		}foreach _content;

		while {(_idc < 7)} do {
			_contentCtrl = _display displayCtrl _idc;
			_contentCtrl ctrlSetPosition [0,0,0,0];
			_contentCtrl ctrlCommit 0;

			_idc = _idc + 1;
		};
	};
} else {

	DISPLAY_LAYER cutText ["","PLAIN"];
};