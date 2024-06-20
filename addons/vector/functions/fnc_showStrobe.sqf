#include "..\script_component.hpp"

disableSerialization;
private _dlgVector = GETUVAR(ACE_dlgVector,displayNull);

private _strobe = if (GVAR(minDistance) < 100) then [{ GVAR(minDistance) }, { 99 }];

private _tens = (floor (_strobe / 10)) mod 10;
private _ones = _strobe mod 10;

private _digit1 = format [QPATHTOF(rsc\vector_%1.paa), _tens];
private _digit2 = format [QPATHTOF(rsc\vector_%1.paa), _ones];

(_dlgVector displayCtrl IDC_DIGIT_STR_HEADER) ctrlSetText QPATHTOF(rsc\vector_strobe.paa);
(_dlgVector displayCtrl IDC_DIGIT_STR1) ctrlSetText _digit1;
(_dlgVector displayCtrl IDC_DIGIT_STR2) ctrlSetText _digit2;

// [GVAR(illuminate)] call FUNC(illuminate);
