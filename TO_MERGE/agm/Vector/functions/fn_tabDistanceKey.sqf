// by commy2

#define DELAY 0.3

private["_rscLayer", "_dlgVector", "_ctrlVectorCenter", "_ctrlVectorCrosshair", "_ctrlDigit0", "_ctrlDigit1", "_ctrlDigit2", "_ctrlDigit3", "_ctrlDigit4", "_ctrlDigit5", "_ctrlDigit6", "_ctrlDigit7", "_ctrlDigit8", "_ctrlDigit9", "_ctrlDigitE1", "_ctrlDigitE2", "_ctrlDigitE3", "_ctrlDigitE4", "_allControls", "_hold", "_time", "_theCount"];

disableSerialization;
_rscLayer = ["AGM_Vector"] call BIS_fnc_rscLayer;
_rscLayer cutRsc ["AGM_Vector", "PLAIN", 0, false];

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


if (AGM_vectorSettings select 0) then {
  _ctrlVectorCrosshair ctrlShow true;
  _ctrlVectorCrosshair ctrlSetText "\AGM_Vector\rsc\Vector_Crosshair.paa";
};

if (AGM_vectorSettings select 1) then {
  {_x ctrlSetTextColor [1, 0, 0, 1]} forEach _allControls;
};

_hold = true;
_time = time;

waitUntil {
  if !(AGM_vectorKey select 1) then {
    _hold = false;
  };
  time > _time + DELAY || {!_hold}
};

if (_hold) then {
  if (AGM_vectorKey select 0) then {
    AGM_Vector_scriptHandle = 0 spawn AGM_Vector_fnc_modeDistanceAzimuth;
  } else {
    AGM_Vector_scriptHandle = 0 spawn AGM_Vector_fnc_modeDistance;
  };
} else {
  waitUntil {time > _time + DELAY};
  if (AGM_vectorKey select 1) then {
    if (AGM_vectorKey select 0) then {
      //R tab + (L + R) hold
      waitUntil {!(AGM_vectorKey select 1)};
      AGM_isVectorReady = true;
    } else {
      AGM_Vector_scriptHandle = 0 spawn AGM_Vector_fnc_modeDistanceHeight;
    };
  } else {
    if (AGM_vectorKey select 0) then {
      //R tab + L hold
      waitUntil {!(AGM_vectorKey select 1)};
      AGM_isVectorReady = true;
    } else {
      //R tab
      waitUntil {!(AGM_vectorKey select 1)};

      _theCount = AGM_vectorConfig select 0;
      _time = AGM_vectorConfig select 1;

      if (time < _time + 1 && {_theCount >= 0}) then {
        _theCount = _theCount + 1;
        if (_theCount >= 5) then {
          AGM_vectorConfig = [0, time];
          0 spawn AGM_Vector_config;
        } else {
          AGM_vectorConfig = [_theCount, time];
          AGM_isVectorReady = true;
        };
      } else {
        AGM_vectorConfig = [1, time];
        AGM_isVectorReady = true;
      };
    };
  };
};
