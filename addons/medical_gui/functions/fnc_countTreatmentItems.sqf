#include "..\script_component.hpp"
/*
 * Author: AmsteadRayle
 * Counts how many of the given items are present between the medic and patient.
 * If medic or patient are in a vehicle then vehicle's inventory will also be checked.
 *
 * Arguments:
 * 0: Items <ARRAY>
 *
 * Return Value:
 * Counts (can be nil) <ARRAY>
 *
 * Example:
 * [items] call ace_medical_gui_fnc_countTreatmentItems
 *
 * Public: No
 */

params ["_items"];

private _medicCount = 0;
private _patientCount = nil;
private _vehicleCount = nil;

// Medic
{
    _medicCount = _medicCount + ([ACE_player, _x] call EFUNC(common,getCountOfItem));
} forEach _items;

// Patient
if (ACE_player != GVAR(target)) then {
    _patientCount = 0;
    {
        _patientCount = _patientCount + ([GVAR(target), _x] call EFUNC(common,getCountOfItem));
    } forEach _items;
};

// Vehicle
private _medicVehicle = objectParent ACE_player;
private _patientVehicle = objectParent GVAR(target);
private _vehicle = [_patientVehicle, _medicVehicle] select (!isNull _medicVehicle);

if (!isNull _vehicle) then {
    _vehicleCount = 0;
    private _magazineItems = [];
    private _itemItems = [];
    {
        if (isClass (configFile >> "CfgMagazines" >> _x)) then {
            _magazineItems pushBack _x;
        } else {
            _itemItems pushBack _x;
        };
    } forEach _items;
    if (_magazineItems isNotEqualTo []) then {
        (getMagazineCargo _vehicle) params ["_itemTypes", "_itemCounts"];
        {
            _vehicleCount = _vehicleCount + (_itemCounts param [_itemTypes find _x, 0]);
        } forEach _magazineItems;
    };
    if (_itemItems isNotEqualTo []) then {
        (getItemCargo _vehicle) params ["_itemTypes", "_itemCounts"];
        {
            _vehicleCount = _vehicleCount + (_itemCounts param [_itemTypes find _x, 0]);
        } forEach _itemItems;
    };
};

[_medicCount, _patientCount, _vehicleCount]
