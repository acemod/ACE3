// by commy2

private["_dlgVector", "_ctrlVectorCenter", "_ctrlDigit1", "_ctrlDigit2", "_ctrlDigit3", "_ctrlDigit4", "_ctrlDigit5", "_ctrlDigit6", "_ctrlDigit7", "_ctrlDigit8", "_ctrlDigitE1", "_ctrlDigitE2", "_ctrlDigitE3", "_distanceP1", "_directionP1", "_azimuthP1", "_inclinationP1", "_directionP2", "_azimuthP2", "_distanceP2",  "_inclinationP2", "_digits", "_relDirection", "_relDistance", "_relHeight", "_relLenght", "_digits0", "_digits1", "_digits2", "_lenghtP1", "_lenghtP2", "_relAzimuth"];

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

_relDirection = sqrt ((_azimuthP1 - _azimuthP2)^2 + (_inclinationP1 - _inclinationP2)^2);
_relDistance = sqrt (_distanceP1^2 + _distanceP2^2 - 2 * _distanceP1 * _distanceP2 * cos _relDirection);
_relHeight = (sin _inclinationP1 * _distanceP1) - (sin _inclinationP2 * _distanceP2);
_relLenght = sqrt (_relDistance^2 - _relHeight^2); if (str(_relLenght) == "-1.#IND") then {_relLenght = 0};

_lenghtP1 = cos _inclinationP1 * _distanceP1;
_lenghtP2 = cos _inclinationP2 * _distanceP2;
_relAzimuth = (sin _azimuthP2 * _lenghtP2 - sin _azimuthP1 * _lenghtP1) atan2 (cos _azimuthP2 * _lenghtP2 - cos _azimuthP1 * _lenghtP1);
if (_relAzimuth < 0) then {_relAzimuth = _relAzimuth + 360};

if (_distanceP1 == -9999 || {_distanceP2 == -9999}) then {
  _relDistance = -9999;
  _relAzimuth = -9999;
};

_digits = _relLenght call AGM_Vector_fnc_convertDistance;
_ctrlDigit1 ctrlSetText (_digits select 0);
_ctrlDigit2 ctrlSetText (_digits select 1);
_ctrlDigit3 ctrlSetText (_digits select 2);
_ctrlDigit4 ctrlSetText (_digits select 3);

_digits = _relAzimuth call AGM_Vector_fnc_convertDegree;
_ctrlDigit5 ctrlSetText (_digits select 0);
_ctrlDigit6 ctrlSetText (_digits select 1);
_ctrlDigit7 ctrlSetText (_digits select 2);
_ctrlDigit8 ctrlSetText (_digits select 3);

_ctrlVectorCenter ctrlShow false;

_ctrlDigitE1 ctrlShow false;
_ctrlDigitE2 ctrlShow false;
_ctrlDigitE3 ctrlShow false;

AGM_isVectorReady = true;
