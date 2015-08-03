// by commy2
#include "script_component.hpp"

// returns true if the unit is on foot or in a ffv position

private ["_config"];

params ["_unit"];

if (_unit == vehicle _unit) exitWith {true};

_config = configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _unit;

isClass _config
&& {getNumber (_config >> "canPullTrigger") == 1}
