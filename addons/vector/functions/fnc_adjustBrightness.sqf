#include "script_component.hpp"
/*
 * Author: commy2
 *
 *
 * Arguments:
 * 0: Number <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [5] call ace_vector_fnc_adjustBrigthness
 *
 * Public: No
 */

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

private _color = [[1,0,0,0.5], [1,0,0,1]] select (_this select 0);

(_dlgVector displayCtrl IDC_CENTER) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_CROSSHAIR) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_0) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_1) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_2) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_3) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_4) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_5) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_6) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_7) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_8) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_9) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_E1) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_E2) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_E3) ctrlSetTextColor _color;
(_dlgVector displayCtrl IDC_DIGIT_E4) ctrlSetTextColor _color;

GVAR(illuminate) = _this select 0;

_this call FUNC(illuminate);
