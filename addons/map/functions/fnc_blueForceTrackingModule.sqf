/*
* Author: KoffeinFlummi
* Initializes the blue force tracking module.
*
* Arguments:
* Whatever the module provides. (I dunno.)
*
* Return Value:
* None
*/

#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_logic"];

[_logic, QGVAR(BFT_Enabled), "Enabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(BFT_Interval), "Interval"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(BFT_HideAiGroups), "HideAiGroups"] call EFUNC(common,readSettingFromModule);

ACE_LOGINFO_3("Blue Force Tracking Module Initialized:", GVAR(BFT_Enabled), GVAR(BFT_Interval), GVAR(BFT_HideAiGroups));
