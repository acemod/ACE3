#include "script_component.hpp"

disableSerialization;
private "_display";
_display = _this select 0;

// convert arguments
private ["_idcs","_args"];
_args = [];
_idcs = [
	// format: [TEXT_IDC,BACKGROUND_TO_CENTER_AT_IDC]
	[IDC_TOOLTIP_TITLE_TEXT,-1],
	[IDC_TOOLTIP_SUBTITLE_TEXT,-1],
	[IDC_TOOLTIP_LEFT_TEXT,IDC_TOOLTIP_LEFT_GRP],
	[IDC_TOOLTIP_RIGHT_TEXT,IDC_TOOLTIP_RIGHT_GRP]
];
{
	if (typeName _x == typeName "" || typeName _x == typeName (parseText "")) then {
		private "_array";
		_array = [_x];
		_array append (_idcs select _forEachIndex);
		_args pushBack _array;
	};
} forEach (_this select 1);

{
	private ["_idc","_text"];
	_idc = _x select 1;
	_text = "";
	if (_idc >= 0) then {
		_text = _x select 0;
	};

	if (typeName _text == typename "") then {_text = parseText _text};
	CONTROL ctrlSetStructuredText _text;
	// center the text in mid of background if necessary
	private "_pos";
	_pos = ctrlPosition CONTROL;
	if (_x select 2 >= 0) then {
		private "_height";
		_height = ctrlTextHeight CONTROL;
		_pos set [3,_height];

		private "_idc";
		_idc = _x select 2;
		_height = (((ctrlPosition CONTROL) select 3) - _height) / 2;
		_pos set [1,_height];
	};
	CONTROL ctrlSetPosition _pos;
	CONTROL ctrlCommit 0;
} forEach _args;