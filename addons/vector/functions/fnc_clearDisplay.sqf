#include "..\script_component.hpp"
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
        (_dlgVector displayCtrl IDC_DIGIT_AZ_HEADER1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_AZ_HEADER2) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_AZ_HEADER3) ctrlSetText "";

        (_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetText "";
    };

    case ("distance"): {
        (_dlgVector displayCtrl IDC_DIGIT_D1_HEADER1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_D1_HEADER2) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_D1_HEADER3) ctrlSetText "";

        (_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText "";
    };

    case ("distance2"): {
        (_dlgVector displayCtrl IDC_DIGIT_D2_HEADER1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_D2_HEADER2) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_D2_HEADER3) ctrlSetText "";

        (_dlgVector displayCtrl IDC_DIGIT_D2_0) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_D2_1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_D2_2) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_D2_3) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_D2_4) ctrlSetText "";
    };

    case ("time"): {
        (_dlgVector displayCtrl IDC_DIGIT_TH1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_TH2) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_TD1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_TM1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_TM2) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_TD2) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_TS1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_TS2) ctrlSetText "";
    };

    case ("strobe"): {
        (_dlgVector displayCtrl IDC_DIGIT_STR_HEADER) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_STR1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_STR2) ctrlSetText "";
    };

    case ("targetAngle"): {
        (_dlgVector displayCtrl IDC_DIGIT_TGA_HEADER1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_TGA_HEADER2) ctrlSetText "";

        (_dlgVector displayCtrl IDC_DIGIT_TGA1) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_TGA2) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_TGA3) ctrlSetText "";
        (_dlgVector displayCtrl IDC_DIGIT_TGA4) ctrlSetText "";
    };
};
