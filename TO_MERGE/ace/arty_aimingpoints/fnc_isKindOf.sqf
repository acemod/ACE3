#include "script_component.hpp"

private["_ret", "_parent"];

PARAMS_3(_mag,_type,_superClass);

_ret = false;

_parent = configName (inheritsFrom ( configFile >> _superClass >> _mag));
while { _parent != "" } do {
	if (_parent == _type) exitWith {
		_ret = true;
	};
	_parent = configName (inheritsFrom ( configFile >> _superClass >> _parent));
};

_ret