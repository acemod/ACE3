#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Shows/Hides the target speed assist timer controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_show_target_speed_assist_timer
 *
 * Public: No
 */

GVAR(showTargetSpeedAssistTimer) = _this;

{ctrlShow [_x, _this]} forEach [9000, 9001, 9002];
