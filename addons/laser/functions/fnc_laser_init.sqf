#include "script_component.hpp"
PARAMS_1(_laserTarget);

TRACE_1("enter", _this);

// Add the target to the global targets array
// Everyone tracks them

// Add the laser localized to the laser array, and give it the default localized code
PUSH(ACE_LASERS, _laserTarget);
// Check the vehicle, otherwise use the default
_laserTarget setVariable ["ACE_LASERTARGET_CODE", ACE_DEFAULT_LASER_CODE, false];
// Clean the lasers of any null objects while we are here
REM(ACE_LASERS, objNull);

if(!(local _laserTarget)) exitWith { };
// The target is local, so its on this client
if(!isDedicated) then {
    _laserTarget setVariable ["ACE_LASERTARGET_SHOOTER", ACE_player, true];
    
    [FUNC(laserTargetPFH), 0, [_laserTarget, ACE_player]] call cba_fnc_addPerFrameHandler;
} else {
    // server side ownership of laser 
    //_laserTarget setVariable ["ACE_LASERTARGET_SHOOTER", nil, false];
};
