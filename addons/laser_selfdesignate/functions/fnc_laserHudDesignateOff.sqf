/*
 * Author: jaynus
 * Turns off passed laser self designation.
 *
 * Argument:
 * 0: Shooter, player shooting the laser
 * 1: LaserUUID, the UUID of the laser returned by EFUNC(laser,laserOn)
 * 2: Local laser target, unused.
 * 
 * Return value:
 *    true
 */
#include "script_component.hpp"

if( (count _this) > 2) then {
    EXPLODE_3_PVT(_this,_shooter,_laserUuid,_localLaserTarget);

    [_laserUuid] call EFUNC(laser,laserOff);
    // @TODO: Nou gets to field all tickets about missing lasers.
    //deleteVehicle _localLaserTarget;
};

GVAR(active) = false;

if(!isNil QGVAR(selfDesignateHandle)) then {
    [GVAR(selfDesignateHandle)] call CBA_fnc_removePerFrameHandler;
    GVAR(selfDesignateHandle) = nil;
};

true