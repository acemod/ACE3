#include "..\script_component.hpp"

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

private _time = call FUNC(getInGameTime);
private _hours = _time select 0;
private _minutes = _time select 1;
private _seconds = _time select 2;

private _colon = QPATHTOF(rsc\vector_colon.paa);

private _dh = [_hours] call FUNC(convertToTexturesTimeBlock);
(_dlgVector displayCtrl IDC_DIGIT_TH1) ctrlSetText (_dh select 0);
(_dlgVector displayCtrl IDC_DIGIT_TH2) ctrlSetText (_dh select 1);
(_dlgVector displayCtrl IDC_DIGIT_TD1) ctrlSetText (_colon);

private _dm = [_minutes] call FUNC(convertToTexturesTimeBlock);
(_dlgVector displayCtrl IDC_DIGIT_TM1) ctrlSetText (_dm select 0);
(_dlgVector displayCtrl IDC_DIGIT_TM2) ctrlSetText (_dm select 1);
(_dlgVector displayCtrl IDC_DIGIT_TD2) ctrlSetText (_colon);

private _ds = [_seconds] call FUNC(convertToTexturesTimeBlock);
(_dlgVector displayCtrl IDC_DIGIT_TS1) ctrlSetText (_ds select 0);
(_dlgVector displayCtrl IDC_DIGIT_TS2) ctrlSetText (_ds select 1);

// [GVAR(illuminate)] call FUNC(illuminate);
