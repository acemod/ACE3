#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Triggers the dazed effect.
 *
 * Arguments:
 * 0: Enable <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_medical_feedback_fnc_effectDazed
 *
 * Public: No
 */

params ["_enable"];

GVAR(ppDazedDOF) ppEffectEnable _enable;
