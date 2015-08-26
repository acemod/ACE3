/*
 * Author: PabstMirror
 * Finds next valid index for the device array.
 *
 * Arguments:
 * 0: Offset from currentIndex (use 1 to find next valid after current) or a displayName string (default: 0) <STRING, NUMBER, OPTIONAL>
 *
 * Return Value:
 * The new index (-1 if no valid) <NUMBER>
 *
 * Example:
 * [] call ace_common_fnc_deviceKeyFindValidIndex
 * ["kestral4500"] call ace_common_fnc_deviceKeyFindValidIndex
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_validIndex", "_offsetBy", "_realIndex", "_offset", "_baseIndex", "_keyHandler"];

params [["_searchOffsetOrName", 0]];

_validIndex = -1;

if ((typeName _searchOffsetOrName) == "STRING") then {
    {
        if ((_x select 0) == _searchOffsetOrName) exitWith {
            _validIndex = _forEachIndex;
        };
    } forEach GVAR(deviceKeyHandlingArray);
} else {
    _keyHandler = count GVAR(deviceKeyHandlingArray);
    if (_keyHandler > 0) then {
        _baseIndex = if (GVAR(deviceKeyCurrentIndex) == -1) then {0} else {GVAR(deviceKeyCurrentIndex) + _searchOffsetOrName};
        for "_offset" from _baseIndex to (_keyHandler - 1 + _baseIndex) do {
            _realIndex = _offset % (count GVAR(deviceKeyHandlingArray));
            if ([] call ((GVAR(deviceKeyHandlingArray) select _realIndex) select 2)) exitWith {
                _validIndex = _realIndex;
            };
        };
    };
};

GVAR(deviceKeyCurrentIndex) = _validIndex;

GVAR(deviceKeyCurrentIndex)
