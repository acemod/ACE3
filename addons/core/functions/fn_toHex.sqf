/*
Author: commy2

Description:
Converts number to hexadecimal number

Arguments:
A number

Return Value:
A hexadecimal number, String
*/

private ["_number", "_minLength", "_sign", "_hex", "_rest"];

_number = _this select 0;
_minLength = _this select 1;

if (isNil "_minLength") then {_minLength = 1};

_sign = ["", "-"] select (_number < 0);

_number = round abs _number;
_hex = ["", "0"] select (_number == 0);

while {_number > 0} do {
  _rest = _number mod 16;
  _rest = switch _rest do {
    case 10 : {"A"};
    case 11 : {"B"};
    case 12 : {"C"};
    case 13 : {"D"};
    case 14 : {"E"};
    case 15 : {"F"};
    default {str _rest};
  };
  _number = floor (_number / 16);

  _hex = _rest + _hex;
};

while {count toArray _hex < _minLength} do {
  _hex = "0" + _hex;
};

_sign + _hex
