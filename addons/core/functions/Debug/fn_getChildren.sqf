// by commy2

private ["_name", "_cfgClass", "_classes"];

_name = _this select 0;
_cfgClass = _this select 1;

_classes = format ["configName inheritsFrom _x == '%1'", _name] configClasses (configFile >> _cfgClass);
_classes = [_classes, {configName _this}] call FUNC(map);
_classes
