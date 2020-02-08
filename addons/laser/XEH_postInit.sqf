#include "script_component.hpp"

if (hasInterface) then {
#include "initKeybinds.sqf"

    GVAR(pfID) = -1;

    ["ace_settingsInitialized", {
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


["ace_laserOn", {
    params ["_uuid", "_args"];
    private _vehicle = _args select 0;
    if(hasPilotCamera _vehicle) then {
        [_vehicle] call FUNC(laserPointTrack);
    };
}] call CBA_fnc_addEventHandler;

["Plane", "init", {
    params ["_vehicle"];
    _hasPilotCamera = hasPilotCamera _vehicle;

    if (_hasPilotCamera) then {
        _vehicle setVariable [QGVAR(hasLaserSpotTracker), true];
        _vehicle setVariable [QGVAR(laserSpotTrackerOn), false];
    };

    
    private _actionOff = ["LSTOff", localize LSTRING(LSTOff), "", {[_this select 0] call FUNC(toggleLST)}, {(_this select 0) getVariable [QGVAR(laserSpotTrackerOn), false]}] call ace_interact_menu_fnc_createAction;
    [_vehicle, 1, ["ACE_SelfActions"], _actionOff] call ace_interact_menu_fnc_addActionToObject;
    private _actionOn = ["LSTOn", localize LSTRING(LSTOn), "", {[_this select 0] call FUNC(toggleLST)}, {!((_this select 0) getVariable [QGVAR(laserSpotTrackerOn), false])}] call ace_interact_menu_fnc_createAction;
    [_vehicle, 1, ["ACE_SelfActions"], _actionOn] call ace_interact_menu_fnc_addActionToObject;
    
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Air", "init", {
    params ["_vehicle"];
    _hasPilotCamera = hasPilotCamera _vehicle;

    //if (_shooter isKindOf "Plane" && { !hasPilotCamera _shooter }) exitWith { WARNING("SACLOS fired from planes without camera unsupported"); };


    if (_hasPilotCamera) then {
        _vehicle setVariable [QGVAR(hasMarkerLaser), true];
        _vehicle setVariable [QGVAR(laserMarkerOn), false];
    };

    
    private _actionOff = ["LaserMarkerOff", localize LSTRING(laserMarkOff), "", {[_this select 0] call FUNC(toggleMarker)}, {(_this select 0) getVariable [QGVAR(laserMarkerOn), false]}] call ace_interact_menu_fnc_createAction;
    [_vehicle, 1, ["ACE_SelfActions"], _actionOff] call ace_interact_menu_fnc_addActionToObject;
    private _actionOn = ["LaserMarkerOn", localize LSTRING(laserMarkOn), "", {[_this select 0] call FUNC(toggleMarker)}, {!((_this select 0) getVariable [QGVAR(laserMarkerOn), false])}] call ace_interact_menu_fnc_createAction;
    [_vehicle, 1, ["ACE_SelfActions"], _actionOn] call ace_interact_menu_fnc_addActionToObject;
    
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

// Shows detector and mine posistions in 3d when debug is on
#ifdef DRAW_LASER_INFO
addMissionEventHandler ["Draw3D", {_this call FUNC(dev_drawVisibleLaserTargets)}];
#endif
