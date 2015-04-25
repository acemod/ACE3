// by commy2
#include "script_component.hpp"

private ["_ctrl", "_index", "_text"];

_ctrl = _this select 0;
_index = _this select 1;
_text = _this select 2;

if (_text != Str(ARR_SELECT(GVAR(ParsedTextCached),_index,""))) then {
	GVAR(ParsedTextCached) set [_index, _text];
	_ctrl ctrlSetStructuredText parseText _text;
};
