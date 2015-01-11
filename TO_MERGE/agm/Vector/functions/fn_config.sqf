// by commy2

private["_dlgVector", "_ctrlVectorCenter", "_ctrlVectorCrosshair", "_ctrlDigit0", "_ctrlDigit1", "_ctrlDigit2", "_ctrlDigit3", "_ctrlDigit4", "_ctrlDigit5", "_ctrlDigit6", "_ctrlDigit7", "_ctrlDigit8", "_ctrlDigit9", "_ctrlDigitE1", "_ctrlDigitE2", "_ctrlDigitE3", "_ctrlDigitE4", "_allControls", "_isReticle", "_isNVG", "_time", "_theCount"];

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

_ctrlDigit7 ctrlSetText "\AGM_Vector\rsc\dC.paa";
_ctrlDigit8 ctrlSetText "\AGM_Vector\rsc\dq.paa";
_ctrlDigit9 ctrlSetText "\AGM_Vector\rsc\dn.paa";
_ctrlDigit0 ctrlSetText "\AGM_Vector\rsc\dF.paa";
_ctrlDigit1 ctrlSetText "\AGM_Vector\rsc\di.paa";
_ctrlDigit2 ctrlSetText "\AGM_Vector\rsc\dG.paa";

sleep 2;

{_x ctrlSetText ""} forEach [
  _ctrlDigit7,
  _ctrlDigit8,
  _ctrlDigit9,
  _ctrlDigit0,
  _ctrlDigit1,
  _ctrlDigit2
];

_isReticle = AGM_vectorSettings select 0;
_isNVG = AGM_vectorSettings select 1;

if (_isReticle) then {
  if (_isNVG) then {
    _ctrlDigit6 ctrlSetText "\AGM_Vector\rsc\dn.paa";
    _ctrlDigit7 ctrlSetText "\AGM_Vector\rsc\di.paa";
    _ctrlDigit8 ctrlSetText "\AGM_Vector\rsc\dG.paa";
    _ctrlDigit9 ctrlSetText "\AGM_Vector\rsc\dt.paa";
  } else {
    _ctrlDigit6 ctrlSetText "\AGM_Vector\rsc\dE.paa";
    _ctrlDigit7 ctrlSetText "\AGM_Vector\rsc\dr.paa";
    _ctrlDigit8 ctrlSetText "\AGM_Vector\rsc\dE.paa";
    _ctrlDigit9 ctrlSetText "\AGM_Vector\rsc\dt.paa";
  };
  _ctrlDigit0 ctrlSetText "\AGM_Vector\rsc\dq.paa";
  _ctrlDigit1 ctrlSetText "\AGM_Vector\rsc\dn.paa";
  _ctrlDigit2 ctrlSetText "";
  _ctrlDigit3 ctrlSetText "";
} else {
  _ctrlDigit6 ctrlSetText "\AGM_Vector\rsc\dE.paa";
  _ctrlDigit7 ctrlSetText "\AGM_Vector\rsc\dr.paa";
  _ctrlDigit8 ctrlSetText "\AGM_Vector\rsc\dE.paa";
  _ctrlDigit9 ctrlSetText "\AGM_Vector\rsc\dt.paa";
  _ctrlDigit0 ctrlSetText "\AGM_Vector\rsc\dq.paa";
  _ctrlDigit1 ctrlSetText "\AGM_Vector\rsc\dF.paa";
  _ctrlDigit2 ctrlSetText "\AGM_Vector\rsc\dF.paa";
  _ctrlDigit3 ctrlSetText "";
};

