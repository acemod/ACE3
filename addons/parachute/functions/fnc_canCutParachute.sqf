/*
 * Author: joko // Jonas
 * Check whether given unit can cut their parachute
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * [player] call FUNC(canCutParachute);
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_unit"];
(vehicle _unit isKindOf 'ParachuteBase' && {GETVAR(_unit,GVAR(hasReserve),false)})
