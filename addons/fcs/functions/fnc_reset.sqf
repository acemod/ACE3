/*
 * Author: KoffeinFlummi
 *
 * Resets the FCS to default.
 *
 * Arguments:
 * 0: Vehicle
 *
 * Return Value:
 * none
 */

#include "script_component.hpp"

private ["_vehicle", "_turret"];

_vehicle = _this select 0;
_turret = _this select 1;

[_vehicle, format ["%1_%2", QGVAR(Distance),  _turret],  0] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Magazines), _turret], []] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Elevation), _turret],  0] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Azimuth),   _turret],  0] call EFUNC(common,setVariablePublic);

[localize STRING(HasBeenReset)] call EFUNC(common,displayTextStructured);
