#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if dogtag can be checked.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * True if dogtag can be checked <BOOL>
 *
 * Example:
 * _canCheck = [player, unit] call ace_dogtags_fnc_canCheckDogtag
 *
 * Public: No
 */

params ["_player", "_target"];

if (isNull _target) exitWith {false};

// check if disabled for faction
if ([GVAR(disabledFactions) getVariable faction _target] param [0, false]) exitWith {false};

(!alive _target) || {_target getVariable ["ACE_isUnconscious", false]}
