#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Shows/Hides the atmosphere and environmental data controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_show_atmo_env_data
 *
 * Public: No
 */

GVAR(showAtmoEnvData) = _this;

{ctrlShow [_x, _this]} forEach [13000, 13001, 13002, 13003, 130030, 13004, 130040, 13005, 130050, 13006, 130060, 13007, 13008, 13009, 13010, 13011];

if (_this) then {
    [] call FUNC(update_atmo_selection);
    [] call FUNC(update_atmo_env_data);
};
