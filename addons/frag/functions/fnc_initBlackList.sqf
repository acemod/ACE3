#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Adds setting defined blacklisted rounds to blacklist
 *
 * Arguments:
 * Mne
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_frag_fnc_addBlackList
 *
 * Public: No
 */

TRACE_1("Beginning blacklist init", GVAR(BlackList));

if (!ADDON) then {
    [FUNC(initBlackList), [], 1] call CBA_fnc_waitAndExecute;
};

// could improve text parsing of CBA setting string
private _convArray = parseSimpleArray GVAR(BlackList);

if (count _convArray == 0 ) exitWith {
    TRACE_1("Empty blacklist", _convArray);
};

// Add CBA setting blacklist to blacklist and log errors
private _errors = 0;
private _items = count _convArray;
for "_i" from 0 to _items - 1 do {
    private _ammo = _convArray#_i;
    if (typeName _ammo isNotEqualTo "STRING") then {
        INFO_1("Improper ammo string at index %1", _i);
        INC(_errors);
        continue;
    };

    if (!isClass (configFile >> "cfgAmmo" >> _ammo)) then {
        INFO_1("Ammo class: %1 does not exist", str _ammo);
        INC(_errors);
        continue;
    };

    GVAR(shouldFragCache) set [_convArray#_i, false];
};


INFO_2("Initialized blacklist. Total items found: %1, number of items failed: %2", _items, _errors);