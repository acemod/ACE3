/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to handle mouse button double clicks
 *
 * Expected behaviour:
 * Double left click teleports free camera toward the unit, but does not focus
 *
 * Public: No
 */

#include "script_component.hpp"

params ["", "_button"];

if (_button == 0 && {!isNull GVAR(cursorObject)}) then {
    [GVAR(cursorObject)] call FUNC(cam_prepareTarget);
};
