/*
 * Author: Ruthberg
 * Shows/Hides the target speed assist controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_show_target_speed_assist
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(showTargetSpeedAssist) = _this;

{ctrlShow [_x, _this]} forEach [8000, 8001, 8002, 8003, 8004, 8005, 8006, 8007, 8008, 8009, 8010, 8011, 8012, 8013, 8014, 8015];

if (_this) then {
    ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 8012);

    ctrlSetText [8004, Str(Round((GVAR(targetRange) select GVAR(currentTarget))))];

    if (GVAR(currentUnit) == 1) then {
        ctrlSetText [8008, "Yards"];
    } else {
        ctrlSetText [8008, "Meters"];
    };

    if (GVAR(currentUnit) == 2) then {
        ctrlSetText [8011, "m/s"];
    } else {
        ctrlSetText [8011, "mph"];
    };
};
