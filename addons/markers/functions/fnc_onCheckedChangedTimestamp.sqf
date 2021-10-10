#include "script_component.hpp"
/*
 * Author: Freddo, commy2
 * When the timestamp checkbox is toggled.
 *
 * Arguments:
 * 0: Checkbox <CONTROL>
 * 1: Value <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [controlNull, 1] call ACE_markers_fnc_onCheckedChangedTimestamp;
 *
 * Public: No
 */
params ["", "_checked"];

uiNamespace setVariable [QGVAR(timestampChecked), _checked == 1]
