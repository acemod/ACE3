/*
 * Author: Pabst Mirror (from captivity by commy2)
 *
 * Sets the forceWalk status of an unit. This allows the handling of more than one reason to set forceWalk.
 * Unit will force walk until all reasons are removed.
 *
 * Argument:
 * 0: OBJECT - Unit
 * 1: STRING - Reason for forcing walking
 * 2: BOOL - Is the reason still valid.  True to force walk, false to remove restriction.
 *
 * Returns:
 * None
 *
 * Example:
 * [ACE_Player, "BrokenLeg", true] call FUNC(setForceWalkStatus)
 *
 * Public: No
*/
#include "script_component.hpp"

private ["_forceWalkReasons", "_unitForceWalkReasons", "_forceWalkReasonsBooleans", "_bitmaskNumber"];

params ["_unit", "_reason", "_status"];

_forceWalkReasons = missionNamespace getVariable ["ACE_forceWalkReasons", []];

// register new reason (these reasons are shared publicly, since units can change ownership, but keep their forceWalk status)
if !(_reason in _forceWalkReasons) then {
  _forceWalkReasons pushBack _reason;
  ACE_forceWalkReasons = _forceWalkReasons;
  publicVariable "ACE_forceWalkReasons";
};

// get reasons why the unit is forceWalking already and update to the new status
_unitForceWalkReasons = [_unit] call FUNC(getForceWalkStatus);

_forceWalkReasonsBooleans = [];
{
  _forceWalkReasonsBooleans set [_forEachIndex, (_forceWalkReasons select _forEachIndex)  in _unitForceWalkReasons];
} forEach _forceWalkReasons;

_forceWalkReasonsBooleans set [_forceWalkReasons find _reason, _status];

_bitmaskNumber = _forceWalkReasonsBooleans call FUNC(toBitmask);

_unit setVariable ["ACE_forceWalkStatusNumber", _bitmaskNumber, true];

// actually apply the forceWalk command globaly
[[_unit], QFUNC(applyForceWalkStatus), 2] call FUNC(execRemoteFnc);
