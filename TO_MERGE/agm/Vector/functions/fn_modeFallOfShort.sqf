// by commy2

private["_dlgVector", "_ctrlVectorCenter", "_ctrlDigit1", "_ctrlDigit2", "_ctrlDigit3", "_ctrlDigit4", "_ctrlDigit5", "_ctrlDigit6", "_ctrlDigit7", "_ctrlDigit8", "_ctrlDigit9", "_ctrlDigitE1", "_ctrlDigitE2", "_ctrlDigitE3", "_distanceP1", "_directionP1", "_azimuthP1", "_inclinationP1", "_directionP2", "_azimuthP2", "_abscissa", "_ordinate", "_applicate", "_distanceP2", "_digits", "_inclinationP2", "_height", "_lenght", "_digits0", "_digits1", "_digits2"];

disableSerialization;
_dlgVector = uiNamespace getVariable "AGM_dlgVector";
_ctrlVectorCenter = _dlgVector displayCtrl 1;
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

_ctrlVectorCenter ctrlSetText "\AGM_Vector\rsc\Vector_Center.paa";

_distanceP1 = call AGM_Vector_fnc_getDistance;
_directionP1 = call AGM_Vector_fnc_getDirection;
_azimuthP1 = _directionP1 select 0;
_inclinationP1 = _directionP1 select 1;

_ctrlDigitE1 ctrlSetText "\AGM_Vector\rsc\d1.paa";
_ctrlDigitE2 ctrlSetText "\AGM_Vector\rsc\d-.paa";
_ctrlDigitE3 ctrlSetText "\AGM_Vector\rsc\dP.paa";

waitUntil {!(AGM_vectorKey select 0)};

_distanceP2 = call AGM_Vector_fnc_getDistance;
_directionP2 = call AGM_Vector_fnc_getDirection;
_azimuthP2 = _directionP2 select 0;
_inclinationP2 = _directionP2 select 1;

_abscissa = _distanceP1 * sin (_azimuthP1 - _azimuthP2);
_ordinate = _distanceP1 * cos (_inclinationP1 - _inclinationP2) - _distanceP2 * cos (_azimuthP1 - _azimuthP2);
_applicate = (sin _inclinationP2 * _distanceP2) - (sin _inclinationP1 * _distanceP1);
if (_distanceP1 == -9999 || {_distanceP2 == -9999}) then {
  _abscissa = -9999;
  _ordinate = -9999;
  _applicate = -9999;
};

_digits0 = [_ordinate, 0] call AGM_Vector_fnc_convertFOS;
_digits1 = [_abscissa, 1] call AGM_Vector_fnc_convertFOS;
_digits2 = [_applicate, 2] call AGM_Vector_fnc_convertFOS;

_ctrlVectorCenter ctrlShow false;

_ctrlDigitE1 ctrlShow false;
_ctrlDigitE2 ctrlShow false;
_ctrlDigitE3 ctrlShow false;

waitUntil {
  _ctrlDigit0 ctrlSetText (_digits0 select 0);
  _ctrlDigit1 ctrlSetText (_digits0 select 1);
  _ctrlDigit2 ctrlSetText (_digits0 select 2);
  _ctrlDigit3 ctrlSetText (_digits0 select 3);
  _ctrlDigit4 ctrlSetText (_digits0 select 4);
  _ctrlDigit5 ctrlSetText (_digits1 select 0);
  _ctrlDigit6 ctrlSetText (_digits1 select 1);
  _ctrlDigit7 ctrlSetText (_digits1 select 2);
  _ctrlDigit8 ctrlSetText (_digits1 select 3);
  _ctrlDigit9 ctrlSetText (_digits1 select 4);

  waitUntil {!(AGM_vectorKey select 1) || {AGM_vectorKey select 0}};
  waitUntil {AGM_vectorKey select 1 || {AGM_vectorKey select 0}};

  if !(AGM_vectorKey select 0) then {
    _ctrlDigit0 ctrlSetText (_digits2 select 0);
    _ctrlDigit1 ctrlSetText (_digits2 select 1);
    _ctrlDigit2 ctrlSetText (_digits2 select 2);
    _ctrlDigit3 ctrlSetText (_digits2 select 3);
    _ctrlDigit4 ctrlSetText (_digits2 select 4);
    _ctrlDigit5 ctrlSetText "";
    _ctrlDigit6 ctrlSetText "";
    _ctrlDigit7 ctrlSetText "";
    _ctrlDigit8 ctrlSetText "";
    _ctrlDigit9 ctrlSetText "";
  };

  waitUntil {!(AGM_vectorKey select 1) || {AGM_vectorKey select 0}};
  waitUntil {AGM_vectorKey select 1 || {AGM_vectorKey select 0}};

  AGM_vectorKey select 0
};
_ctrlDigit0 ctrlSetText "";
_ctrlDigit1 ctrlSetText "";
_ctrlDigit2 ctrlSetText "";
_ctrlDigit3 ctrlSetText "";
_ctrlDigit4 ctrlSetText "";
_ctrlDigit5 ctrlSetText "";
_ctrlDigit6 ctrlSetText "";
_ctrlDigit7 ctrlSetText "";
_ctrlDigit8 ctrlSetText "";
_ctrlDigit9 ctrlSetText "";

AGM_isVectorReady = true;
