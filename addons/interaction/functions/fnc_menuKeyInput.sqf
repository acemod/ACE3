// by commy2
#include "script_component.hpp"

private "_key";

_key = _this select 1;

if (_key in [28, 57, 156, 200, 208, 203, 205, 201, 209]) exitWith {true};

_index = GVAR(Shortcuts) find _key;

if (_index != -1 && {ctrlEnabled (findDisplay 1713999 displayCtrl (_index + 10))}) exitWith {
	_index call FUNC(onClick);
	true
};

false
