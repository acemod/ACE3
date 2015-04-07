#include "script_component.hpp"

if(!isNil "_this") then {
    if( (count _this) > 2) then {
        EXPLODE_3_PVT((_this select 0),_vehicle,_shooter,_laserTarget);
        // We got the optional vehicle list, clear the parameters
        _vehicle setVariable[QGVAR(currentTarget), [], true];
    };
};

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

deleteVehicle GVAR(laser);
GVAR(laser) = nil;
GVAR(active) = false;



true