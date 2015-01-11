//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private["_pos", "_atl"];

PARAMS_2(_stake,_action);

_atl = getPosATL _stake;
if ((_atl select 2) <= -1.75 && {_action < 0}) exitWith { };
if ((_atl select 2) >= 0 && {_action > 0}) exitWith { };

_pos = getPos _stake;
_pos set[2, (_pos select 2) + _action];

_stake setPos _pos;
{
	_x reveal _obj;
} forEach playableUnits;
