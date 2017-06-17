/*
 * Author: Ruthberg
 * Shows/Hides the target data controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_show_target_data
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(showTargetData) = _this;

{ctrlShow [_x, _this]} forEach [14000, 140000, 14001, 140010, 14002, 141020, 140020, 141021, 140021, 14003, 140030, 14004, 140040, 141040, 141041, 140041, 14005, 140050, 140051, 14006, 140060, 140061, 14007, 14008, 14009, 14010, 14011];

if (_this) then {
    [] call FUNC(update_target_data);
};
