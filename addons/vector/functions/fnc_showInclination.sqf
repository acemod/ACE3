#include "..\script_component.hpp"

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

private _result = call FUNC(getDirection);
private _inclination = _result select 2;

private _digits = [_inclination] call FUNC(convertToTexturesDegreeBelow90);

(_dlgVector displayCtrl IDC_DIGIT_TGA_HEADER1) ctrlSetText QPATHTOF(rsc\vector_u_rus.paa);
(_dlgVector displayCtrl IDC_DIGIT_TGA_HEADER2) ctrlSetText QPATHTOF(rsc\vector_m_rus.paa);

(_dlgVector displayCtrl IDC_DIGIT_TGA1) ctrlSetText (_digits select 0);
(_dlgVector displayCtrl IDC_DIGIT_TGA2) ctrlSetText (_digits select 1);
(_dlgVector displayCtrl IDC_DIGIT_TGA3) ctrlSetText (_digits select 2);
(_dlgVector displayCtrl IDC_DIGIT_TGA4) ctrlSetText (_digits select 3);

[GVAR(illuminate)] call FUNC(illuminate);
