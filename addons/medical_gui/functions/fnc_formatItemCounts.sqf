#include "..\script_component.hpp"
/*
 * Author: AmsteadRayle
 * Format item counts to be shown either on the treatment button or in the tooltip.
 *
 * Arguments:
 * 0: Medic count <NUMBER>
 * 1: Patient count <NUMBER>
 * 2: Vehicle count <NUMBER>
 *
 * Return Value:
 * Item count string <STRING>
 *
 * Example:
 * [medicCount, patientCount, vehicleCount] call ace_medical_gui_fnc_formatItemCounts
 *
 * Public: No
 */

params ["_medicCount", "_patientCount", "_vehicleCount"];

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

    private _countStrings = [format ["%1 %2", _medicCount, localize LSTRING(TreatmentItemCount_Medic)]];

    if ((EGVAR(medical_treatment,allowSharedEquipment) != 2) && (!isNil {_patientCount})) then {
        _countStrings pushBack format ["%1 %2", _patientCount, localize LSTRING(TreatmentItemCount_Patient)];
    };

    if (!isNil {_vehicleCount}) then {
        _countStrings pushBack format ["%1 %2", _vehicleCount, localize LSTRING(TreatmentItemCount_Vehicle)];
    };

    _countStrings joinString "\n"
};

if (GVAR(showTreatmentItemCount) == 1) exitWith { // On button
    [_medicCount, _patientCount, _vehicleCount] call _fnc_formatOnButton;
};
// Else, in tooltip
[_medicCount, _patientCount, _vehicleCount] call _fnc_formatInTooltip
