// by commy2
#include "script_component.hpp"

PARAMS_1(_weapon);

private ["_mode"];
_mode = getArray (configFile >> "CfgWeapons" >> _weapon >> "modes") select 0;

[_mode, _weapon] select (_mode == "this")
