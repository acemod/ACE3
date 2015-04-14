/*
 * Author: Ruthberg
 * Shows/Hides the gun list controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_show_gun_list
 *
 * Public: No
 */
#include "script_component.hpp"

{ctrlShow [_x, _this]} forEach [6000, 6001, 6002, 6003, 6004, 6005, 6006, 6007];