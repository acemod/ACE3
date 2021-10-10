#include "script_component.hpp"
/*
 * Author: bovine3dom
 * Determines whether one string matches another and how many characters match. Case insensitive.
 *
 * Arguments:
 * 0: stringA <STRING>
 * 1: stringB <STRING>
 *
 * Return Value:
 * Number of matching characters <NUMBER>
 *
 * Example:
 * ["a", "b"] call ace_common_fnc_stringCompare
 *
 * Public: Yes
 */

params ["_string", "_searchTerm"];

_string = toLower _string; // removes case sensitivity
_searchTerm = toLower _searchTerm;

private _arraySearchTerm = toArray _searchTerm; // splits string into array of unicode decimals
private _arrayString = toArray _string;
private _sizeSearchTerm = count _arraySearchTerm; // We only measure the array once
private _sizeString = count _arrayString;

private _matchingCharacters = 0;
private _searchIterator = 0;
private _targetIterator = 0;

while {_searchIterator < _sizeSearchTerm && _targetIterator < _sizeString} do { // Prevents us from going out of bounds
    if (_arraySearchTerm select _searchIterator == _arrayString select _targetIterator) then { // If we have a match, start looking for the next character in the search term
        _matchingCharacters = _matchingCharacters + 1;
        _searchIterator = _searchIterator + 1
    };

    _targetIterator = _targetIterator + 1; // Look at the next character in the string
};

_matchingCharacters
