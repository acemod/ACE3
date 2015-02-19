/**
 * fn_gui_displayMessage.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private["_title", "_content","_type","_display","_headerCtrl","_contentCtrl","_contentAmountOfChars","_pos"];
_title = [_this, 0, "",[""]] call BIS_fnc_Param;
_content = [_this, 1, "",[""]] call BIS_fnc_Param;
_type = [_this, 2, 0, [0]] call BIS_fnc_Param;

if (_title != "" && _content != "") then {
	("ACE_RscDisplayMessage" call BIS_fnc_rscLayer) cutRsc ['ACE_RscDisplayMessage',"PLAIN"];

	disableSerialization;
	_display = uiNamespace getvariable 'ACE_RscDisplayMessage';
	if (!isnil "_display") then {
		_headerCtrl = _display displayCtrl 1;
		_contentCtrl = _display displayCtrl 2;

		_headerCtrl ctrlSetText _title;
		_contentCtrl ctrlSetText _content;

		// TODO get a font that has the same width characters for all. Ask Jaynus.
		_contentAmountOfChars = count (toArray _content);
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
	};
};