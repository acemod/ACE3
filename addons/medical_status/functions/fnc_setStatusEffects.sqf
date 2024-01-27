#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Sets status effects for a unit.
 * For Internal Use: Called by FUNC(setUnconsciousState), FUNC(handleKilled), and on featureCamera changes.
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: Status effects value <BOOL>
 * 2: Skip setHidden <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit", "_set", ["_skipSetHidden", false]];
TRACE_3("setStatusEffect",_unit,_set,_skipSetHidden);

// Block radio on unconsciousness for compatibility with captive module
[_unit, "blockRadio", "ace_unconscious", _set] call EFUNC(common,statusEffect_set);

// Block speaking on unconsciousness
[_unit, "blockSpeaking", "ace_unconscious", _set] call EFUNC(common,statusEffect_set);

if (_skipSetHidden) exitWith {};

// Stop AI firing at unconscious units in most situations (global effect)
[_unit, "setHidden", "ace_unconscious", _set] call EFUNC(common,statusEffect_set);
