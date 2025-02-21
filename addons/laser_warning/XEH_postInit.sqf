#include "script_component.hpp"

if (hasInterface) then {
    GVAR(sound_hash) = createHashMap;
    GVAR(sound_setting) = AUDIO_SETTING_PURE;
    GVAR(sound_pure) = QGVAR(pure);
    GVAR(sound_laser) = QGVAR(laser);
    GVAR(sound_oclock) = SOUND_OCLOCK_0;
    GVAR(sound_numbers) = SOUND_BEARINGS_0; 
    GVAR(sound_headings) = SOUND_HEADINGS_0; 
    GVAR(sound_relative) = SOUND_RELATIVE_0; 

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