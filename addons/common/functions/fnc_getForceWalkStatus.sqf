/*
 * Author: PabstMirror, commy2
 * Returns reasons why the unit is forceWalk-ing.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Force Walk reasons <ARRAY>
 *
 * Example:
 * [ACE_Player] call ace_common_fnc_getForceWalkStatus
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

//Now just a wrapper for FUNC(statusEffect_get) [No longer used in ace as of 3.5]
ACE_DEPRECATED("ace_common_fnc_getForceWalkStatus","3.7.0","ace_common_fnc_statusEffect_get");

([_unit, "forceWalk"] call FUNC(statusEffect_get)) select 1
