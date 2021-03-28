#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Updates all input fields based on the currently selected unit
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_unit_selection
 *
 * Public: No
 */

((uiNamespace getVariable "ATragMX_Display") displayCtrl 600) ctrlEnable true;
((uiNamespace getVariable "ATragMX_Display") displayCtrl 601) ctrlEnable true;
((uiNamespace getVariable "ATragMX_Display") displayCtrl 602) ctrlEnable true;

((uiNamespace getVariable "ATragMX_Display") displayCtrl 600 + GVAR(currentUnit)) ctrlEnable false;

[] call FUNC(update_gun);
[] call FUNC(update_gun_ammo_data);
[] call FUNC(update_atmosphere);
[] call FUNC(update_atmo_env_data);
[] call FUNC(update_target);
[] call FUNC(update_target_data);
[] call FUNC(update_muzzle_velocity_data);
[] call FUNC(update_c1_ballistic_coefficient_data);

[] call FUNC(update_result);
