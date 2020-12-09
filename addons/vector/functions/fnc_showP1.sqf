#include "script_component.hpp"
/*
 * Author: commy2
 * Shows or hides the 1-P text line.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_vector_fnc_showP1
 *
 * Public: No
 */

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

if (_this select 0) then {
    (_dlgVector displayCtrl IDC_DIGIT_E1) ctrlSetText QPATHTOF(rsc\vector_1.paa);
    (_dlgVector displayCtrl IDC_DIGIT_E2) ctrlSetText QPATHTOF(rsc\vector_minus.paa);
    (_dlgVector displayCtrl IDC_DIGIT_E3) ctrlSetText QPATHTOF(rsc\vector_p.paa);
    (_dlgVector displayCtrl IDC_DIGIT_E4) ctrlSetText "";
} else {
    (_dlgVector displayCtrl IDC_DIGIT_E1) ctrlSetText "";
    (_dlgVector displayCtrl IDC_DIGIT_E2) ctrlSetText "";
    (_dlgVector displayCtrl IDC_DIGIT_E3) ctrlSetText "";
    (_dlgVector displayCtrl IDC_DIGIT_E4) ctrlSetText "";
};

[GVAR(illuminate)] call FUNC(illuminate);
