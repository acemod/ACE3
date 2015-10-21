/*
 * Author: KoffeinFlummi
 *
 * Resets the FCS to default.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Turret <CONFIG>
 *
 * Return Value:
 * none
 */

#include "script_component.hpp"

private ["_vehicle", "_turret"];
params ["_vehicle", "_turret"];

[_vehicle, format ["%1_%2", QGVAR(Distance),  _turret],  0] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Magazines), _turret], []] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Elevation), _turret],  0] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Azimuth),   _turret],  0] call EFUNC(common,setVariablePublic);

[localize LSTRING(HasBeenReset)] call EFUNC(common,displayTextStructured);
