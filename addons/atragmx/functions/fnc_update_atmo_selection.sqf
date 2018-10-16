#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Updates the atmospheric data input method
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_atmo_selection
 *
 * Public: No
 */

((uiNamespace getVariable "ATragMX_Display") displayCtrl 13001) ctrlEnable true;
((uiNamespace getVariable "ATragMX_Display") displayCtrl 13002) ctrlEnable true;

if (GVAR(atmosphereModeTBH)) then {
    ((uiNamespace getVariable "ATragMX_Display") displayCtrl 13002) ctrlEnable false;
    {ctrlShow [_x, false]} forEach [13003, 130030];
    {ctrlShow [_x, true]} forEach [13005, 130050, 13006, 130060];
} else {
    ((uiNamespace getVariable "ATragMX_Display") displayCtrl 13001) ctrlEnable false;
    {ctrlShow [_x, false]} forEach [13005, 130050, 13006, 130060];
    {ctrlShow [_x, true]} forEach [13003, 130030];
};

[] call FUNC(update_atmo_env_data);
