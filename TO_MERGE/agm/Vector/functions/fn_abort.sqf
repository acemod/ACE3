// by commy2

private["_dlgVector", "_ctrlVectorCenter", "_ctrlVectorCrosshair", "_ctrlDigit0", "_ctrlDigit1", "_ctrlDigit2", "_ctrlDigit3", "_ctrlDigit4", "_ctrlDigit5", "_ctrlDigit6", "_ctrlDigit7", "_ctrlDigit8", "_ctrlDigit9", "_ctrlDigitE1", "_ctrlDigitE2", "_ctrlDigitE3", "_ctrlDigitE4", "_allControls"];

waitUntil {currentWeapon player != "AGM_Vector" || {cameraView != "Gunner"}};

terminate AGM_Vector_scriptHandle;

disableSerialization;
_dlgVector = uiNamespace getVariable "AGM_dlgVector";
_ctrlVectorCenter = _dlgVector displayCtrl 1;
_ctrlVectorCrosshair = _dlgVector displayCtrl 2;
_ctrlDigit0 = _dlgVector displayCtrl 10;
_ctrlDigit1 = _dlgVector displayCtrl 11;
_ctrlDigit2 = _dlgVector displayCtrl 12;
_ctrlDigit3 = _dlgVector displayCtrl 13;
_ctrlDigit4 = _dlgVector displayCtrl 14;
_ctrlDigit5 = _dlgVector displayCtrl 15;
_ctrlDigit6 = _dlgVector displayCtrl 16;
_ctrlDigit7 = _dlgVector displayCtrl 17;
_ctrlDigit8 = _dlgVector displayCtrl 18;
_ctrlDigit9 = _dlgVector displayCtrl 19;
_ctrlDigitE1 = _dlgVector displayCtrl 21;
_ctrlDigitE2 = _dlgVector displayCtrl 22;
_ctrlDigitE3 = _dlgVector displayCtrl 23;
_ctrlDigitE4 = _dlgVector displayCtrl 24;

_allControls = [
  _ctrlVectorCenter,
  _ctrlVectorCrosshair,
  _ctrlDigit0,
  _ctrlDigit1,
  _ctrlDigit2,
  _ctrlDigit3,
  _ctrlDigit4,
  _ctrlDigit5,
  _ctrlDigit6,
  _ctrlDigit7,
  _ctrlDigit8,
  _ctrlDigit9,
  _ctrlDigitE1,
  _ctrlDigitE2,
  _ctrlDigitE3,
  _ctrlDigitE4
];

{_x ctrlShow false} forEach _allControls;

AGM_isVectorReady = true;
