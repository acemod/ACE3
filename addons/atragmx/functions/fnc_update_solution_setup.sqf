/*
 * Author: Ruthberg
 * Updates all solution setup input fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_solution_setup
 *
 * Public: No
 */
#include "script_component.hpp"

{((uiNamespace getVariable "ATragMX_Display") displayCtrl _x) ctrlEnable true} forEach [15001, 15002, 15003, 15004, 15005, 15006, 15008, 15009, 15010];

switch (GVAR(currentScopeClickNumberTemp)) do {
    case 1:  { ((uiNamespace getVariable "ATragMX_Display") displayCtrl 15001) ctrlEnable false; };
    case 2:  { ((uiNamespace getVariable "ATragMX_Display") displayCtrl 15002) ctrlEnable false; };
    case 3:  { ((uiNamespace getVariable "ATragMX_Display") displayCtrl 15003) ctrlEnable false; };
    case 4:  { ((uiNamespace getVariable "ATragMX_Display") displayCtrl 15004) ctrlEnable false; };
    case 8:  { ((uiNamespace getVariable "ATragMX_Display") displayCtrl 15005) ctrlEnable false; };
    case 10: { ((uiNamespace getVariable "ATragMX_Display") displayCtrl 15006) ctrlEnable false; };
};

((uiNamespace getVariable "ATragMX_Display") displayCtrl (15008 + GVAR(currentScopeClickUnitTemp))) ctrlEnable false;

ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 15011);
