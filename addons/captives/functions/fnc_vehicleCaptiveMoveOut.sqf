/*
 * Author: PabstMirror
 * Unloads a captive from a vehicle.
 *
 * Arguments:
 * 0: Captive Unit being unloaded <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * TODO
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_unit);

_unit setVariable ["ACE_Captives_CargoIndex", -1, true];

moveOut _unit;
[_unit, "ACE_AmovPercMstpScapWnonDnon", 2] call EFUNC(common,doAnimation);
unassignVehicle _unit;