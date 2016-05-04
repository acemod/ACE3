/*
 * Author: joko // Jonas
 * Cut Parachute and delete Old
 *
 * Arguments:
 * 0: Object
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call FUNC(cutParachute);
 *
 * Public: No
 */
#include "script_component.hpp"
private["_unit","_vehicle"];
_unit = _this select 0;
_vehicle = vehicle _unit;
_unit action ["GetOut", _vehicle];
deleteVehicle _vehicle;
_unit setVariable [QGVAR(chuteIsCut), true, true];
