#include "script_component.hpp"
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
 * call ace_vector_fnc_showAzimuth
 *
 * Public: No
 */

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

private _direction = call FUNC(getDirection);

private _digits = _direction call FUNC(convertToTexturesDegree);

(_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetText (_digits select 0);
(_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetText (_digits select 1);
(_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetText (_digits select 2);
(_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetText (_digits select 3);

[GVAR(illuminate)] call FUNC(illuminate);
