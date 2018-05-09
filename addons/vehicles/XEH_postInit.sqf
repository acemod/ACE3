// by esteldunedain
#include "script_component.hpp"

// eject destroyed vehicle init
private _ejectDestroyedClasses = [];
{
    private _ejectDestroyedClass = configName _x;
    if (-1 == _ejectDestroyedClasses findIf {_ejectDestroyedClass isKindOf _x}) then {
        TRACE_1("init ejectDestroyed class",_ejectDestroyedClass);
        _ejectDestroyedClasses pushBack _ejectDestroyedClass;
        [_ejectDestroyedClass, "init", {
            params ["_vehicle"];
            if (!alive _vehicle) exitWith {};
            TRACE_2("init ejectDestroyed vehicle",_vehicle,typeOf _vehicle);
            _vehicle addEventHandler ["HandleDamage", {
                params ["_vehicle", "", "", "", "_ammo"];
                if (alive _vehicle) exitWith {};
                TRACE_2("ejectDestroyed HDEH",typeOf _vehicle,_this);
                if (0.5 >= getNumber (configFile >> "CfgAmmo" >> _ammo >> "explosive")) then {
                    {
                        if (alive _x) then {
                            moveOut _x;
                        };
                    } forEach crew _vehicle;
                };
                _vehicle removeEventHandler ["HandleDamage", _thisEventHandler];
            }];
        }, true, [], true] call CBA_fnc_addClassEventHandler;
    };
} forEach (QUOTE(1 == getNumber (_x >> QQGVAR(ejectDestroyed))) configClasses (configFile >> "CfgVehicles"));


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
