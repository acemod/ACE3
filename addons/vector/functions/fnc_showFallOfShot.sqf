#include "script_component.hpp"
/*
 * Author: commy2
 *
 *
 * Arguments:
 * 0: Unknown <UNKNOWN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [?] call ace_vector_fnc_showFallOfShot
 *
 * Public: No
 */

GVAR(FOSState) = _this select 0;

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

private _fosData = GVAR(FOSData);

if !(_this select 0) then {
    // of ordinate
    private _digits = [_fosData, 1] call FUNC(convertToTexturesFOS);

    (_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetText (_digits select 0);
    (_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText (_digits select 1);
    (_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText (_digits select 2);
    (_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText (_digits select 3);
    (_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText (_digits select 4);

    // of abscissa
    _digits = [_fosData, 0] call FUNC(convertToTexturesFOS);

    (_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText (_digits select 0);
    (_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText (_digits select 1);
    (_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText (_digits select 2);
    (_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText (_digits select 3);
    (_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetText (_digits select 4);

} else {
    // applicate
    private _digits = [_fosData, 2] call FUNC(convertToTexturesFOS);

    (_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetText (_digits select 0);
    (_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText (_digits select 1);
    (_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText (_digits select 2);
    (_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText (_digits select 3);
    (_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText (_digits select 4);

    // nothing
    (_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText "";
    (_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText "";
    (_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText "";
    (_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText "";
    (_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetText "";

};

[GVAR(illuminate)] call FUNC(illuminate);
