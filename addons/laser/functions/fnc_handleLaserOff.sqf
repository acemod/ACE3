//fnc_handleLaserOff.sqf
#include "script_component.hpp"

private ["_uuid"];
_uuid = _this select 0;
if(HASH_HASKEY(GVAR(laserEmitters), _uuid)) then {
    HASH_REM(GVAR(laserEmitters), _uuid);
};
