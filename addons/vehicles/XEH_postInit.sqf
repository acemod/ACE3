// by esteldunedain
#include "script_component.hpp"

if (!hasInterface) exitWith {};
GVAR(isSpeedLimiter) = false;
// Add keybinds
["ACE3 Vehicles", QGVAR(speedLimiter), localize LSTRING(SpeedLimiter),
{
    private _connectedUAV = getConnectedUAV ACE_player;
    private _uavControl = UAVControl _connectedUAV;
    if ((_uavControl select 1) == "DRIVER") then {
        if !(_connectedUAV isKindOf "UGV_01_base_F") exitWith {false};
        GVAR(isUAV) = true;
        [_uavControl select 0, _connectedUAV] call FUNC(speedLimiter);
        true
    } else {
        // Conditions: canInteract
        if !([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
        // Conditions: specific
        private _vehicle = vehicle ACE_player;
        if (
            ACE_player != driver _vehicle
            || {-1 == ["Car", "Tank", "Ship"] findIf {_vehicle isKindOf _x}}
        ) exitWith {false};

        GVAR(isUAV) = false;
        // Statement
        [ACE_player, _vehicle] call FUNC(speedLimiter);
        true
    };
},
{false},
[DIK_DELETE, [false, false, false]], false] call CBA_fnc_addKeybind;

["ACE3 Vehicles", QGVAR(cruiseControl), localize LSTRING(CruiseControl), {
    private _connectedUAV = getConnectedUAV ACE_player;
    private _uavControl = UAVControl _connectedUAV;
    if ((_uavControl select 1) == "DRIVER") then {
        if !(_connectedUAV isKindOf "UGV_01_base_F") exitWith {false};
        GVAR(isUAV) = true;
        [_uavControl select 0, _connectedUAV, true] call FUNC(speedLimiter);
        true
    } else {
        // Conditions: canInteract
        if !([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
        // Conditions: specific
        private _vehicle = vehicle ACE_player;
        if (
            ACE_player != driver _vehicle
            || {-1 == ["Car", "Tank", "Ship", "Plane"] findIf {_vehicle isKindOf _x}}
        ) exitWith {false};

        GVAR(isUAV) = false;
        // Statement
        if (_vehicle isKindOf "Plane") then {
            [ACE_player, _vehicle] call FUNC(autoThrottle);
        } else {
            [ACE_player, _vehicle, true] call FUNC(speedLimiter);
        };
        true
    };
},
{false},
[DIK_INSERT, [false, false, false]], false] call CBA_fnc_addKeybind;

["ACE3 Vehicles", QGVAR(scrollUp), localize LSTRING(IncreaseSpeedLimit), {
    if (GVAR(isSpeedLimiter)) then {
        GVAR(speedLimit) = round (GVAR(speedLimit) + GVAR(speedLimiterStep)) max (5 max GVAR(speedLimiterStep));
        GVAR(speedLimit) = 5 max GVAR(speedLimiterStep) * floor (GVAR(speedLimit) / GVAR(speedLimiterStep));
        [["%1: %2", LSTRING(SpeedLimit), GVAR(speedLimit)]] call EFUNC(common,displayTextStructured);
        true
    };
}, {false}, [MOUSE_SCROLL_UP, [false, true, false]], false] call CBA_fnc_addKeybind; // Ctrl + Mouse Wheel Scroll Up

["ACE3 Vehicles", QGVAR(scrollDown), localize LSTRING(DecreaseSpeedLimit), {
    if (GVAR(isSpeedLimiter)) then {
        GVAR(speedLimit) = round (GVAR(speedLimit) - GVAR(speedLimiterStep)) max (5 max GVAR(speedLimiterStep));
        GVAR(speedLimit) = 5 max GVAR(speedLimiterStep) * ceil (GVAR(speedLimit) / GVAR(speedLimiterStep));
        [["%1: %2", LSTRING(SpeedLimit), GVAR(speedLimit)]] call EFUNC(common,displayTextStructured);
        true
    };
}, {false}, [MOUSE_SCROLL_DOWN, [false, true, false]], false] call CBA_fnc_addKeybind; // Ctrl + Mouse Wheel Scroll Down
