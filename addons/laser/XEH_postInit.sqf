#include "script_component.hpp"

if (hasInterface) then {
#include "initKeybinds.sqf"

    GVAR(pfID) = -1;

    ["CBA_settingsInitialized", {
        ["turret", LINKFUNC(showVehicleHud), false] call CBA_fnc_addPlayerEventHandler;
        ["vehicle", LINKFUNC(showVehicleHud), true] call CBA_fnc_addPlayerEventHandler; // only one of these needs the retro flag

        // Add UAV Control Compatibility
        ["ACE_controlledUAV", {
            params ["_UAV", "_seatAI", "_turret", "_position"];
            TRACE_4("ACE_controlledUAV EH",_UAV,_seatAI,_turret,_position);
            if (!isNull _seatAI) then {
                [_seatAI] call FUNC(showVehicleHud);
            } else {
                [ace_player] call FUNC(showVehicleHud);
            };
        }] call CBA_fnc_addEventHandler;
    }] call CBA_fnc_addEventHandler;
};

// Global Laser EHs
["ace_laserOn", {
    params ["_uuid", "_args"];
    TRACE_2("ace_laserOn eh",_uuid,_args);
    GVAR(laserEmitters) set [_uuid, _args];
}] call CBA_fnc_addEventHandler;

["ace_laserOff", {
    params ["_uuid"];
    TRACE_1("ace_laserOn eh",_uuid);
    GVAR(laserEmitters) deleteAt _uuid;
}] call CBA_fnc_addEventHandler;

[QGVAR(updateCode), {
    params ["_uuid", "_newCode"];
    TRACE_2("ace_laser_updateCode eh",_uuid,_newCode);
    if (_uuid in GVAR(laserEmitters)) then {
        private _laserArray = GVAR(laserEmitters) get _uuid;
        TRACE_2("updating",_newCode,_laserArray select 4);
        _laserArray set [4, _newCode];
    };
}] call CBA_fnc_addEventHandler;

// Shows detector and mine posistions in 3d when debug is on
#ifdef DRAW_LASER_INFO
addMissionEventHandler ["Draw3D", {_this call FUNC(dev_drawVisibleLaserTargets)}];
#endif
