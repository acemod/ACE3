#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Verify the provided loadout: Check what items do not exist and what items aren't available in current arsenal.
 *
 * Arguments:
 * 0: Loadout <ARRAY> (CBA Extended Loadout or getUnitLoadout format)
 * 1: Whether to attempt to recover invalid containers <BOOL>
 *
 * Return Value:
 * Verified loadout and missing / unavailable items list and count <ARRAY>
 *
 * Public: No
*/

#define IN_ARSENAL (_name in GVAR(virtualItemsFlat))

params ["_loadout", ["_recoverInvalidContainers", false]];

private _extendedInfo = createHashMap;

// Check if the provided loadout is a CBA extended loadout
if (count _loadout == 2) then {
    _extendedInfo = +(_loadout select 1); // Copy the hashmap to prevent events from modifiyng the profileNamespace extendedInfo
    if (_extendedInfo isEqualType []) then { // Hashmaps are serialized as arrays, convert back to hashmap
        _extendedInfo = createHashMapFromArray _extendedInfo;
        _loadout set [1, _extendedInfo]; // Also fix source variable, technically not needed but doesn't hurt
    };
    _loadout = _loadout select 0;
};

private _name = "";
private _itemArray = [];
private _nullItemsList = [];
private _unavailableItemsList = [];
private _missingExtendedInfo = [];

// Search for all items and check their availability
private _fnc_filterLoadout = {
    params ["_loadout", ["_recoverInvalidContainers", false]];
    _loadout apply {
        switch true do {
            case (_x isEqualType "" && {_x != ""}): { // Handle item classnames
                _name = _x call EFUNC(common,getConfigName);
                // If item doesn't exist in config, "" is returned
                if (_name == "") then {
                    _nullItemsList pushBack _x;
                    breakWith ""
                };

                if (IN_ARSENAL || {
                    _name = _name call FUNC(baseWeapon);
                    IN_ARSENAL
                }) then { // Item or its baseWeapon in arsenal, all good
                    breakWith _name
                };

                // Could be a backpack
                private _backpackClass = [_name, "CfgVehicles"] call CBA_fnc_getNonPresetClass;
                if (_backpackClass == "") then { // It's not
                    _unavailableItemsList pushBack _name;
                    breakWith ""
                } else { // It is
                    _name = _backpackClass;
                };

                if IN_ARSENAL then {
                    breakWith _name
                };

                _unavailableItemsList pushBack _name;
                breakWith ""
            };
            case (_x isEqualType []): { // Handle arrays
                _itemArray = [_x, true] call _fnc_filterLoadout;

                // If "" is given as a container, an error is thrown, therefore, filter out all unavailable/null containers
                if (!_recoverInvalidContainers && {count _itemArray == 2} && {(_itemArray select 0) isEqualTo ""} && {(_itemArray select 1) isEqualType []}) then {
                    _itemArray = [];
                };

                breakWith _itemArray
            };
            default { // All other types and empty strings
                breakWith _x
            };
        };
    };
};

// Convert loadout to config case and replace null/unavailable items
// Loadout might come from a different modpack, which might have different config naming
_loadout = [_loadout, _recoverInvalidContainers] call _fnc_filterLoadout;

{
    private _class = _extendedInfo getOrDefault [_x, ""];
    private _cache = missionNamespace getVariable (_x + "Cache");

    // Previously voices were stored in lower case (speaker command returns lower case), so this is to make old loadouts compatible
    if (_class != "" && {_x == QGVAR(voice)}) then {
        _class = _class call EFUNC(common,getConfigName);
    };
    if (_class != "" && {!(_class in _cache)}) then {
        _missingExtendedInfo pushBack [_x, _class];
        _extendedInfo deleteAt _x;
    };
} forEach [QGVAR(insignia), QGVAR(face), QGVAR(voice)];

// Raise event for 3rd party: mostly for handling extended info
// Pass all items, including duplicates
[QGVAR(loadoutVerified), [_loadout, _extendedInfo, _nullItemsList, _unavailableItemsList, _missingExtendedInfo]] call CBA_fnc_localEvent;

[[_loadout, _extendedInfo], _nullItemsList arrayIntersect _nullItemsList, _unavailableItemsList arrayIntersect _unavailableItemsList, _missingExtendedInfo]
