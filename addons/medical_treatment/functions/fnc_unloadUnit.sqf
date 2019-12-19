#include "script_component.hpp"
/*
 * Author: Glowbal
 * Unloads an unconscious or dead patient from their vehicle.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, bob] call ace_medical_treatment_fnc_unloadUnit
 *
 * Public: No
 */

params ["_medic", "_patient"];
TRACE_2("unloadUnit",_medic,_patient);

if (vehicle _patient == _patient) exitWith {
    ERROR_1("Unit %1 is not in a vehicle",_patient);
};

if (_patient call EFUNC(common,isAwake)) exitWith {
    ERROR_1("Unit %1 is awake",_patient);
};

["ace_unloadPersonEvent", [_patient, vehicle _patient, _medic], _patient] call CBA_fnc_targetEvent;

[{
    params ["_unit", "_vehicle"];
    (alive _unit) && {alive _vehicle} && {(vehicle _unit) != _vehicle}
}, {
    params ["_unit", "_vehicle"];
    TRACE_2("success",_unit,_vehicle);
    private _patientName = [_unit, false, true] call EFUNC(common,getName);
    private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
    [[LSTRING(UnloadedFrom), _patientName, _vehicleName], 3] call EFUNC(common,displayTextStructured);
}, [_patient, vehicle _patient], 3, {
    params ["_unit", "_vehicle"];
    WARNING_3("unloadPerson failed to unload %1[local %2] -> %3 ",_unit,local _unit,_vehicle);
}] call CBA_fnc_waitUntilAndExecute;
