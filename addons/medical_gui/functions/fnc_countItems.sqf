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
        _patientCount = _patientCount + ([GVAR(target), _item] call EFUNC(common,getCountOfItem));
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

// Simple string padding function to control column width
_fnc_padLeft = {
    params ["_string", "_length"];
    if (count _string >= _length) exitWith {_string};
    private _full = "    " + _string;
    _Full select [(count _full)-_length, _length];
};

_fnc_formatOnButton = {
    params ["_medicCount", "_patientCount", "_vehicleCount"];
    private _nullString = "——"; // Two em dashes to fill space with single horizontal bar
    private _columnWidth = 2;

    private _countStrings = [[str _medicCount, _columnWidth] call _fnc_padLeft];

    // If sharing disabled, don't show at all
    // If sharing enabled but no target, show null column
    if (EGVAR(medical_treatment,allowSharedEquipment) != 2) then {
        _countStrings pushBack (if (isNil {_patientCount}) then {_nullString} else {[str _patientCount, _columnWidth] call _fnc_padLeft});
    };

    if (!isNil {_vehicleCount}) then {
        _countStrings pushBack ([str _vehicleCount, _columnWidth] call _fnc_padLeft);
    };

    _countStrings joinString "|"
};

_fnc_formatInTooltip = {
    params ["_medicCount", "_patientCount", "_vehicleCount"];
    private _columnWidth = 3;

    private _countStrings = [format ["%1 %2", [str _medicCount, _columnWidth] call _fnc_padLeft, localize LSTRING(TreatmentItemCount_Medic)]];

    if ((EGVAR(medical_treatment,allowSharedEquipment) != 2) && (!isNil {_patientCount})) then {
        _countStrings pushBack format ["%1 %2", [str _patientCount, _columnWidth] call _fnc_padLeft, localize LSTRING(TreatmentItemCount_Patient)];
    };

    if (!isNil {_vehicleCount}) then {
        _countStrings pushBack format ["%1 %2", [str _vehicleCount, _columnWidth] call _fnc_padLeft, localize LSTRING(TreatmentItemCount_Vehicle)];
    };

    _countStrings joinString "\n"
};

if (GVAR(showTreatmentItemCount) == 1) exitWith { // On button
    [_medicCount, _patientCount, _vehicleCount] call _fnc_formatOnButton;
};
// Else, in tooltip
[_medicCount, _patientCount, _vehicleCount] call _fnc_formatInTooltip
