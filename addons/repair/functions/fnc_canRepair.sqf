/*
 * Author: Glowbal
 * Check if the repair action can be performed.
 *
 * Arguments:
 * 0: The caller <OBJECT>
 * 1: The target <OBJECT>
 * 2: Selection name <STRING>
 * 3: ACE_Engineeral_Treatments Classname <STRING>
 *
 * ReturnValue:
 * Can Treat <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller", "_target", "_hitPoint", "_className"];
TRACE_4("params",_caller,_target,_hitPoint,_className);

private ["_config", "_engineerRequired", "_items", "_locations", "_return", "_condition", "_vehicleStateCondition"];

_config = (ConfigFile >> "ACE_Repair" >> "Actions" >> _className);
if !(isClass _config) exitwith {false}; // or go for a default?

_engineerRequired = if (isNumber (_config >> "requiredEngineer")) then {
    getNumber (_config >> "requiredEngineer");
} else {
    // Check for required class
    if (isText (_config >> "requiredEngineer")) exitwith {
        missionNamespace getvariable [(getText (_config >> "requiredEngineer")), 0];
    };
    0;
};
if !([_caller, _engineerRequired] call FUNC(isEngineer)) exitwith {false};

_items = getArray (_config >> "items");
if (count _items > 0 && {!([_caller, _items] call FUNC(hasItems))}) exitwith {false};

_return = true;
if (getText (_config >> "condition") != "") then {
    _condition = getText (_config >> "condition");
    if (isnil _condition) then {
        _condition = compile _condition;
    } else {
        _condition = missionNamespace getvariable _condition;
    };
    if (typeName _condition == "BOOL") then {
        _return = _condition;
    } else {
        _return = [_caller, _target, _hitPoint, _className] call _condition;
    };
};

if (!_return) exitwith {false};

_vehicleStateCondition = if (isText(_config >> "vehicleStateCondition")) then {
    missionNamespace getvariable [getText(_config >> "vehicleStateCondition"), 0]
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
        _val = missionNamespace getvariable _x;
        if (typeName _val == "SCALAR") then {
            _return = switch (_val) do {
                case 0: {true};
                case 1: _repairVeh;
                case 2: _repairFacility;
                case 3: {call _repairFacility || call _repairVeh};
            };
            _return = call _return;
        };
    };
} forEach _locations;

_return && alive _target // && {(_target getHitPointDamage _hitPoint) > ([_target] call FUNC(getPostRepairDamage))}
