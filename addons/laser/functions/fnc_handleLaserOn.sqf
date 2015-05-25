//fnc_handleLaserOn.sqf
#include "script_component.hpp"

private ["_uuid", "_args"];
_uuid = _this select 0;
_args = _this select 1;
HASH_SET(GVAR(laserEmitters), _uuid, _args);
