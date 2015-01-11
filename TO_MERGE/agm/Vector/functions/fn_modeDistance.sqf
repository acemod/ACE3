// by commy2

private["_dlgVector", "_ctrlVectorCenter", "_ctrlDigit1", "_ctrlDigit2", "_ctrlDigit3", "_ctrlDigit4", "_ctrlDigit5", "_ctrlDigit6", "_ctrlDigit7", "_ctrlDigit8", "_exit", "_distance", "_digits"];

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
  AGM_Vector_scriptHandle = 0 spawn AGM_Vector_fnc_modeRelativeDistance;
};

_distance = call AGM_Vector_fnc_getDistance;

_digits = _distance call AGM_Vector_fnc_convertDistance;
_ctrlDigit1 ctrlSetText (_digits select 0);
_ctrlDigit2 ctrlSetText (_digits select 1);
_ctrlDigit3 ctrlSetText (_digits select 2);
_ctrlDigit4 ctrlSetText (_digits select 3);

_ctrlVectorCenter ctrlShow false;

AGM_isVectorReady = true;
