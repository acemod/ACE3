/*
 * Author: commy2
 *
 * Initializes the Rallypoint module.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None
 */

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

{
  _x setVariable ["ACE_canMoveRallypoint", true];
} forEach _units;

diag_log text "[ACE]: Rallypoint Module Initialized.";
