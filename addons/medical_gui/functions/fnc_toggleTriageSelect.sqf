#include "script_component.hpp"
/*
 * Author: mharis001
 * Toggles showing of the triage select buttons.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY] call ace_medical_gui_fnc_toggleTriageSelect
 *
 * Public: No
 */

params ["_display"];

private _ctrlTriageSelect = _display displayCtrl IDC_TRIAGE_SELECT;
private _show = !ctrlShown _ctrlTriageSelect;

_ctrlTriageSelect ctrlEnable _show;
_ctrlTriageSelect ctrlShow _show;
