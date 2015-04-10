#include "script_component.hpp"

if(isNil QGVAR(laser)) exitWith {
    false
};
if(!local GVAR(laser)) then {
    false 
};

_handle = GVAR(laser) getVariable ["ACE_PFH_HANDLE", nil];
if(!isNil "_handle") then {
    [_handle] call cba_fnc_removePerFrameHandler;
};

REM(ACE_LASERS, GVAR(laser));
deleteVehicle GVAR(laser);
GVAR(laser) = nil;
GVAR(laserActive) = false;

true