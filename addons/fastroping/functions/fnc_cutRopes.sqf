/*
 * Author: KoffeinFlummi
 *
 * Cuts the ropes from the helicopter
 *
 * Arguments:
 * 0: helicopter
 *
 * Return Value:
 * None
 */

#include "script_component.hpp"

private ["_vehicle", "_ropes"];
_vehicle = _this select 0;

_ropes = _vehicle getVariable QGVAR(ropes);
{
    (_x select 2) ropeDetach (_x select 0);
    ropeDestroy (_x select 0);
    [{
        ropeDestroy (_this select 1);
        deleteVehicle (_this select 2);
        deleteVehicle (_this select 3);
    }, _x, 60, 10] call EFUNC(common,waitAndExecute);
} forEach _ropes;

_vehicle setVariable [QGVAR(ropesDeployed), False, True];
