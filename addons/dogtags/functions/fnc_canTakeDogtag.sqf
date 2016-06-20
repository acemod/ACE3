/*
 * Author: SzwedzikPL
 * Checks if dogtag can be taken.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * True if dogtag can be taken <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_target"];

if (isNull _target) exitWith {false};

(!alive _target) || {_target getVariable ["ACE_isUnconscious", false]}
