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
 * call ace_vector_fnc_showDistance
 *
 * Public: No
 */

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

private _distance = call FUNC(getDistance);

private _digits = [_distance] call FUNC(convertToTexturesDistance);

(_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetText (_digits select 0);
(_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetText (_digits select 1);
(_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetText (_digits select 2);
(_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetText (_digits select 3);

[GVAR(illuminate)] call FUNC(illuminate);
