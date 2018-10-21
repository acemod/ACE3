#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Shows/Hides the target range assist controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_show_target_range_assist
 *
 * Public: No
 */

GVAR(showTargetRangeAssist) = _this;

{ctrlShow [_x, _this]} forEach [7000, 7001, 7002, 7003, 7004, 7005, 7006, 7007, 7008, 7009, 7010, 7011, 7012, 7013, 7014, 7015, 7016, 7017, 7018, 7019, 7020];

if (_this) then {
    ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 7018);
    ctrlSetText [7012, Str(parseNumber(ctrlText 320))];
    ctrlSetText [7013, Str(parseNumber(ctrlText 340))];

    if (GVAR(currentUnit) == 1) then {
        ctrlSetText [7016, "Yards"];
    } else {
        ctrlSetText [7016, "Meters"];
    };
};
