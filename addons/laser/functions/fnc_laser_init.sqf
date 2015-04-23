//#define DEBUG_MODE_FULL
#include "script_component.hpp"
TRACE_1("enter", _this);

PARAMS_1(_laserTarget);
private["_uuid"];

// Add the target to the global targets array
// Everyone tracks them
// Add the laser localized to the laser array, and give it the default localized code
PUSH(GVAR(VanillaLasers), _laserTarget);

// Check the vehicle, otherwise use the default
_laserTarget setVariable [QGVAR(code), ACE_DEFAULT_LASER_CODE, false];
_laserTarget setVariable [QGVAR(beamSpread), ACE_DEFAULT_LASER_BEAMSPREAD, false];
_laserTarget setVariable [QGVAR(waveLength), ACE_DEFAULT_LASER_WAVELENGTH, false];

// Clean the lasers of any null objects while we are here
REM(GVAR(VanillaLasers), objNull);

if(!(local _laserTarget)) exitWith { };

// The target is local, so its on this client
if(!isDedicated) then {
    // @TODO: Get ownership variables and set them on the vehicle

    _uuid = [(vehicle ACE_player), ACE_player, QFUNC(vanillaLaserSeekerHandler), ACE_DEFAULT_LASER_WAVELENGTH, ACE_DEFAULT_LASER_CODE, ACE_DEFAULT_LASER_BEAMSPREAD] call FUNC(laserOn);
    _laserTarget setVariable [QGVAR(uuid), _uuid, false];   
   [FUNC(laserTargetPFH), 0, [_laserTarget, ACE_player, _uuid]] call cba_fnc_addPerFrameHandler;
} else {
    // server side ownership of laser 
    _laserTarget setVariable [QGVAR(owner), nil, true];
};
