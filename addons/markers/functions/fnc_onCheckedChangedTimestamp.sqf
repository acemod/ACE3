#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"
/*
 * Author: Freddo
 * When the timestamp checkbox is toggled
 *
 * Arguments:
 * 0: Checkbox <CONTROL>
 * 1: Value <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_cbTimestamp,1] call ACE_markers_fnc_onCheckedChangedTimestamp
 *
 * Public: No
 */
params ["_cbTimestamp", "_checked"];

SETUVAR(GVAR(timestampChecked),(_checked == 1));

nil
