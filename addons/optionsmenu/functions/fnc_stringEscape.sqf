/*
 * Author: Glowbal
 * Parse the string for quotation marks, so it can be used for config export.
 *
 * Arguments:
 * 0: string <STRING>
 *
 * Return Value:
 * parsed string <STRING>
 *
 * Example:
 * [] call ACE_optionsmenu_fnc_stringEscape
 *
 * Public: No
 */

private ["_str", "_array", "_maxIndex"];
_str = _this;

_isEven = {
    params ["_array", "_index"];
    private [ "_count"];
    _count = 0;
    {
        if (_forEachIndex <= _index && {_x == 39}) then {
            _count = _count + 1;
        };
    }foreach _array;

    _count %2 == 0;
};

// reg: 34
// single: 39
_array = toArray _str;
{
    if (_x == 34) then {
        _array set [_foreachIndex, 39];
    };
}foreach _array;

_maxIndex = count _array;
for "_i" from 0 to _maxIndex /* step +1 */ do {
    if (((_i + 1) < _maxIndex - 1) && {_array select _i == 39 && (_array select (_i + 1)) == 39}) then {
        if ([_array, _i] call _isEven) then {
            _array deleteAt _i;
            _i = _i - 1;
            _maxIndex = _maxIndex - 1;
        };
    };
};

{
    if (_x == 34) then {
        _array set [_foreachIndex, 39];
    };
}foreach _array;

toString _array;
