/*
BWA3 script, by commy2
this code is property of the ArmA 3 Bundeswehr modification
ask us nicely at http://www.bwmod.de/ if you want to re-use any of this script
we don't support changed code based on this work
*/

private["_number", "_coordinate", "_isNegative", "_digit0", "_digit1", "_digit2", "_digit3", "_digit4"];

_number = _this select 0;
_coordinate = _this select 1;

_number = round _number;
_isNegative = if (_number < 0) then {true} else {false};
_number = abs _number;

if (_number >= 10000) exitWith {
  [
    "",
    "\AGM_Vector\rsc\d-.paa",
    "\AGM_Vector\rsc\d-.paa",
    "\AGM_Vector\rsc\d-.paa",
    "\AGM_Vector\rsc\d-.paa"
  ]
};

_digit0 = "";
_digit1 = floor (_number / 1000);
_digit2 = floor (_number / 100) - _digit1 * 10;
_digit3 = floor (_number / 10) - _digit1 * 100 - _digit2 * 10;
_digit4 = _number mod 10;

switch (_coordinate) do {
  case 0 : {
    if (_isNegative) then {
      if (_digit1 == 0) then {
        if (_digit2 == 0) then {
          if (_digit3 == 0) then {
            _digit0 = "\AGM_Vector\rsc\dd.paa";
            _digit1 = "";
            _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
            _digit3 = "";
            _digit4 = "";
          } else {
            _digit0 = "\AGM_Vector\rsc\dd.paa";
            _digit1 = "";
            _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
            _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
            _digit4 = "";
          };
        } else {
          _digit0 = "\AGM_Vector\rsc\dd.paa";
          _digit1 = "";
          _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit2];
          _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
          _digit4 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
        };
      } else {
        _digit0 = "";
        _digit1 = "\AGM_Vector\rsc\d-.paa";
        _digit2 = "\AGM_Vector\rsc\d-.paa";
        _digit3 = "\AGM_Vector\rsc\d-.paa";
        _digit4 = "\AGM_Vector\rsc\d-.paa";
      };
    } else {
      if (_digit1 == 0) then {
        if (_digit2 == 0) then {
          if (_digit3 == 0) then {
            _digit0 = "\AGM_Vector\rsc\dA.paa";
            _digit1 = "";
            _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
            _digit3 = "";
            _digit4 = "";
          } else {
            _digit0 = "\AGM_Vector\rsc\dA.paa";
            _digit1 = "";
            _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
            _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
            _digit4 = "";
          };
        } else {
          _digit0 = "\AGM_Vector\rsc\dA.paa";
          _digit1 = "";
          _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit2];
          _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
          _digit4 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
        };
      } else {
        _digit0 = "";
        _digit1 = "\AGM_Vector\rsc\d-.paa";
        _digit2 = "\AGM_Vector\rsc\d-.paa";
        _digit3 = "\AGM_Vector\rsc\d-.paa";
        _digit4 = "\AGM_Vector\rsc\d-.paa";
      };
    };
  };
  case 1 : {
    if (_isNegative) then {
      if (_digit1 == 0) then {
        if (_digit2 == 0) then {
          if (_digit3 == 0) then {
            _digit0 = "\AGM_Vector\rsc\dL.paa";
            _digit1 = "";
            _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
            _digit3 = "";
            _digit4 = "";
          } else {
            _digit0 = "\AGM_Vector\rsc\dL.paa";
            _digit1 = "";
            _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
            _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
            _digit4 = "";
          };
        } else {
          _digit0 = "\AGM_Vector\rsc\dL.paa";
          _digit1 = "";
          _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit2];
          _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
          _digit4 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
        };
      } else {
        _digit0 = "";
        _digit1 = "\AGM_Vector\rsc\d-.paa";
        _digit2 = "\AGM_Vector\rsc\d-.paa";
        _digit3 = "\AGM_Vector\rsc\d-.paa";
        _digit4 = "\AGM_Vector\rsc\d-.paa";
      };
    } else {
      if (_digit1 == 0) then {
        if (_digit2 == 0) then {
          if (_digit3 == 0) then {
            _digit0 = "\AGM_Vector\rsc\dr.paa";
            _digit1 = "";
            _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
            _digit3 = "";
            _digit4 = "";
          } else {
            _digit0 = "\AGM_Vector\rsc\dr.paa";
            _digit1 = "";
            _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
            _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
            _digit4 = "";
          };
        } else {
          _digit0 = "\AGM_Vector\rsc\dr.paa";
          _digit1 = "";
          _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit2];
          _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
          _digit4 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
        };
      } else {
        _digit0 = "";
        _digit1 = "\AGM_Vector\rsc\d-.paa";
        _digit2 = "\AGM_Vector\rsc\d-.paa";
        _digit3 = "\AGM_Vector\rsc\d-.paa";
        _digit4 = "\AGM_Vector\rsc\d-.paa";
      };
    };
  };
  case 2 : {
    if (_isNegative) then {
      if (_digit1 == 0) then {
        if (_digit2 == 0) then {
          if (_digit3 == 0) then {
            _digit0 = "\AGM_Vector\rsc\dU.paa";
            _digit1 = "\AGM_Vector\rsc\dP.paa";
            _digit2 = "";
            _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
            _digit4 = "";
          } else {
            _digit0 = "\AGM_Vector\rsc\dU.paa";
            _digit1 = "\AGM_Vector\rsc\dP.paa";
            _digit2 = "";
            _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
            _digit4 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
          };
        } else {
          _digit0 = "\AGM_Vector\rsc\dU.paa";
          _digit1 = "\AGM_Vector\rsc\dP.paa";
          _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit2];
          _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
          _digit4 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
        };
      } else {
        _digit0 = "";
        _digit1 = "\AGM_Vector\rsc\d-.paa";
        _digit2 = "\AGM_Vector\rsc\d-.paa";
        _digit3 = "\AGM_Vector\rsc\d-.paa";
        _digit4 = "\AGM_Vector\rsc\d-.paa";
      };
    } else {
      if (_digit1 == 0) then {
        if (_digit2 == 0) then {
          if (_digit3 == 0) then {
            _digit0 = "\AGM_Vector\rsc\dd.paa";
            _digit1 = "\AGM_Vector\rsc\dn.paa";
            _digit2 = "";
            _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
            _digit4 = "";
          } else {
            _digit0 = "\AGM_Vector\rsc\dd.paa";
            _digit1 = "\AGM_Vector\rsc\dn.paa";
            _digit2 = "";
            _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
            _digit4 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
          };
        } else {
          _digit0 = "\AGM_Vector\rsc\dd.paa";
          _digit1 = "\AGM_Vector\rsc\dn.paa";
          _digit2 = format["\AGM_Vector\rsc\d%1.paa", _digit2];
          _digit3 = format["\AGM_Vector\rsc\d%1.paa", _digit3];
          _digit4 = format["\AGM_Vector\rsc\d%1.paa", _digit4];
        };
      } else {
        _digit0 = "";
        _digit1 = "\AGM_Vector\rsc\d-.paa";
        _digit2 = "\AGM_Vector\rsc\d-.paa";
        _digit3 = "\AGM_Vector\rsc\d-.paa";
        _digit4 = "\AGM_Vector\rsc\d-.paa";
      };
    };
  };
};

[_digit0, _digit1, _digit2, _digit3, _digit4]
