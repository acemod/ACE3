/*
 * Author: KoffeinFlummi
 * Initializes the blue force tracking module.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.) <UNKNOWN>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_map_fnc_blueForceTrackingModule
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic"];

[_logic, QGVAR(BFT_Enabled), "Enabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(BFT_Interval), "Interval"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(BFT_HideAiGroups), "HideAiGroups"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(BFT_ShowPlayerNames), "ShowPlayerNames"] call EFUNC(common,readSettingFromModule);

INFO_3("Blue Force Tracking Module Initialized:", GVAR(BFT_Enabled), GVAR(BFT_Interval), GVAR(BFT_HideAiGroups));
