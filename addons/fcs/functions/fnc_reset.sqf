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

private "_vehicle";

_vehicle = _this select 0;

[_vehicle, QGVAR(Distance),   0] call EFUNC(common,setVariablePublic);
[_vehicle, QGVAR(Magazines), []] call EFUNC(common,setVariablePublic);
[_vehicle, QGVAR(Elevation),  0] call EFUNC(common,setVariablePublic);
[_vehicle, QGVAR(Azimuth),    0] call EFUNC(common,setVariablePublic);

[localize "STR_ACE_FCS_HasBeenReset"] call EFUNC(common,displayTextStructured);
