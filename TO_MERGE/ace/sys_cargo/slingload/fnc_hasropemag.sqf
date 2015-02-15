private ["_r"];

#include "script_component.hpp"

_r = "";
{
	if (getNumber(configFile >> "CfgMagazines" >> _x >> "ACE_SlingRope") == 1) exitWith {_r = _x};
} forEach magazines player;
_r