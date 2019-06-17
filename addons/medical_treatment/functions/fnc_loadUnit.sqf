#include "script_component.hpp"
/*
 * Author: Glowbal
 * Loads an unconscious or dead patient in the given or nearest vehicle.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Vehicle <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_loadUnit
 *
 * Public: No
 */

params ["_medic", "_patient", ["_vehicle", objNull]];

if (_patient call EFUNC(common,isAwake)) exitWith {
    [[LSTRING(CanNotLoad), _patient call EFUNC(common,getName)]] call EFUNC(common,displayTextStructured);
};

if (_patient call EFUNC(medical_status,isBeingCarried)) then {
    [_medic, _patient] call EFUNC(dragging,dropObject_carry);
};

if (_patient call EFUNC(medical_status,isBeingDragged)) then {
    [_medic, _patient] call EFUNC(dragging,dropObject);
};

private _vehicle = [_medic, _patient, _vehicle] call EFUNC(common,loadPerson);

if (!isNull _vehicle) then {
    private _patientName = [_patient, false, true] call EFUNC(common,getName);
    private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
    [[LSTRING(LoadedInto), _patientName, _vehicleName], 3] call EFUNC(common,displayTextStructured);
};
