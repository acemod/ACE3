/*
 * Author: commy2
 *
 * Initializes the Friendly Fire Messages module.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None
 */

_this spawn {
  _logic = _this select 0;
  _units = _this select 1;
  _activated = _this select 2;

  if !(_activated) exitWith {};

  if (isServer) then {
    _varName = "AGM_showFriendlyFireMessage";

    missionNamespace setVariable [_varName, true];
    publicVariable _varName;
  };

  diag_log text "[AGM]: Friendly Fire Messages Module Initialized.";
};
