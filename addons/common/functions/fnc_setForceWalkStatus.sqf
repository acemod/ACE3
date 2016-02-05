/*
 * Author: Pabst Mirror (from captivity by commy2)
 * Sets the forceWalk status of an unit. This allows the handling of more than one reason to set forceWalk.
 * Unit will force walk until all reasons are removed.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Reason for forcing walking <STRING>
 * 2: Is the reason still valid.  True to force walk, false to remove restriction. <BOOL>
 *
 * Returns:
 * None
 *
 * Example:
 * [ACE_Player, "BrokenLeg", true] call FUNC(setForceWalkStatus)
 *
 * Public: Yes
*/
#include "script_component.hpp"

params ["_unit", "_reason", "_status"];

//Now just a wrapper for FUNC(statusEffect_set) [No longer used in ace as of 3.5]
ACE_DEPRECATED("ace_common_fnc_setForceWalkStatus","3.7.0","ace_common_fnc_statusEffect_set");

[_unit, "forceWalk", _reason, _status] call FUNC(statusEffect_set);
