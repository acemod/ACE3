#include "script_component.hpp"

disableSerialization;

params ["_display", "_pos"];

private _idc = IDC_TOOLTIP;
private _size = ctrlPosition CTRL;

_pos set [2, _size select 2];
_pos set [3, _size select 3];

CTRL ctrlSetPosition _pos;
CTRL ctrlCommit 0;
