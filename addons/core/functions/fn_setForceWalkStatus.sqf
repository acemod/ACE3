/*
Name: GVAR(fnc_setForceWalkStatus)

Author: Pabst Mirror (from captivity by commy2)

Description:
  Sets the forceWalk status of an unit. This allows the handling of more than one reason to set forceWalk.
  Unit will force walk until all reasons are removed.

Parameters:
  0: OBJECT - Unit
  1: STRING - Reason for forcing walking
  2: BOOL - Is the reason still valid.  True to force walk, false to remove restriction.

Returns:
  None

Example:
  [AGM_Player, "BrokenLeg", true] call GVAR(fnc_setForceWalkStatus)
*/

private ["_unit", "_reason", "_status", "_forceWalkReasons", "_unitForceWalkReasons", "_forceWalkReasonsBooleans", "_bitmaskNumber"];

_unit = _this select 0;
_reason = _this select 1;
_status = _this select 2;

_forceWalkReasons = missionNamespace getVariable ["AGM_forceWalkReasons", []];

// register new reason (these reasons are shared publicly, since units can change ownership, but keep their forceWalk status)
if !(_reason in _forceWalkReasons) then {
  _forceWalkReasons pushBack _reason;
  AGM_forceWalkReasons = _forceWalkReasons;
  publicVariable "AGM_forceWalkReasons";
};

// get reasons why the unit is forceWalking already and update to the new status
_unitForceWalkReasons = [_unit] call GVAR(fnc_getForceWalkStatus);

_forceWalkReasonsBooleans = [];
{
  _forceWalkReasonsBooleans set [_forEachIndex, (_forceWalkReasons select _forEachIndex)  in _unitForceWalkReasons];
} forEach _forceWalkReasons;

_forceWalkReasonsBooleans set [_forceWalkReasons find _reason, _status];

_bitmaskNumber = _forceWalkReasonsBooleans call GVAR(fnc_toBitmask);

_unit setVariable ["AGM_forceWalkStatusNumber", _bitmaskNumber, true];

// actually apply the forceWalk command globaly
[[_unit], "GVAR(fnc_applyForceWalkStatus)", _unit] call GVAR(fnc_execRemoteFnc);
