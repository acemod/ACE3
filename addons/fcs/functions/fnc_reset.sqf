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

private ["_vehicle"];

_vehicle = _this select 0;

_vehicle setVariable [QGVAR(Distance), 0, true];
_vehicle setVariable [QGVAR(Magazines), [], true];
_vehicle setVariable [QGVAR(Elevation), 0, true];
_vehicle setVariable [QGVAR(Azimuth), 0, true];

[localize "STR_ACE_FireControlSystem_HasBeenReset"] call EFUNC(core, displayTextStructured);
