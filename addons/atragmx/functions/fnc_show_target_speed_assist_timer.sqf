/*
 * Author: Ruthberg
 * Shows/Hides the target speed assist timer controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_show_target_speed_assist_timer
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(showTargetSpeedAssistTimer) = _this;

{ctrlShow [_x, _this]} forEach [9000, 9001, 9002];
