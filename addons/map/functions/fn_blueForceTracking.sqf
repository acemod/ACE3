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

if !(hasInterface) exitWith {};

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

_logic spawn {
  waitUntil {alive player};

  AGM_Map_BFT_Enabled = true;
  [_this, "AGM_Map_BFT_Interval", "Interval"] call AGM_Core_fnc_readNumericParameterFromModule;
  [_this, "AGM_Map_BFT_HideAiGroups", "HideAiGroups"] call AGM_Core_fnc_readBooleanParameterFromModule;

  diag_log text "[AGM]: Blue Force Tracking Module initialized.";
};
