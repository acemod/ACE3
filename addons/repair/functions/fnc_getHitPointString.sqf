/*
 * Author: Jonpas
 * Finds the localized string of the given hitpoint name or uses default text if none found.
 *
 * Arguments:
 * 0: Hitpoint <STRING>
 * 1: Localized Text <STRING>
 * 2: Default Text <STRING>
 * 3: Track Added Hitpoints <BOOL> (default: false)
 *
 * Return Value:
 * 0: Text <STRING>
 * 1: Added Hitpoint <NUMBER> (default: [])
 *
 * Example:
 * ["HitFuel", "Repairing %1 ...", "Repairing HitFuel"] call ace_repair_fnc_getHitPointString
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_hitPoint", "_textLocalized", "_textDefault", ["_trackArray", []]];

private _track = (count _trackArray > 0);
private _trackNames = [];
private _trackStrings = [];
private _trackAmount = [];

if (_track) then {
    _trackNames = _trackArray select 0;
    _trackStrings = _trackArray select 1;
    _trackAmount = _trackArray select 2;
};

// Prepare first part of the string from stringtable
private _text = LSTRING(Hit);

// Remove "Hit" from hitpoint name if one exists
private _toFind = if ((toLower _hitPoint) find "hit" == 0) then {
    [_hitPoint, 3] call CBA_fnc_substr
} else {
    _hitPoint
};

// Loop through always shorter part of the hitpoint name to find the string from stringtable
for "_i" from 0 to (count _hitPoint) do {
    if (_track) then {
        // Loop through already added hitpoints and save index
        private _trackIndex = -1;
        {
            if (_x == _toFind) exitWith {
                _trackIndex = _forEachIndex;
            };
        } forEach _trackNames;

        // Use already added hitpoint if one found above and numerize
        if (_trackIndex != -1) exitWith {
            _text = localize (_trackStrings select _trackIndex) + " " + str(_trackAmount select _trackIndex);
            _trackAmount set [_trackIndex, (_trackAmount select _trackIndex) + 1]; // Set amount
            TRACE_2("Same hitpoint found",_toFind,_trackNames);
        };
    };


    // Localize if localization found
    private _combinedString = _text + _toFind;
    if (isLocalized _combinedString) exitWith {
        _text = format [_textLocalized, localize _combinedString];
        TRACE_1("Hitpoint localized",_toFind);

        if (_track) then {
            // Add hitpoint to the list
            _trackNames pushBack _toFind;
            _trackStrings pushBack _combinedString;
            _trackAmount pushBack 2;
        };
    };

    // Cut off one character
    _toFind = [_toFind, 0, count _toFind - 1] call CBA_fnc_substr;
};

// Don't display part name if no string is found in stringtable
if (_text == LSTRING(Hit)) then {
    if (_hitPoint != "") then { LOG_1("Hitpoint [%1] - could not be localized", _hitPoint); };
    _text = _textDefault;
};

[_text, [_trackNames, _trackStrings, _trackAmount]]
