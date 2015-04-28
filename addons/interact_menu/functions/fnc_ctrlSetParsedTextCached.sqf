// by commy2
#include "script_component.hpp"

private ["_ctrl", "_index", "_text"];

_ctrl = _this select 0;
_index = _this select 1;
_text = _this select 2;

//systemChat str (_text != ARR_SELECT(GVAR(ParsedTextCached),_index,"-1"));

if (_text != ARR_SELECT(GVAR(ParsedTextCached),_index,"-1")) then {
	GVAR(ParsedTextCached) set [_index, _text];
	_ctrl ctrlSetStructuredText parseText _text;
};
