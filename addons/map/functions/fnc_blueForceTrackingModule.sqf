/*
* Author: KoffeinFlummi
*
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

PARAMS_1(_logic);

[_logic, QGVAR(BFT_Enabled), "Enabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(BFT_Interval), "Interval"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(BFT_HideAiGroups), "HideAiGroups"] call EFUNC(common,readSettingFromModule);

diag_log text "[ACE]: Blue Force Tracking Module initialized. (server)";
