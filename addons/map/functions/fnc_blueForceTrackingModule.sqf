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

if !(hasInterface) exitWith {};

PARAMS_3(_logic,_units,_activated);

if !(_activated) exitWith {};

GVAR(BFT_Enabled) = true;
[_logic, QGVAR(BFT_Interval), "Interval"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(BFT_HideAiGroups), "HideAiGroups"] call EFUNC(common,readSettingFromModule);

diag_log text "[ACE]: Blue Force Tracking Module initialized.";
TRACE_2("[ACE]: Blue Force Tracking Module initialized.",GVAR(BFT_Interval), GVAR(BFT_HideAiGroups));

//start BFT:
GVAR(BFT_markers) = [];
[FUNC(blueForceTrackingUpdate), GVAR(BFT_Interval), []] call CBA_fnc_addPerFrameHandler;
