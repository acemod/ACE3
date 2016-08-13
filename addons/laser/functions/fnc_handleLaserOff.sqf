//fnc_handleLaserOff.sqf
#include "script_component.hpp"

private ["_uuid"];
_uuid = _this select 0;
if ([GVAR(laserEmitters), _uuid] call CBA_fnc_hashHasKey) then {
    [GVAR(laserEmitters), _uuid] call CBA_fnc_hashRem;
};
