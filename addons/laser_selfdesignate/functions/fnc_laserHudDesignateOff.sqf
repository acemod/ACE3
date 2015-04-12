#include "script_component.hpp"

if( (count _this) > 2) then {
    EXPLODE_3_PVT(_this,_shooter,_laserUuid, _localLaserTarget);

    [_laserUuid] call EFUNC(laser,laserOff);
    // @TODO: Nou gets to field all tickets about missing lasers.
    //deleteVehicle _localLaserTarget;
};

GVAR(active) = false;

true