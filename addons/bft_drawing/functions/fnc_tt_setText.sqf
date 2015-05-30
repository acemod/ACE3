#include "script_component.hpp"

disableSerialization;
private ["_display","_title","_subtitle","_information"];
_display = _this select 0;
_title = _this select 1;
if (typename _title == typename "") then {_title = parseText _title};
_subtitle = _this select 2;
if (typename _subtitle == typename "") then {_subtitle = parseText _subtitle};
_information = _this select 3;
if (typename _information == typename "") then {_information = parseText _information};

private ["_idc"];
_idc = IDC_TOOLTIP_TITLE;
CTRL ctrlSetStructuredText _title;
CTRL ctrlCommit 0;

_idc = IDC_TOOLTIP_SUBTITLE;
CTRL ctrlSetStructuredText _subtitle;
CTRL ctrlCommit 0;

_idc = IDC_TOOLTIP_INFORMATION;
CTRL ctrlSetStructuredText _information;

private ["_pos","_height"];
_pos = ctrlPosition CTRL;
_height = if (_information == parseText "") then {0} else {ctrlTextHeight CTRL};
_pos set [3,_height];
CTRL ctrlSetPosition _pos;
CTRL ctrlCommit 0;

_idc = IDC_TOOLTIP;
_pos = ctrlPosition CTRL;
_pos set [3,2 * TT_H + _height];
CTRL ctrlSetPosition _pos;
CTRL ctrlCommit 0;
