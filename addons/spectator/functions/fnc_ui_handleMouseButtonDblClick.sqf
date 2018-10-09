#include "script_component.hpp"
/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to handle mouse button double clicks
 *
 * Expected behaviour:
 * Double left click teleports free camera toward the unit, but does not focus
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Mouse button pressed <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_spectator_fnc_ui_handleMouseButtonDblClick
 *
 * Public: No
 */

params ["", "_button"];

if (_button == 0 && {!isNull GVAR(cursorObject)}) then {
    [GVAR(cursorObject)] call FUNC(cam_prepareTarget);
};
