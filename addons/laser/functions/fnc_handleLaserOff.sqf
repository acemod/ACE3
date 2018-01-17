//fnc_handleLaserOff.sqf
#include "script_component.hpp"

params ["_uuid"];
if ([GVAR(laserEmitters), _uuid] call CBA_fnc_hashHasKey) then {
    [GVAR(laserEmitters), _uuid] call CBA_fnc_hashRem;
};
