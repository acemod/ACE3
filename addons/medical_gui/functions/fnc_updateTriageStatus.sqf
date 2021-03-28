#include "script_component.hpp"
/*
 * Author: mharis001
 * Updates the triage status control for the given target.
 *
 * Arguments:
 * 0: Display <CONTROL>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display, _target] call ace_medical_gui_fnc_updateTriageStatus
 *
 * Public: No
 */

params ["_display", "_target"];

private _triageStatus = [_target] call EFUNC(medical_treatment,getTriageStatus);
_triageStatus params ["", "_triageText", "_triageColor", "_triageTextColor"];

private _ctrlTriage = _display displayCtrl IDC_TRIAGE_STATUS;
_ctrlTriage ctrlSetText _triageText;
_ctrlTriage ctrlSetBackgroundColor _triageColor;
_ctrlTriage ctrlSetTextColor _triageTextColor;
