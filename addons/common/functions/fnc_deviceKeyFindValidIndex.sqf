#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Finds next valid index for the device array.
 *
 * Arguments:
 * 0: Offset from currentIndex (use 1 to find next valid after current) or a displayName string <STRING or NUMBER> (default: 0)
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

params [["_searchOffsetOrName", 0]];

private _validIndex = -1;

if (_searchOffsetOrName isEqualType "") then {
    {
        if (_x select 0 == _searchOffsetOrName) exitWith {
            _validIndex = _forEachIndex;
        };
    } forEach GVAR(deviceKeyHandlingArray);
} else {
    if (count GVAR(deviceKeyHandlingArray) > 0) then {
        private _baseIndex = [GVAR(deviceKeyCurrentIndex) + _searchOffsetOrName, 0] select (GVAR(deviceKeyCurrentIndex) == -1);

        for "_offset" from _baseIndex to (count GVAR(deviceKeyHandlingArray) - 1 + _baseIndex) do {
            private _realIndex = _offset % (count GVAR(deviceKeyHandlingArray));

            if ([] call ((GVAR(deviceKeyHandlingArray) select _realIndex) select 2)) exitWith {
                _validIndex = _realIndex;
            };
        };
    };
};

GVAR(deviceKeyCurrentIndex) = _validIndex;

GVAR(deviceKeyCurrentIndex)
