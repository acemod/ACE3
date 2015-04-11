/*
 * Author: Ruthberg
 * Shows/Hides the target speed assist controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_show_target_speed_assist
 *
 * Public: No
 */
#include "script_component.hpp"

{ctrlShow [_x, _this]} forEach [8000, 8001, 8002, 8003, 8004, 8005, 8006, 8007, 8008, 8009, 8010, 8011, 8012, 8013, 8014, 8015];
