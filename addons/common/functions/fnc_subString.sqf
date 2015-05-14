/*
 * Author: KoffeinFlummi
 *
 * Returns a fraction of the given string, starting at a given index, with a given length.
 *
 * Arguments:
 * 0: Source string
 * 1: Starting index of new string
 * 2: Length of the new string
 *
 * Return Value:
 * String when successfull / False when not
 */
#include "script_component.hpp"

PARAMS_3(_string,_index,_length);

_array = toArray _string;
if (_index < 0 or _length < 0 or _index + _length > (count _array) + 1) exitWith {false};

_arrayNew = [];
for "_i" from _index to (_index + _length - 1) do {
    _arrayNew = _arrayNew + [(_array select _i)];
};

toString _arrayNew
