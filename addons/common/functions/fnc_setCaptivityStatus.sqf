/*
 * Author: commy2
 * Set the captivity status of an unit. This allows the handling of more than one reason to set a unit captive.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: The reason of the captivity <STRING>
 * 2: Is the reason still valid? True for setting this reason, false for removing it <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_reason", "_status"];

//Now just a wrapper for FUNC(statusEffect_set) [No longer used in ace as of 3.5]
ACE_DEPRECATED("ace_common_fnc_setCaptivityStatus","3.7.0","ace_common_fnc_statusEffect_set");

[_unit, "setCaptive", _reason, _status] call FUNC(statusEffect_set);
