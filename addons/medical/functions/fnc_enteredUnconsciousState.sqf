/*
 * Author: Glowbal
 * Handle entering an unconscious state.
 *
 * Arguments:
 * 0: The unit that will be put in an unconscious state <OBJECT>
 * 1: Set unconsciouns <BOOL> (default: true)
 * 2: Minimum unconscious time <NUMBER> (default: (round(random(10)+5)))
 * 3: Force AI Unconscious (skip random death chance) <BOOL> (default: false)
 *
 * ReturnValue:
 * nil
 *
 * Public: no
 */

#include "script_component.hpp"

#define DEFAULT_DELAY (round(random(10)+5))

params ["_unit", "_event", "_args"];

[_unit, true] call FUNC(setUnconscious);
