// by commy2

// returns true if the unit is on foot or in a ffv position

private ["_unit", "_config"];

_unit = _this select 0;

if (_unit == vehicle _unit) exitWith {true};

_config = configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit;

isClass _config
&& {getNumber (_config >> "canPullTrigger") == 1}
