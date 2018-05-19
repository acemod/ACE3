// by esteldunedain
#include "script_component.hpp"

// eject destroyed vehicle init
{
    [_x, "init", {
        params ["_vehicle"];
        if (!alive _vehicle) exitWith {};
        _vehicle addEventHandler ["HandleDamage", {call FUNC(handleDamageEjectDestroyed)}];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach ["Boat_Transport_02_base_F", "Rubber_duck_base_F"];


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
[211, [false, false, false]], false] call CBA_fnc_addKeybind; //DELETE Key
