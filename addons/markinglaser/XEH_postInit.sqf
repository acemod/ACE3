#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

// Events
[QGVAR(laserOn),  FUNC(onLaserOn)]  call CBA_fnc_addEventHandler;
[QGVAR(laserOff), FUNC(onLaserOff)] call CBA_fnc_addEventHandler;

// Keybinds
["ACE3 Vehicles", QGVAR(toggleLaser), localize LSTRING(ToggleLaser), {
    private _vehicle = cameraOn;
    if !(_vehicle getVariable [QGVAR(enabled), false]) exitWith {false};

    private _controlledUnit = [ACE_player, ACE_controlledUAV#1] select unitIsUAV _vehicle;

    private _canTurnOn = if (_vehicle getVariable [QGVAR(useTurret), false]) then {
        private _turretInfo = _vehicle getVariable [QGVAR(turretInfo), []];
        _controlledUnit == _vehicle turretUnit _turretInfo#0
    } else {
        _controlledUnit == driver _vehicle
    };

    if (_canTurnOn) then {
        if (_vehicle getVariable [QGVAR(laserOn), false]) then {
            [QGVAR(laserOff), [_vehicle]] call CBA_fnc_globalEvent;
        } else {
            [QGVAR(laserOn), [_vehicle]] call CBA_fnc_globalEvent;
        };

        true
    } else {
        false
    };
}, "", [DIK_L, [false, false, true]]] call CBA_fnc_addKeybind;

// JIP init
if (didJIP) then {
    {
        if (_x getVariable [QGVAR(laserOn), false]) then {
            [_x] call FUNC(onLaserOn);
        };
    } forEach (allMissionObjects "Air");
};
