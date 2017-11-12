/*
 * Author: PabstMirror
 * Unloads a captive from a vehicle.
 *
 * Arguments:
 * 0: Captive Unit being unloaded <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ACE_captives_fnc_vehicleCaptiveMoveOut;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];
TRACE_1("params",_unit);

_unit setVariable [QGVAR(CargoIndex), -1, true];

moveOut _unit;
[_unit, "ACE_AmovPercMstpScapWnonDnon", 2] call EFUNC(common,doAnimation);
[_unit, "ACE_AmovPercMstpScapWnonDnon", 1] call EFUNC(common,doAnimation);
unassignVehicle _unit;
