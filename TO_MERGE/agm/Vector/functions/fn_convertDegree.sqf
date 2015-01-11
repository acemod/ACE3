/*
BWA3 script, by commy2
this code is property of the ArmA 3 Bundeswehr modification
ask us nicely at http://www.bwmod.de/ if you want to re-use any of this script
we don't support changed code based on this work
*/

private["_number", "_return", "_isNegative", "_digit1", "_digit2", "_digit3", "_digit4"];

_number = _this;

_return = [];
if (AGM_vectorSettings select 2) then {
  _number = round (6400 / 360 * _number);
  if (_number == 6400) then {_number = 0};

  _return = _number call AGM_Vector_fnc_convertDistance;
} else {
  _number = round _number;
  _isNegative = if (_number < 0) then {true} else {false};
  _number = abs _number;
  if (_number == 360) then {_number = 0};

  _digit1 = floor (_number / 100);
  _digit2 = floor (_number / 10) - _digit1 * 10;
  _digit3 = _number mod 10;
  _digit4 = "\AGM_Vector\rsc\do.paa";

  if (_isNegative) then {
    if (_digit1 == 0) then {
      if (_digit2 == 0) then {
        _digit1 = "";
        _digit2 = "\AGM_Vector\rsc\d-.paa";
        _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
      } else {
        _digit1 = "\AGM_Vector\rsc\d-.paa";
        _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit2];
        _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
      };
    } else {
      _digit1 = "\AGM_Vector\rsc\d-.paa";
      _digit2 = "\AGM_Vector\rsc\d-.paa";
      _digit3 = "\AGM_Vector\rsc\d-.paa";
      _digit4 = "\AGM_Vector\rsc\d-.paa";
    };
  } else {
    if (_digit1 == 0) then {
      if (_digit2 == 0) then {
        _digit1 = "";
        _digit2 = "";
        _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
      } else {
        _digit1 = "";
        _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit2];
        _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
      };
    } else {
      _digit1 = format["\AGM_Vector\rsc\d%1.paa", _digit1];
      _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit2];
      _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
    };
  };
  _return = [_digit1, _digit2, _digit3, _digit4];
};

_return
