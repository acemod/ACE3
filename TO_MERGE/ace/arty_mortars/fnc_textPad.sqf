//fnc_textPad.sqf
#include "script_component.hpp"
PARAMS_3(_str,_pad,_length);

_strArray = toArray _str;
_padStr = "";
if(_length > (count _strArray)) then {
	_dif = _length - (count _strArray);
	
	for "_i" from 1 to _dif do {
		_padStr = _padStr + _pad;
	};
	_padStr = _padStr + _str;
} else {
	_padStr = _str;
};

_padStr