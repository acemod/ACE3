// by commy2
#include "script_component.hpp"

private ["_dlgVector", "_ctrlDigit5", "_ctrlDigit6", "_ctrlDigit7", "_ctrlDigit8"];

disableSerialization;
_dlgVector = GETUVAR(ACE_dlgVector,displayNull);

_ctrlDigit5 = _dlgVector displayCtrl 1315;
_ctrlDigit6 = _dlgVector displayCtrl 1316;
_ctrlDigit7 = _dlgVector displayCtrl 1317;
_ctrlDigit8 = _dlgVector displayCtrl 1318;

private ["_direction", "_digits"];

_direction = call FUNC(getDirection);

_digits = _direction call FUNC(convertToTexturesDegree);

_ctrlDigit5 ctrlSetText (_digits select 0);
_ctrlDigit6 ctrlSetText (_digits select 1);
_ctrlDigit7 ctrlSetText (_digits select 2);
_ctrlDigit8 ctrlSetText (_digits select 3);
