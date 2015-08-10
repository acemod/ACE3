// by commy2
#include "script_component.hpp"

params ["_ctrl", "_index", "_text"];

//systemChat str (_text != ARR_SELECT(GVAR(ParsedTextCached),_index,"-1"));

if (_text != ARR_SELECT(GVAR(ParsedTextCached),_index,"-1")) then {
	GVAR(ParsedTextCached) set [_index, _text];
	_ctrl ctrlSetStructuredText parseText _text;
};
