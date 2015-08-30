/*
 * Author: Gundy
 *
 * Description:
 *   Retrieve available interfaces
 *
 * Arguments:
 *   0: Device ID <STRING>
 *   1: Unit to check for <OBJECT>
 *
 * Return Value:
 *   List of interface strings <ARRAY>
 *
 * Example:
 *   ["deviceID",ACE_player] call ace_bft_fnc_getInterfaces;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_deviceData","_deviceOwner","_interfaces","_interface","_deviceType","_vehicleInterfaces","_assignedVehicleRole","_roleIndex","_roleName","_whereAvailable","_found"];
PARAMS_2(_deviceID,_unit);

_deviceData = [_deviceID] call EFUNC(bft,getDeviceData);
_deviceOwner = D_GET_OWNER(_deviceData);

_interfaces = [];

if (_deviceOwner isKindOf "ParachuteBase" || _deviceOwner isKindOf "CAManBase") then {
    // personal device
    _deviceType = D_GET_DEVICETYPE(_deviceData);
    if (isText (configFile >> "ACE_BFT" >> "Devices" >> _deviceType >> "interface")) then {
        _interface = getText (configFile >> "ACE_BFT" >> "Devices" >> _deviceType >> "interface");
        if (_interface != "") then {
            _interfaces pushBack _interface;
        };
    };
} else {
    // vehicle device
    _vehicleInterfaces = _deviceOwner getvariable [QGVAR(vehicleInterfaces), getArray (configFile >> "CfgVehicles" >> typeOf _deviceOwner >> QGVAR(vehicleInterfaces))];
    
    // bail if there are no interfaces defined
    if (isNil "_vehicleInterfaces" || {_vehicleInterfaces isEqualTo []}) exitWith {};
    
    _assignedVehicleRole = assignedVehicleRole _unit;
    
    // bail if unit is not in a vehicle
    if (_assignedVehicleRole isEqualTo []) exitWith {};
    
    _roleName = _assignedVehicleRole select 0;
    _roleIndex = call {
        if (_roleName == "Cargo") exitWith {_deviceOwner getCargoIndex _unit};
        if (_roleName == "Turret") exitWith {_assignedVehicleRole select 1 select 0};
        0
    };
    
    {
        switch (typeName _x) do {
            case "STRING": {_interfaces pushBack _x};
            
            case "ARRAY": {
                // whereAvailable test
                _interface = _x select 0;
                _whereAvailable = _x select 1;
                {
                    _found = switch (typeName _x) do {
                        case "STRING": {
                            if (_x == _roleName) then {true};
                        };
                        case "ARRAY": {
                            if ((_x select 0) == _roleName && _roleIndex in (_x select 1)) then {true};
                        };
                        default {false};
                    };
                    
                    if (_found) exitWith {_interfaces pushBack _interface};
                } forEach _whereAvailable;
            };
        };
    } forEach _vehicleInterfaces;
};

_interfaces