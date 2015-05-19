#include "script_component.hpp"
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
private["_unit","_vehicle"];
PARAMS_1(_unit);
_vehicle = vehicle _unit;
_unit action ["GetOut", vehicle _unit];
deleteVehicle _vehicle;
_unit setVariable [QGVAR(chuteIsCut), true];