#include "..\script_component.hpp"
/*
 * Author: AmsteadRayle
 * Format item counts to be shown in the tooltip.
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

private _countStrings = [format ["%1 %2", _medicCount, LLSTRING(TreatmentItemCount_Medic)]];

if ((EGVAR(medical_treatment,allowSharedEquipment) != 2) && {!isNil "_patientCount"}) then {
    _countStrings pushBack format ["%1 %2", _patientCount, LLSTRING(TreatmentItemCount_Patient)];
};

if (!isNil "_vehicleCount") then {
    _countStrings pushBack format ["%1 %2", _vehicleCount, LLSTRING(TreatmentItemCount_Vehicle)];
};

_countStrings joinString "\n"
