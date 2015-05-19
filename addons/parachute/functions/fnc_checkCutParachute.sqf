#include "script_component.hpp"
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
privat["_unit"];
_unit = _this select 0;
(animationState _unit == 'para_pilot' && !(_unit getvariable [QGVAR(chuteIsCut),false]))