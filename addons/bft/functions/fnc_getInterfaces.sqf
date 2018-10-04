#include "script_component.hpp"
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


params ["_deviceID", "_unit"];

private _deviceData = [_deviceID] call EFUNC(bft,getDeviceData);
private _deviceOwner = D_GET_OWNER(_deviceData);

private _interfaces = [];

if (_deviceOwner isKindOf "ParachuteBase" || {_deviceOwner isKindOf "CAManBase"}) then {
    // personal device
    private _deviceType = D_GET_DEVICETYPE(_deviceData);
    private _config = configFile >> "ACE_BFT" >> "Devices" >> _deviceType >> "interface";
    if (isText _config) then {
        private _interface = getText _config;
        if (_interface != "") then {
            _interfaces pushBack _interface;
        };
    };
} else {
    // vehicle device
    private _vehicleInterfaces = _deviceOwner getvariable [QGVAR(vehicleInterfaces), getArray (configFile >> "CfgVehicles" >> typeOf _deviceOwner >> QGVAR(vehicleInterfaces))];

    // bail if there are no interfaces defined
    if (isNil "_vehicleInterfaces" || {_vehicleInterfaces isEqualTo []}) exitWith {};

    private _assignedVehicleRole = assignedVehicleRole _unit;

    // bail if unit is not in a vehicle
    if (_assignedVehicleRole isEqualTo []) exitWith {};

    private _roleName = _assignedVehicleRole select 0;
    private _roleIndex = call {
        if (_roleName == "Cargo") exitWith {_deviceOwner getCargoIndex _unit};
        if (_roleName == "Turret") exitWith {_assignedVehicleRole select 1 select 0};
        0
    };

    {
        switch (typeName _x) do {
            case "STRING": {_interfaces pushBack _x};

            case "ARRAY": {
                // whereAvailable test
                private _interface = _x select 0;
                private _whereAvailable = _x select 1;
                {
                    private _found = false;

                    switch (typeName _x) do {
                        case "STRING": {
                            if (_x == _roleName) then {_found = true};
                        };
                        case "ARRAY": {
                            if ((_x select 0) == _roleName && _roleIndex in (_x select 1)) then {_found = true};
                        };
                    };

                    if (_found) exitWith {_interfaces pushBack _interface};
                } forEach _whereAvailable;
            };
        };
    } forEach _vehicleInterfaces;
};

_interfaces
