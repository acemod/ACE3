/*
 * Author: Arcanum
 * Condition for trasfer from FatalInjury to Second chance.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: 1 for AI 0 for player <BOOL>
 * 
 * Return Value:
 * Condition fo state machine <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_unit","_wantAI"];

(GVAR(fatalInjuryConditionAI) > 0) && (QUOTE(_this call FUNC(isAi)) == _wantAI)
