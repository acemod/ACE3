#include "script_component.hpp"
/*
 * Author: mharis001
 * Handles clicking the triage select buttons.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Target <OBJECT>
 * 2: Triage status <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY, _target, 0] call ace_medical_gui_fnc_handleTriageSelect
 *
 * Public: No
 */

params ["_display", "_target", "_triageLevel"];

[_display] call FUNC(toggleTriageSelect);
[_target, _triageLevel] call EFUNC(medical_treatment,setTriageStatus);
