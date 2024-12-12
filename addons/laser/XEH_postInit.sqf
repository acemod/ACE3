#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if (hasInterface) then {
#include "initKeybinds.inc.sqf"

    GVAR(pfID) = -1;

    ["CBA_settingsInitialized", {
        // Handle Map Drawing
        GVAR(mapLaserSource) = objNull;
        ["ACE_controlledUAV", LINKFUNC(addMapHandler)] call CBA_fnc_addEventHandler;
        ["turret", LINKFUNC(addMapHandler), false] call CBA_fnc_addPlayerEventHandler;
        ["unit", LINKFUNC(addMapHandler), true] call CBA_fnc_addPlayerEventHandler;

        // Laser code display
        ["turret", LINKFUNC(showVehicleHud), false] call CBA_fnc_addPlayerEventHandler;
        ["vehicle", LINKFUNC(showVehicleHud), true] call CBA_fnc_addPlayerEventHandler; // only one of these needs the retro flag

        // Add UAV Control Compatibility
        ["ACE_controlledUAV", {
            params ["_UAV", "_seatAI", "_turret", "_position"];
            TRACE_4("ACE_controlledUAV EH",_UAV,_seatAI,_turret,_position);
            if (isNull _seatAI) then {
                [ace_player] call FUNC(showVehicleHud);
            } else {
                [_seatAI] call FUNC(showVehicleHud);
            };
        }] call CBA_fnc_addEventHandler;
    }] call CBA_fnc_addEventHandler;
};

// Global Laser EHs
["ace_laserOn", {
    params ["_uuid", "_args"];
    TRACE_2("ace_laserOn eh",_uuid,_args);

    GVAR(laserEmitters) set [_uuid, _args];
    private _unit = _args select 0;
    if (local _unit && {hasPilotCamera _unit}) then {
        [_unit] call FUNC(laserPointTrack);
    };
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

["Air", "init", {
    params ["_unit"];
    if (hasPilotCamera _unit) then {
        if (!alive _unit) exitWith {};
        // some helicopters just have a static downward camera for cargo loading
        if ((getNumber ((configOf _unit) >> "pilotCamera" >> "controllable")) == 0) exitWith {};

        _unit setVariable [QGVAR(hasLaserSpotTracker), true];
        _unit setVariable [QGVAR(laserSpotTrackerOn), false];

        private _condition = {
            (_player == driver _target)
            && {(_target getVariable [QGVAR(laserSpotTrackerOn), false])}
            && {[_player, _target, []] call EFUNC(common,canInteractWith)}
        };
        private _actionOff = ["LSTOff", localize LSTRING(LSTOff), "", {[_this select 0] call FUNC(toggleLST)}, _condition] call EFUNC(interact_menu,createAction);
        [_unit, 1, ["ACE_SelfActions"], _actionOff] call EFUNC(interact_menu,addActionToObject);

        private _condition = {
            (_player == driver _target)
            && {!(_target getVariable [QGVAR(laserSpotTrackerOn), false])}
            && {[_player, _target, []] call EFUNC(common,canInteractWith)}
        };
        private _actionOn = ["LSTOn", localize LSTRING(LSTOn), "", {[_this select 0] call FUNC(toggleLST)}, _condition] call EFUNC(interact_menu,createAction);
        [_unit, 1, ["ACE_SelfActions"], _actionOn] call EFUNC(interact_menu,addActionToObject);
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;


// Shows detector and mine posistions in 3d when debug is on
#ifdef DRAW_LASER_INFO
addMissionEventHandler ["Draw3D", {_this call FUNC(dev_drawVisibleLaserTargets)}];
#endif
