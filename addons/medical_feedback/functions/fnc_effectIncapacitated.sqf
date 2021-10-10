#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Creates the incapacitation effect.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_feedback_fnc_effectIncapacitated
 *
 * Public: No
 */

GVAR(ppIncapacitationBlur)  ppEffectEnable true;
GVAR(ppIncapacitationGlare) ppEffectEnable true;

GVAR(ppIncapacitationBlur)  ppEffectAdjust [6];
GVAR(ppIncapacitationGlare) ppEffectAdjust [1.2, 2, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 0]];
GVAR(ppIncapacitationBlur)  ppEffectCommit 0;
GVAR(ppIncapacitationGlare) ppEffectCommit 0;

GVAR(ppIncapacitationBlur)  ppEffectAdjust [0];
GVAR(ppIncapacitationGlare) ppEffectAdjust [1.0, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 0]];
GVAR(ppIncapacitationBlur)  ppEffectCommit 5;
GVAR(ppIncapacitationGlare) ppEffectCommit 5;
