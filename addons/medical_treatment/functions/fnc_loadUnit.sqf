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
TRACE_3("loadUnit",_medic,_patient,_vehicle);

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

if (isNull _vehicle) exitWith { TRACE_1("no vehicle found",_vehicle); };

[{
    params ["_unit", "_vehicle"];
    (alive _unit) && {alive _vehicle} && {(vehicle _unit) == _vehicle}
}, {
    params ["_unit", "_vehicle"];
    TRACE_2("success",_unit,_vehicle);
    private _patientName = [_unit, false, true] call EFUNC(common,getName);
    private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
    [[LSTRING(LoadedInto), _patientName, _vehicleName], 3] call EFUNC(common,displayTextStructured);
}, [_patient, _vehicle], 3, {
    params ["_unit", "_emptyPos"];
    WARNING_3("loadPerson failed to load %1[local %2] -> %3 ",_unit,local _unit,_vehicle);
}] call CBA_fnc_waitUntilAndExecute;

