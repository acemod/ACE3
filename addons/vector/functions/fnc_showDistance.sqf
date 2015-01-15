// by commy2
#include "script_component.hpp"

private ["_dlgVector", "_ctrlDigit1", "_ctrlDigit2", "_ctrlDigit3", "_ctrlDigit4"];

disableSerialization;
_dlgVector = GETUVAR(ACE_dlgVector,displayNull);

_ctrlDigit1 = _dlgVector displayCtrl 1311;
_ctrlDigit2 = _dlgVector displayCtrl 1312;
_ctrlDigit3 = _dlgVector displayCtrl 1313;
_ctrlDigit4 = _dlgVector displayCtrl 1314;

private ["_distance", "_digits"];

_distance = call FUNC(getDistance);

_digits = [_distance] call FUNC(convertToTexturesDistance);

_ctrlDigit1 ctrlSetText (_digits select 0);
_ctrlDigit2 ctrlSetText (_digits select 1);
_ctrlDigit3 ctrlSetText (_digits select 2);
_ctrlDigit4 ctrlSetText (_digits select 3);
