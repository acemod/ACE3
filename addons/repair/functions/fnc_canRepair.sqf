/*
 * Author: Glowbal
 * Check if the repair action can be performed.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Vehicle to repair <OBJECT>
 * 2: Selected hitpoint <STRING>
 * 3: Repair Action Classname <STRING>
 *
 * Return Value:
 * Can Repair <BOOL>
 *
 * Example:
 * ["something", player] call ace_repair_fnc_canRepair
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_caller", "_target", "_hitPoint", "_className"];
TRACE_4("params",_caller,_target,_hitPoint,_className);

private ["_config", "_engineerRequired", "_items", "_locations", "_return", "_condition", "_vehicleStateCondition", "_settingName", "_settingItemsArray"];

_config = (ConfigFile >> "ACE_Repair" >> "Actions" >> _className);
if !(isClass _config) exitwith {false}; // or go for a default?
if(isEngineOn _target) exitwith {false};

_engineerRequired = if (isNumber (_config >> "requiredEngineer")) then {
    getNumber (_config >> "requiredEngineer");
} else {
    // Check for required class
    if (isText (_config >> "requiredEngineer")) exitwith {
        missionNamespace getVariable [(getText (_config >> "requiredEngineer")), 0];
    };
    0;
};
if !([_caller, _engineerRequired] call FUNC(isEngineer)) exitwith {false};

//Items can be an array of required items or a string to a ACE_Setting array
_items = if (isArray (_config >> "items")) then {
    getArray (_config >> "items");
} else {
    _settingName = getText (_config >> "items");
    _settingItemsArray = getArray (configFile >> "ACE_Settings" >> _settingName >> "_values");
    if ((isNil _settingName) || {(missionNamespace getVariable _settingName) >= (count _settingItemsArray)}) exitWith {
        ERROR("bad setting"); ["BAD"]
    };
    _settingItemsArray select (missionNamespace getVariable _settingName);
};

x3 = _items;
if (count _items > 0 && {!([_caller, _items] call FUNC(hasItems))}) exitwith {false};

_return = true;
if (getText (_config >> "condition") != "") then {
    _condition = getText (_config >> "condition");
    if (isnil _condition) then {
        _condition = compile _condition;
    } else {
        _condition = missionNamespace getVariable _condition;
    };
    if (typeName _condition == "BOOL") then {
        _return = _condition;
    } else {
        _return = [_caller, _target, _hitPoint, _className] call _condition;
    };
};

if (!_return) exitwith {false};

_vehicleStateCondition = if (isText(_config >> "vehicleStateCondition")) then {
    missionNamespace getVariable [getText(_config >> "vehicleStateCondition"), 0]
} else {
    getNumber(_config >> "vehicleStateCondition")
};
// if (_vehicleStateCondition == 1 && {!([_target] call FUNC(isInStableCondition))}) exitwith {false};

_locations = getArray (_config >> "repairLocations");
if ("All" in _locations) exitwith {true};

private ["_repairFacility", "_repairVeh"];
_repairFacility = {([_caller] call FUNC(isInRepairFacility)) || ([_target] call FUNC(isInRepairFacility))};
_repairVeh = {([_caller] call FUNC(isNearRepairVehicle)) || ([_target] call FUNC(isNearRepairVehicle))};

{
    if (_x == "field") exitwith {_return = true;};
    if (_x == "RepairFacility" && _repairFacility) exitwith {_return = true;};
    if (_x == "RepairVehicle" && _repairVeh) exitwith {_return = true;};
    if !(isnil _x) exitwith {
        private "_val";
        _val = missionNamespace getVariable _x;
        if (typeName _val == "SCALAR") then {
            _return = switch (_val) do {
                case 0: {true}; //useAnywhere
                case 1: {call _repairVeh}; //repairVehicleOnly
                case 2: {call _repairFacility}; //repairFacilityOnly
                case 3: {(call _repairFacility) || {call _repairVeh}}; //vehicleAndFacility
                default {false}; //Disabled
            };
        };
    };
} forEach _locations;

_return && alive _target;
