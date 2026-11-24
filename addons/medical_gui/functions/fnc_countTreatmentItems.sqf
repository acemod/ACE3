#include "..\script_component.hpp"
/*
 * Author: AmsteadRayle
 * Counts how many of the given items are present between the medic and patient.
 * Magazines are counted by their rounds.
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

// Magazines (e.g. painkiller bottles) are counted by their rounds, not by the number of magazines
private _countRounds = {
    params ["_containers", "_magazine"];
    private _rounds = 0;
    {
        {
            if (_x select 0 == _magazine) then {
                _rounds = _rounds + (_x select 1);
            };
        } forEach (magazinesAmmoCargo _x);
    } forEach _containers;
    _rounds
};

private _countItem = {
    params ["_unit", "_item"];
    if (isClass (configFile >> "CfgMagazines" >> _item)) exitWith {
        [[uniformContainer _unit, vestContainer _unit, backpackContainer _unit], _item] call _countRounds
    };
    [_unit, _item] call EFUNC(common,getCountOfItem)
};

// Medic
{
    _medicCount = _medicCount + ([ACE_player, _x] call _countItem);
} forEach _items;

// Patient
if (ACE_player != GVAR(target)) then {
    _patientCount = 0;
    {
        _patientCount = _patientCount + ([GVAR(target), _x] call _countItem);
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
    {
        _vehicleCount = _vehicleCount + ([[_vehicle], _x] call _countRounds);
    } forEach _magazineItems;
    if (_itemItems isNotEqualTo []) then {
        (getItemCargo _vehicle) params ["_itemTypes", "_itemCounts"];
        {
            _vehicleCount = _vehicleCount + (_itemCounts param [_itemTypes find _x, 0]);
        } forEach _itemItems;
    };
};

[_medicCount, _patientCount, _vehicleCount]
