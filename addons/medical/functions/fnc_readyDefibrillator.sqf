/*
 * Author: BaerMitUmlaut
 * Prepares a defibrillator for use on patients.
 *
 * Arguments:
 * 0: Caller <OBJECT>
 * 1: Defibrillator <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_caller", "_defibrillator"];

[20, [_caller, _defibrillator], {
    (_this select 0) params ["_caller", "_defibrillator"];
    _defibrillator setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0.4,0,0,1)"];
}, {}, localize LSTRING(Defibrillator_Readying)] call EFUNC(common,progressBar);