waitUntil {
  if (AGM_vectorKey select 0) then {
    waitUntil {
      !(AGM_vectorKey select 0) || {AGM_vectorKey select 1}
    };
    if !(AGM_vectorKey select 1) then {
      if (_isNVG) then {
        _isReticle = false;
        _isNVG = false;
      } else {
        if (_isReticle) then {
          _isReticle = true;
          _isNVG = true;
        } else {
          _isReticle = true;
          _isNVG = false;
        };
      };
    };
    if (_isReticle) then {
      if (_isNVG) then {
        _ctrlDigit6 ctrlSetText "\AGM_Vector\rsc\dn.paa";
        _ctrlDigit7 ctrlSetText "\AGM_Vector\rsc\di.paa";
        _ctrlDigit8 ctrlSetText "\AGM_Vector\rsc\dG.paa";
        _ctrlDigit9 ctrlSetText "\AGM_Vector\rsc\dt.paa";
      } else {
        _ctrlDigit6 ctrlSetText "\AGM_Vector\rsc\dE.paa";
        _ctrlDigit7 ctrlSetText "\AGM_Vector\rsc\dr.paa";
        _ctrlDigit8 ctrlSetText "\AGM_Vector\rsc\dE.paa";
        _ctrlDigit9 ctrlSetText "\AGM_Vector\rsc\dt.paa";
      };
      _ctrlDigit0 ctrlSetText "\AGM_Vector\rsc\dq.paa";
      _ctrlDigit1 ctrlSetText "\AGM_Vector\rsc\dn.paa";
      _ctrlDigit2 ctrlSetText "";
      _ctrlDigit3 ctrlSetText "";
    } else {
      _ctrlDigit6 ctrlSetText "\AGM_Vector\rsc\dE.paa";
      _ctrlDigit7 ctrlSetText "\AGM_Vector\rsc\dr.paa";
      _ctrlDigit8 ctrlSetText "\AGM_Vector\rsc\dE.paa";
      _ctrlDigit9 ctrlSetText "\AGM_Vector\rsc\dt.paa";
      _ctrlDigit0 ctrlSetText "\AGM_Vector\rsc\dq.paa";
      _ctrlDigit1 ctrlSetText "\AGM_Vector\rsc\dF.paa";
      _ctrlDigit2 ctrlSetText "\AGM_Vector\rsc\dF.paa";
      _ctrlDigit3 ctrlSetText "";
    };
  };
  AGM_vectorKey select 1
};

_time = time;
waitUntil {
  if (AGM_vectorKey select 0) then {_time = -1};
  !(AGM_vectorKey select 1) || {time > _time + 1}
};

_theCount = 1;
waitUntil {
  if (AGM_vectorKey select 1) then {
    _theCount = _theCount + 1;
    _time = time;
    waitUntil {!(AGM_vectorKey select 1) || {time > _time + 1}};
  };
  if (AGM_vectorKey select 0) then {_time = -1};
  time > _time + 1 || {_theCount >= 5}
};

if (_theCount >= 5) then {
  _ctrlDigitE1 ctrlSetText "\AGM_Vector\rsc\d5.paa";
  _ctrlDigitE2 ctrlSetText "\AGM_Vector\rsc\dt.paa";
  _ctrlDigitE3 ctrlSetText "\AGM_Vector\rsc\dq.paa";
  _ctrlDigitE4 ctrlSetText "\AGM_Vector\rsc\dr.paa";

  AGM_vectorSettings set [0, _isReticle];
  AGM_vectorSettings set [1, _isNVG];

  _ctrlVectorCrosshair ctrlShow (AGM_vectorSettings select 0);

  if (AGM_vectorSettings select 1) then {
    {_x ctrlSetTextColor [1, 0, 0, 1]} forEach _allControls;
  } else {
    {_x ctrlSetTextColor [1, 0, 0, 0.5]} forEach _allControls;
  };

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
  _ctrlDigit0 ctrlSetText "\AGM_Vector\rsc\dC.paa";
  _ctrlDigit1 ctrlSetText "\AGM_Vector\rsc\dq.paa";
  _ctrlDigit2 ctrlSetText "\AGM_Vector\rsc\dn.paa";
  _ctrlDigit3 ctrlSetText "\AGM_Vector\rsc\dF.paa";

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
