// by commy2

private["_dlgVector", "_ctrlVectorCenter", "_ctrlDigit1", "_ctrlDigit2", "_ctrlDigit3", "_ctrlDigit4", "_ctrlDigit5", "_ctrlDigit6", "_ctrlDigit7", "_ctrlDigit8", "_direction", "_azimuth", "_exit", "_distance", "_digits", "_inclination", "_height", "_lenght"];

disableSerialization;
_dlgVector = uiNamespace getVariable "AGM_dlgVector";
_ctrlVectorCenter = _dlgVector displayCtrl 1;
_ctrlDigit1 = _dlgVector displayCtrl 11;
_ctrlDigit2 = _dlgVector displayCtrl 12;
_ctrlDigit3 = _dlgVector displayCtrl 13;
_ctrlDigit4 = _dlgVector displayCtrl 14;
_ctrlDigit5 = _dlgVector displayCtrl 15;
_ctrlDigit6 = _dlgVector displayCtrl 16;
_ctrlDigit7 = _dlgVector displayCtrl 17;
_ctrlDigit8 = _dlgVector displayCtrl 18;

_ctrlVectorCenter ctrlSetText "\AGM_Vector\rsc\Vector_Center.paa";

_exit = false;
waitUntil {
  if (AGM_vectorKey select 0) then {_exit = true};
  !(AGM_vectorKey select 1) || {_exit}
};
if (_exit) exitWith {
  waitUntil {!(AGM_vectorKey select 0)};
  AGM_Vector_scriptHandle = 0 spawn AGM_Vector_fnc_modeRelativeDistanceHeight;
};

_distance = call AGM_Vector_fnc_getDistance;
_direction = call AGM_Vector_fnc_getDirection;
_azimuth = _direction select 0;
_inclination = _direction select 1;

_height = sin _inclination * _distance;
_lenght = cos _inclination * _distance;
if (_distance == -9999) then {
  _height = -9999;
  _lenght = -9999;
};

_digits = _height call AGM_Vector_fnc_convertDistance;
_ctrlDigit1 ctrlSetText (_digits select 0);
_ctrlDigit2 ctrlSetText (_digits select 1);
_ctrlDigit3 ctrlSetText (_digits select 2);
_ctrlDigit4 ctrlSetText (_digits select 3);

_digits = _lenght call AGM_Vector_fnc_convertDistance;
_ctrlDigit5 ctrlSetText (_digits select 0);
_ctrlDigit6 ctrlSetText (_digits select 1);
_ctrlDigit7 ctrlSetText (_digits select 2);
_ctrlDigit8 ctrlSetText (_digits select 3);

_ctrlVectorCenter ctrlShow false;

AGM_isVectorReady = true;
