#include "script_component.hpp"

GVAR(fcs_vehicleCache) = createHashMap;
["Tank", "init", LINKFUNC(ai_simulateLase), true, [], true] call CBA_fnc_addClassEventHandler;
["Wheeled_APC_F", "init", LINKFUNC(ai_simulateLase), true, [], true] call CBA_fnc_addClassEventHandler;

["Car", "init", LINKFUNC(initialiseVehicle), true, [], true] call CBA_fnc_addClassEventHandler;
["Tank", "init", LINKFUNC(initialiseVehicle), true, [], true] call CBA_fnc_addClassEventHandler;
["Helicopter", "init", LINKFUNC(initialiseVehicle), true, [], true] call CBA_fnc_addClassEventHandler;
["Plane", "init", LINKFUNC(initialiseVehicle), true, [], true] call CBA_fnc_addClassEventHandler;
["Ship_F", "init", LINKFUNC(initialiseVehicle), true, [], true] call CBA_fnc_addClassEventHandler;

// Temporary event until CBA is updated
if (hasInterface) then {
    [QGVAR(say3D), {
        params ["_object", "_params", "_attach"];

        // Attaching is mainly meant for vehicles in motion
        private _source = _object say3D _params;
        if (_attach) then {
            [{
                params ["_args", "_pfhId"];
                _args params ["_source", "_attach"];
                if (isNull _source || isNull _attach) exitWith {
                    // idk why, but attachTo makes the sound NOT play. So we have to do a PFH instead :/
                    deleteVehicle _source;
                    [_pfhId] call CBA_fnc_removePerFrameHandler;
                };
                _source setPosASL getPosASLVisual _attach;
            }, 0, [_source, _object]] call CBA_fnc_addPerFrameHandler;
        };
    }] call CBA_fnc_addEventHandler;
};

if (isServer) then {
    ["Car", "init", LINKFUNC(initialiseObject), true, [], true] call CBA_fnc_addClassEventHandler;
    ["Tank", "init", LINKFUNC(initialiseObject), true, [], true] call CBA_fnc_addClassEventHandler;
    ["Helicopter", "init", LINKFUNC(initialiseObject), true, [], true] call CBA_fnc_addClassEventHandler;
    ["Plane", "init", LINKFUNC(initialiseObject), true, [], true] call CBA_fnc_addClassEventHandler;
    ["Ship_F", "init", LINKFUNC(initialiseObject), true, [], true] call CBA_fnc_addClassEventHandler;

    GVAR(module_laser_pfh) = -1;
    ["ace_laserOn", {
        if !(["ace_laser"] call EFUNC(common,isModLoaded)) exitWith {};
        // immediately buzz if this laser is targeted at us
        params ["", "_args"];
        _args params ["_source", "", "_method"];
        TRACE_2("laser on",_source,_method);
        if (_method isEqualType {} && { _method isNotEqualTo EFUNC(laser,findLaserSource) }) exitWith {};
        if (_method isEqualType "" && { _method != QEFUNC(laser,findLaserSource) }) exitWith {};
        (_args call EFUNC(laser,findLaserSource)) params ["_source", "_direction"];
        [_source, _direction] call FUNC(newLaser);
        if (GVAR(module_laser_pfh) < 0) then {
            GVAR(module_laser_pfh) = [LINKFUNC(pfh_processLases), PROCESS_DELAY] call CBA_fnc_addPerFrameHandler;
        };
    }] call CBA_fnc_addEventHandler;
    [QGVAR(ping), LINKFUNC(newLaser)] call CBA_fnc_addEventHandler;
};