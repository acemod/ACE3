// by commy2
#include "script_component.hpp"

private ["_dlgVector", "_ctrlDigit1", "_ctrlDigit2", "_ctrlDigit3", "_ctrlDigit4", "_ctrlDigit5", "_ctrlDigit6", "_ctrlDigit7", "_ctrlDigit8"];

disableSerialization;
_dlgVector = GETUVAR(ACE_dlgVector,displayNull);

_ctrlDigit1 = _dlgVector displayCtrl 1311;
_ctrlDigit2 = _dlgVector displayCtrl 1312;
_ctrlDigit3 = _dlgVector displayCtrl 1313;
_ctrlDigit4 = _dlgVector displayCtrl 1314;
_ctrlDigit5 = _dlgVector displayCtrl 1315;
_ctrlDigit6 = _dlgVector displayCtrl 1316;
_ctrlDigit7 = _dlgVector displayCtrl 1317;
_ctrlDigit8 = _dlgVector displayCtrl 1318;

private ["_heightDistance", "_digits"];

_heightDistance = call FUNC(getHeightDistance);

// height
_digits = [_heightDistance select 0] call FUNC(convertToTexturesDistance);

_ctrlDigit1 ctrlSetText (_digits select 0);
_ctrlDigit2 ctrlSetText (_digits select 1);
_ctrlDigit3 ctrlSetText (_digits select 2);
_ctrlDigit4 ctrlSetText (_digits select 3);

// non-slope distance
_digits = [_heightDistance select 1] call FUNC(convertToTexturesDistance);

_ctrlDigit5 ctrlSetText (_digits select 0);
_ctrlDigit6 ctrlSetText (_digits select 1);
_ctrlDigit7 ctrlSetText (_digits select 2);
_ctrlDigit8 ctrlSetText (_digits select 3);
