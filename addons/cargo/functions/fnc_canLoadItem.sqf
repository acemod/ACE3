#include "script_component.hpp"

#define TRUNK_SELECTION "doplnovani"
#define MAX_DISTANCE 8

_nearestVehicles = [
    getPos player nearestObject "Car",
    getPos player nearestObject "Tank",
    getPos player nearestObject "Helicopter",
    getPos player nearestObject "Plane",
    getPos player nearestObject "Ship"
];

_distances = [];
{
    if (typeName _x == "OBJECT") then {
        _distances pushBack (player distance _x);
    };
} forEach _nearestVehicles;

_distance = MAX_DISTANCE;
{
    _distance = _distance min _x;
} forEach _distances;

if (_distance == MAX_DISTANCE) exitWith {false};
_result = false;

ACE_Cargo_targetVehicle = _nearestVehicles select (_distances find _distance);
_size = getNumber(configFile >> "CfgVehicles" >> typeOf(_this) >> "ACE_Size");

if (isClass (configFile >> "CfgVehicles" >> typeOf(ACE_Cargo_targetVehicle) >> "ACE_Load")) then {
    _attachPoints = ACE_Cargo_targetVehicle call FUNC(getLoadPoints);
    {
        if ([_x select 1, _x select 3] call FUNC(remainingSpace) >= _size) exitWith {
            _result = true;
        };
    } forEach _attachPoints;
} else {
    _loadItems = ACE_Cargo_targetVehicle getVariable ["ACE_Cargo_loadedItems", []];
	//hint format ["%1 : %2 : %3", _loadItems, [getNumber (configFile >> "CfgVehicles" >> typeOf ACE_Cargo_targetVehicle >> "ACE_Vehicle_Cargo"), _loadedItems] call ace_cargo_fnc_remainingSpace >= _size, ACE_Cargo_targetVehicle];
    if ([getNumber (configFile >> "CfgVehicles" >> typeOf ACE_Cargo_targetVehicle >> "ACE_Vehicle_Cargo"), _loadItems] call FUNC(remainingSpace) >= _size) then {
        _result = true;
    } else {
        _result = false;
	};
};
//&& {_this select 0 != missionNamespace getVariable ["AGM_Fortifications_crate", objNull]}
_result