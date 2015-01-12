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
    _varName = QGVAR(showFriendlyFireMessage);

    missionNamespace setVariable [_varName, true];
    publicVariable _varName;
  };

  diag_log text "[ACE]: Friendly Fire Messages Module Initialized.";
};
