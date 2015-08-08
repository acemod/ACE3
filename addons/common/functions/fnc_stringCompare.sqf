/*
 * Author: bovine3dom
 *
 * Determines whether one string matches another and how many characters match. Case insensitive.
 *
 * Arguments:
 * 0: stringA <STRING>
 * 1: stringB <STRING>
 *
 * Return Value:
 * Number of matching characters >NUMBER>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_string", "_searchTerm"];

private ["_arraySearchTerm", "_arrayString", "_sizeSearchTerm", "_sizeString", "_matchingCharacters", "_searchIterator", "_targetIterator"];
_string = toLower _string; // removes case sensitivity
_searchTerm = toLower _searchTerm;


_arraySearchTerm = toArray _searchTerm; // splits string into array of unicode decimals
_arrayString = toArray _string;
_sizeSearchTerm = count _arraySearchTerm; // We only measure the array once
_sizeString = count _arrayString;


_matchingCharacters = 0;
_targetIterator = 0;
_searchIterator = 0;
while {(_searchIterator < _sizeSearchTerm) && (_targetIterator < _sizeString)} do { // Prevents us from going out of bounds
    if ((_arraySearchTerm select _searchIterator) == (_arrayString select _targetIterator)) then { // If we have a match, start looking for the next character in the search term
        _matchingCharacters = _matchingCharacters + 1;
        _searchIterator = _searchIterator + 1
    };
    _targetIterator = _targetIterator + 1; // Look at the next character in the string
};

_matchingCharacters
