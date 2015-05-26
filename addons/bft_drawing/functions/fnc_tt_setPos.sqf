#include "script_component.hpp"

disableSerialization;
private ["_display","_pos"];
_display = _this select 0;
_pos = _this select 1;

private ["_idc","_size"];
_idc = IDC_TOOLTIP;
_size = ctrlPosition CTRL;

_pos set [2,_size select 2];
_pos set [3,_size select 3];

CTRL ctrlSetPosition _pos;
CTRL ctrlCommit 0;
