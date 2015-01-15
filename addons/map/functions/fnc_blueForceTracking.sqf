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

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

_logic spawn {
  waitUntil {alive player};

  GVAR(BFT_Enabled) = true;
  [_this, QGVAR(BFT_Interval), "Interval"] call EFUNC(common,readNumericParameterFromModule);
  [_this, QGVAR(BFT_HideAiGroups), "HideAiGroups"] call EFUNC(common,readBooleanParameterFromModule);

  diag_log text "[ACE]: Blue Force Tracking Module initialized.";
  TRACE_2("[ACE]: Blue Force Tracking Module initialized.",GVAR(BFT_Interval), GVAR(BFT_HideAiGroups));
  
  //@toDo start BFT here:
};
