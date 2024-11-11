#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if (!hasInterface) exitWith {};

// Keybinds
["ACE3 Vehicles", QGVAR(toggleLaser), LLSTRING(ToggleLaser), {
    // Ignore when in Zeus
    if (!isNull curatorCamera) exitWith {false};

    private _vehicle = cameraOn;
    if !(_vehicle getVariable [QGVAR(enabled), false]) exitWith {false};

    private _controlledUnit = [ACE_player, ACE_controlledUAV # 1] select (unitIsUAV _vehicle);

    private _turretInfo = _vehicle getVariable [QGVAR(turretInfo), []];
    private _canTurnOn = _controlledUnit == _vehicle turretUnit _turretInfo;
    if (!_canTurnOn) exitWith { false };

    playSound "ACE_Sound_Click";
    private _currentMode = _vehicle getVariable [QGVAR(laserMode), MODE_OFF];
    private _newMode = (_currentMode + 1) % 3;
    _vehicle setVariable [QGVAR(laserMode), _newMode, true];
    true
}, "", [DIK_L, [false, false, true]]] call CBA_fnc_addKeybind; // ALT-L

["CBA_settingsInitialized", {
    TRACE_1("settingsInitialized",1);

    GVAR(pfEH) = -1;
    ["visionMode", LINKFUNC(onLaserOn), true] call CBA_fnc_addPlayerEventHandler;
    ["ace_laserOn", {
        params ["", "_args"];
        _args params ["_object"];
        if !(_object getVariable [QGVAR(enabled), false]) exitWith {};
        _object setVariable [QGVAR(smoothing), []];
        _object setVariable [QGVAR(flashOffset), random 1]; // make flashes not synchronized

        [] call LINKFUNC(onLaserOn);
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
