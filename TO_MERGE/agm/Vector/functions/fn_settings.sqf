// by commy2

private["_dlgVector", "_ctrlVectorCenter", "_ctrlVectorCrosshair", "_ctrlDigit0", "_ctrlDigit1", "_ctrlDigit2", "_ctrlDigit3", "_ctrlDigit4", "_ctrlDigit5", "_ctrlDigit6", "_ctrlDigit7", "_ctrlDigit8", "_ctrlDigit9", "_ctrlDigitE1", "_ctrlDigitE2", "_ctrlDigitE3", "_ctrlDigitE4", "_isFeet", "_isMil", "_time", "_theCount"];

disableSerialization;
_dlgVector = uiNamespace getVariable "AGM_dlgVector";
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

_ctrlDigit6 ctrlSetText "\AGM_Vector\rsc\dU.paa";
_ctrlDigit7 ctrlSetText "\AGM_Vector\rsc\dn.paa";
_ctrlDigit8 ctrlSetText "\AGM_Vector\rsc\di.paa";
_ctrlDigit9 ctrlSetText "\AGM_Vector\rsc\dt.paa";
_ctrlDigit0 ctrlSetText "\AGM_Vector\rsc\d5.paa";
_ctrlDigit1 ctrlSetText "\AGM_Vector\rsc\dE.paa";
_ctrlDigit2 ctrlSetText "\AGM_Vector\rsc\dt.paa";
_ctrlDigit3 ctrlSetText "\AGM_Vector\rsc\dt.paa";

sleep 2;

{_x ctrlSetText ""} forEach [
  _ctrlDigit6,
  _ctrlDigit7,
  _ctrlDigit8,
  _ctrlDigit9,
  _ctrlDigit0,
  _ctrlDigit1,
  _ctrlDigit2,
  _ctrlDigit3
];

_isMil = AGM_vectorSettings select 2;
_isFeet = AGM_vectorSettings select 3;

if (_isMil) then {
  _ctrlDigit6 ctrlSetText "\AGM_Vector\rsc\d6.paa";
  _ctrlDigit7 ctrlSetText "\AGM_Vector\rsc\d4.paa";
  _ctrlDigit8 ctrlSetText "\AGM_Vector\rsc\d0.paa";
  _ctrlDigit9 ctrlSetText "\AGM_Vector\rsc\d0.paa";
} else {
  _ctrlDigit6 ctrlSetText "\AGM_Vector\rsc\d3.paa";
  _ctrlDigit7 ctrlSetText "\AGM_Vector\rsc\d6.paa";
  _ctrlDigit8 ctrlSetText "\AGM_Vector\rsc\d0.paa";
  _ctrlDigit9 ctrlSetText "\AGM_Vector\rsc\do.paa";
};
if (_isFeet) then {
  _ctrlDigit0 ctrlSetText "\AGM_Vector\rsc\dF.paa";
  _ctrlDigit1 ctrlSetText "\AGM_Vector\rsc\dE.paa";
  _ctrlDigit2 ctrlSetText "\AGM_Vector\rsc\dE.paa";
  _ctrlDigit3 ctrlSetText "\AGM_Vector\rsc\dt.paa";
} else {
  _ctrlDigit0 ctrlSetText "\AGM_Vector\rsc\d5.paa";
  _ctrlDigit1 ctrlSetText "\AGM_Vector\rsc\d1.paa";
  _ctrlDigit2 ctrlSetText "\AGM_Vector\rsc\d-.paa";
  _ctrlDigit3 ctrlSetText "\AGM_Vector\rsc\dU.paa";
};

