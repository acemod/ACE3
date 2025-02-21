#include "script_component.hpp"

if (hasInterface) then {
    GVAR(module_laser_pfh) = -1;
    ["ace_laserOn", {
        if !(["ace_laser"] call QEFUNC(common,isModLoaded)) exitWith {};
        // immediately buzz if this laser is targeted at us
        params ["", "_args"];
        _args params ["_source", "", "_method"];
        if (_method != QEFUNC(laser,findLaserSource)) exitWith {}; // Normal vanilla laserTarget fnc
        (_args call QEFUNC(laser,findLaserSource)) params ["_source", "_direction"];
        [_source, _direction] call FUNC(newLaser);
        if (GVAR(module_laser_pfh) < 0) then {
            GVAR(module_laser_pfh) = [LINKFUNC(pfh_processLases), PROCESS_DELAY] call CBA_fnc_addPerFrameHandler;
        }
    }] call CBA_fnc_addEventHandler;
    [QGVAR(ping), LINKFUNC(newLaser)] call CBA_fnc_addEventHandler;
};