#include "..\script_component.hpp"
/*
 * Author: commy2
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_vector_fnc_showAzimuthInclination
 *
 * Public: No
 */

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

private _direction = call FUNC(getDirection);

// azimuth
private _digits = [_direction select 0] call FUNC(convertToTexturesDegree);

(_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText (_digits select 0);
(_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText (_digits select 1);
(_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText (_digits select 2);
(_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText (_digits select 3);

// inclination
_digits = [_direction select 1] call FUNC(convertToTexturesDegree);

(_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText (_digits select 0);
(_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText (_digits select 1);
(_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText (_digits select 2);
(_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText (_digits select 3);

[GVAR(illuminate)] call FUNC(illuminate);
