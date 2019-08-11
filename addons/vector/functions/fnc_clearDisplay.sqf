#include "script_component.hpp"
/*
 * Author: commy2
 * Clears the vectors control items.
 *
 * Arguments:
 * 0: "azimuth" or "distance" <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["azimuth"] call ace_vector_fnc_clearDisplay
 *
 * Public: No
 */

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

switch (_this select 0) do {
    case ("azimuth"): {
        (_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetText "";
    };

    case ("distance"): {
        (_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText "";
    };
};
