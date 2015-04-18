/*
 * Author: Ruthberg
 * Updates all input fields based on the currently selected target
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_update_target_selection
 *
 * Public: No
 */
#include "script_component.hpp"

((uiNamespace getVariable "ATragMX_Display") displayCtrl 500) ctrlEnable true;
((uiNamespace getVariable "ATragMX_Display") displayCtrl 501) ctrlEnable true;
((uiNamespace getVariable "ATragMX_Display") displayCtrl 502) ctrlEnable true;
((uiNamespace getVariable "ATragMX_Display") displayCtrl 503) ctrlEnable true;

((uiNamespace getVariable "ATragMX_Display") displayCtrl 500 + GVAR(currentTarget)) ctrlEnable false;

ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 3000);

[] call FUNC(update_unit_selection);
