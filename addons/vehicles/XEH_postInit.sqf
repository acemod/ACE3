// by esteldunedain
#include "script_component.hpp"

if (!hasInterface) exitWith {};
GVAR(isSpeedLimiter) = false;
// Add keybinds
["ACE3 Vehicles", QGVAR(speedLimiter), localize LSTRING(SpeedLimiter),
{
    private _connectedUAV = getConnectedUAV ACE_player;
    private _uavControll = UAVControl _connectedUAV;
    if ((_uavControll select 1) == "DRIVER") then {
        if !(_connectedUAV isKindOf "UGV_01_base_F") exitWith {false};
        GVAR(isUAV) = true;
        [_uavControll select 0, _connectedUAV] call FUNC(speedLimiter);
        true
    } else {
        // Conditions: canInteract
        if !([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
        // Conditions: specific
        if !(ACE_player == driver vehicle ACE_player &&
            {vehicle ACE_player isKindOf 'Car' ||
            {vehicle ACE_player isKindOf 'Tank'}}) exitWith {false};

            GVAR(isUAV) = false;
        // Statement
        [ACE_player, vehicle ACE_player] call FUNC(speedLimiter);
        true
    };
},
{false},
[DIK_DELETE, [false, false, false]], false] call CBA_fnc_addKeybind;

["ACE3 Vehicles", QGVAR(cruiseControl), localize LSTRING(CruiseControl), {
    private _connectedUAV = getConnectedUAV ACE_player;
    private _uavControll = UAVControl _connectedUAV;
    if ((_uavControll select 1) == "DRIVER") then {
        if !(_connectedUAV isKindOf "UGV_01_base_F") exitWith {false};
        GVAR(isUAV) = true;
        [_uavControll select 0, _connectedUAV, true] call FUNC(speedLimiter);
        true
    } else {
        // Conditions: canInteract
        if !([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
        // Conditions: specific
        if !(ACE_player == driver vehicle ACE_player &&
            {vehicle ACE_player isKindOf 'Car' ||
            {vehicle ACE_player isKindOf 'Tank'} ||
            {vehicle ACE_player isKindOf 'Plane'}}) exitWith {false};

            GVAR(isUAV) = false;
        // Statement
        if (vehicle ACE_player isKindOf 'Plane') then {
            [ACE_player, vehicle ACE_player] call FUNC(autoThrottle);
        } else {
            [ACE_player, vehicle ACE_player, true] call FUNC(speedLimiter);
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
