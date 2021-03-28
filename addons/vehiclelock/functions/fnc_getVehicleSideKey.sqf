#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Returns the side specifc key for a vehicle
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * The vehicle's side key classname <STRING>
 *
 * Example:
 * [tank1] call ACE_VehicleLock_fnc_getVehicleSideKey;
 *
 * Public: No
 */

params ["_veh"];
TRACE_1("params",_veh);

if (isNull _veh) exitWith {ERROR("null vehicle"); "error"};

private _vehConfigSide = [_veh, true] call BIS_fnc_objectSide;
private _vehSide = _veh getVariable [QGVAR(lockSide), _vehConfigSide];

private _returnValue = "";

switch (_vehSide) do {
case (west):       {_returnValue = "ACE_key_west"};
case (east):       {_returnValue = "ACE_key_east"};
case (resistance): {_returnValue = "ACE_key_indp"};
    default        {_returnValue = "ACE_key_civ"};
};

_returnValue
