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
 * Item count string <STRING>
 *
 * Example:
 * [items] call ace_medical_gui_fnc_countItems
 *
 * Public: No
 */

params ["_items"];

private _medicCount = 0;
private _patientCount = nil;
private _vehicleCount = nil;

private _nullString = "——"; // Two em dashes to fill space with single horizontal bar

// Medic
{
    private _item = _x;
    _medicCount = _medicCount + ([ACE_player, _item] call EFUNC(common,getCountOfItem));
} forEach _items;

// Patient
if (ACE_player != GVAR(target)) then {
    _patientCount = 0;
    {
        private _item = _x;
        _patientCount = _patientCount + ({_x == _item} count (items GVAR(target)));
    } forEach _items;
};

// Vehicle
private _medicVehicle = objectParent ACE_player;
private _patientVehicle = objectParent GVAR(target);
private _vehicle = if (!isNull _medicVehicle) then {_medicVehicle} else {_patientVehicle};

if (!isNull _vehicle) then {
    _vehicleCount = 0;
    (getItemCargo _vehicle) params ["_itemTypes", "_itemCounts"];
    {
        private _item = _x;
        private _index = _itemTypes find _item;
        _vehicleCount = _vehicleCount + (_itemCounts param [_index, 0]);
    } forEach _items;
};

_fnc_padLeft = {
    params ["_string", "_length"];
    if (count _string >= _length) exitWith {_string};
    private _full = "    " + _string;
    _Full select [(count _full)-_length, _length];
};

private _countStrings = [];

_countStrings pushBack ([str _medicCount, 2] call _fnc_padLeft);

if (EGVAR(medical_treatment,allowSharedEquipment) != 2) then {
    _countStrings pushBack (if (isNil {_patientCount}) then {_nullString} else {[str _patientCount, 2] call _fnc_padLeft});
};

if (!isNil {_vehicleCount}) then {
    _countStrings pushBack ([str _vehicleCount, 2] call _fnc_padLeft);
};

_countStrings joinString "|"
