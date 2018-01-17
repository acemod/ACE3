/*
 * Author: joko // Jonas
 * Reset the parachute system.
 *
 * Arguments:
 * 0: Object
 *
 * Return Value:
 * Boolean
 *
 * Example:
 * [player] call FUNC(checkCutParachute);
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_unit"];
(vehicle _unit isKindOf 'ParachuteBase' && !(_unit getVariable [QGVAR(chuteIsCut),false]) && (_unit getVariable [QGVAR(hasReserve),false]))