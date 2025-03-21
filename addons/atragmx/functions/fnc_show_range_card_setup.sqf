#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Shows/Hides the range card setup controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_show_range_card_setup
 *
 * Public: No
 */

GVAR(showRangeCardSetup) = _this;

{ctrlShow [_x, _this]} forEach [10000, 10001, 10002, 10003, 10004, 10005, 10006, 10007, 10008, 10009];

if (_this) then {
    ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 10006);

    ctrlSetText [10003, str(round(GVAR(rangeCardStartRange)))];
    ctrlSetText [10004, str(round(GVAR(rangeCardEndRange)))];
    ctrlSetText [10005, str(round(GVAR(rangeCardIncrement)))];
};
