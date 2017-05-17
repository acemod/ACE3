/*
 * Author: Nelson Duarte, AACO
 * Function used to handle mouse button double clicks
 *
 * Public: No
 */

#include "script_component.hpp"

params ["", "_button"];

// Left click
if (_button == 0 && {!isNull GVAR(cursorObject)}) then {
    [GVAR(cursorObject)] call FUNC(cam_prepareTarget);
};
