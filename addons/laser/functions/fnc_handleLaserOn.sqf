//fnc_handleLaserOn.sqf
#include "script_component.hpp"

params ["_uuid", "_args"];
[GVAR(laserEmitters), _uuid, _args] call CBA_fnc_hashSet;
