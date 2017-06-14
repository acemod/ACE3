/*
 * Author: Ruthberg
 * Updates all input fields based on the currently selected target
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_target_selection
 *
 * Public: No
 */
#include "script_component.hpp"

{((uiNamespace getVariable "ATragMX_Display") displayCtrl _x) ctrlEnable true} forEach [500, 501, 502, 503];

((uiNamespace getVariable "ATragMX_Display") displayCtrl 500 + GVAR(currentTarget)) ctrlEnable false;

ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 3000);

[] call FUNC(update_unit_selection);
