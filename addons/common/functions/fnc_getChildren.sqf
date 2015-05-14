// by commy2
#include "script_component.hpp"

private ["_classes"];

PARAMS_2(_name,_cfgClass);

_classes = format ["configName inheritsFrom _x == '%1'", _name] configClasses (configFile >> _cfgClass);
_classes = [_classes, {configName _this}] call FUNC(map);
_classes
