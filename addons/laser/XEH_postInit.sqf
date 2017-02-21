#include "script_component.hpp"

#include "initKeybinds.sqf"

// Global Laser EHs
["ace_laserOn", {
    params ["_uuid", "_args"];
    TRACE_2("ace_laserOn eh",_uuid,_args);
    [GVAR(laserEmitters), _uuid, _args] call CBA_fnc_hashSet;
}] call CBA_fnc_addEventHandler;

["ace_laserOff", {
    params ["_uuid"];
    TRACE_1("ace_laserOn eh",_uuid);
    if ([GVAR(laserEmitters), _uuid] call CBA_fnc_hashHasKey) then {
        [GVAR(laserEmitters), _uuid] call CBA_fnc_hashRem;
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(updateCode), {
    params ["_uuid", "_newCode"];
    TRACE_2("ace_laser_updateCode eh",_uuid,_newCode);
    if ([GVAR(laserEmitters), _uuid] call CBA_fnc_hashHasKey) then {
        private _laserArray = [GVAR(laserEmitters), _uuid] call CBA_fnc_hashGet;
        TRACE_2("updating",_newCode,_laserArray select 4);
        _laserArray set [4, _newCode];
    };
}] call CBA_fnc_addEventHandler;

// Shows detector and mine posistions in 3d when debug is on
#ifdef DRAW_LASER_INFO
addMissionEventHandler ["Draw3D", {_this call FUNC(dev_drawVisibleLaserTargets)}];
#endif