waitUntil {
  if (AGM_vectorKey select 1) then {
    waitUntil {
      !(AGM_vectorKey select 1) || AGM_vectorKey select 0
    };
    if !(AGM_vectorKey select 0) then {
      if (_isMil) then {
        if (_isFeet) then {
          _isMil = false;
          _isFeet = true;
        } else {
          _isMil = true;
          _isFeet = true;
        };
      } else {
        if (_isFeet) then {
          _isMil = false;
          _isFeet = false;
        } else {
          _isMil = true;
          _isFeet = false;
        };
      };
    };
    if (_isMil) then {
      _ctrlDigit6 ctrlSetText "\AGM_Vector\rsc\d6.paa";
      _ctrlDigit7 ctrlSetText "\AGM_Vector\rsc\d4.paa";
      _ctrlDigit8 ctrlSetText "\AGM_Vector\rsc\d0.paa";
      _ctrlDigit9 ctrlSetText "\AGM_Vector\rsc\d0.paa";
    } else {
      _ctrlDigit6 ctrlSetText "\AGM_Vector\rsc\d3.paa";
      _ctrlDigit7 ctrlSetText "\AGM_Vector\rsc\d6.paa";
      _ctrlDigit8 ctrlSetText "\AGM_Vector\rsc\d0.paa";
      _ctrlDigit9 ctrlSetText "\AGM_Vector\rsc\do.paa";
    };
    if (_isFeet) then {
      _ctrlDigit0 ctrlSetText "\AGM_Vector\rsc\dF.paa";
      _ctrlDigit1 ctrlSetText "\AGM_Vector\rsc\dE.paa";
      _ctrlDigit2 ctrlSetText "\AGM_Vector\rsc\dE.paa";
      _ctrlDigit3 ctrlSetText "\AGM_Vector\rsc\dt.paa";
    } else {
      _ctrlDigit0 ctrlSetText "\AGM_Vector\rsc\d5.paa";
      _ctrlDigit1 ctrlSetText "\AGM_Vector\rsc\d1.paa";
      _ctrlDigit2 ctrlSetText "\AGM_Vector\rsc\d-.paa";
      _ctrlDigit3 ctrlSetText "\AGM_Vector\rsc\dU.paa";
    };
  };
  AGM_vectorKey select 0
};

_time = time;
waitUntil {
  if (AGM_vectorKey select 1) then {_time = -1};
  !(AGM_vectorKey select 0) || time > _time + 1
};

_theCount = 1;
waitUntil {
  if (AGM_vectorKey select 0) then {
    _theCount = _theCount + 1;
    _time = time;
    waitUntil {!(AGM_vectorKey select 0) || time > _time + 1};
  };
  if (AGM_vectorKey select 1) then {_time = -1};
  time > _time + 1 || {_theCount >= 5}
};

if (_theCount >= 5) then {
  _ctrlDigitE1 ctrlSetText "\AGM_Vector\rsc\d5.paa";
  _ctrlDigitE2 ctrlSetText "\AGM_Vector\rsc\dt.paa";
  _ctrlDigitE3 ctrlSetText "\AGM_Vector\rsc\dq.paa";
  _ctrlDigitE4 ctrlSetText "\AGM_Vector\rsc\dr.paa";

  AGM_vectorSettings set [2, _isMil];
  AGM_vectorSettings set [3, _isFeet];

  sleep 2;

  {_x ctrlSetText ""} forEach [
    _ctrlDigit6,
    _ctrlDigit7,
    _ctrlDigit8,
    _ctrlDigit9,
    _ctrlDigit0,
    _ctrlDigit1,
    _ctrlDigit2,
    _ctrlDigit3,
    _ctrlDigitE1,
    _ctrlDigitE2,
    _ctrlDigitE3,
    _ctrlDigitE4
  ];
} else {
  _ctrlDigit6 ctrlSetText "";
  _ctrlDigit7 ctrlSetText "\AGM_Vector\rsc\d0.paa";
  _ctrlDigit8 ctrlSetText "\AGM_Vector\rsc\d1.paa";
  _ctrlDigit9 ctrlSetText "\AGM_Vector\rsc\dd.paa";
  _ctrlDigit0 ctrlSetText "\AGM_Vector\rsc\dU.paa";
  _ctrlDigit1 ctrlSetText "\AGM_Vector\rsc\dn.paa";
  _ctrlDigit2 ctrlSetText "\AGM_Vector\rsc\di.paa";
  _ctrlDigit3 ctrlSetText "\AGM_Vector\rsc\dt.paa";

  sleep 2;

  {_x ctrlSetText ""} forEach [
    _ctrlDigit7,
    _ctrlDigit8,
    _ctrlDigit9,
    _ctrlDigit0,
    _ctrlDigit1,
    _ctrlDigit2,
    _ctrlDigit3
  ];
};

AGM_isVectorReady = true;
