#include "script_component.hpp"

disableSerialization;

params ["_display", "_title", "_subtitle", "_information"];

if (_title isEqualType "") then {_title = parseText _title};
if (_subtitle isEqualType "") then {_subtitle = parseText _subtitle};
if (_information isEqualType "") then {_information = parseText _information};

private _idc = IDC_TOOLTIP_TITLE;
CTRL ctrlSetStructuredText _title;
CTRL ctrlCommit 0;

_idc = IDC_TOOLTIP_SUBTITLE;
CTRL ctrlSetStructuredText _subtitle;
CTRL ctrlCommit 0;

_idc = IDC_TOOLTIP_INFORMATION;
CTRL ctrlSetStructuredText _information;

private _pos = ctrlPosition CTRL;
private _height = [ctrlTextHeight CTRL, 0] select (_information == parseText "");
_pos set [3, _height];
CTRL ctrlSetPosition _pos;
CTRL ctrlCommit 0;

_idc = IDC_TOOLTIP;
_pos = ctrlPosition CTRL;
_pos set [3,2 * TT_H + _height];
CTRL ctrlSetPosition _pos;
CTRL ctrlCommit 0;
