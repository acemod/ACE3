#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Check if vehicle is a engineering vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Is engineering vehicle <BOOL>
 *
 * Example:
 * cursorObject call ace_repair_fnc_isRepairVehicle
 *
 * Public: Yes
 */

params ["_vehicle"];
TRACE_1("params",_vehicle);

if (_vehicle isKindOf "CAManBase") exitWith {false};

private _config = configOf _vehicle;
private _canRepair = getNumber (_config >> QGVAR(canRepair));
if (_canRepair == 0) then {
    _canRepair = getNumber (_config >> "transportRepair");
};
// Value can be integer or boolean
private _value = _vehicle getVariable ["ACE_isRepairVehicle", _canRepair > 0];
_value in [1, true] // return
