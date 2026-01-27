#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Refreshes the item's display
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_milr_fnc_display_refresh
 *
 * Public: No
 */
private _display = uiNamespace getVariable [QGVAR(display), displayNull];
if (isNull _display) exitWith { ERROR("MILR display is null"); };

private _ctrlRange = _display displayCtrl IDC_MILR_RANGE;
private _range = GVAR(data) getOrDefault ["range", -1];
private _rangeText = text (if (_range > 0) then {
    format ["%1m", _range toFixed 0]
} else { 
    "----m"
});
_rangeText setAttributes ["color", "#FFFFFF", "font", "EtelkaMonospacePro", "align", "right", "size", "5"];
_ctrlRange ctrlSetStructuredText composeText [_rangeText];

private _ctrlElev = _display displayCtrl IDC_MILR_ELEV;
private _elev = GVAR(data) getOrDefault ["elevationMRAD", 0];
private _elevText = text (call {
    if (_range == RANGE_IN_PROGRESS) exitWith { "RANGING" };
    if (_elev <= 0) exitWith { "" };
    if (_elev < 30) exitWith { format ["%1 +", _elev toFixed 1] };
    format ["%1 !!!", _elev toFixed 0] // out of limits
});
_elevText setAttributes ["color", "#000000", "font", "EtelkaMonospacePro", "align", "left", "size", "2.3"];
_ctrlElev ctrlSetStructuredText composeText [_elevText];
displayUpdate _display;
