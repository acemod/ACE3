#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Registers an event handler that replaces an item or item type with one or
 * more other items.
 *
 * Arguments:
 * 0: Item or item type ID to replace <STRING or NUMBER>
 * 1: Item or list of items <STRING or ARRAY>
 * 2: Replace items that inherit from original item (only if 0 is STRING) <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["FirstAidKit", "ACE_fieldDressing"] call ace_common_fnc_registerItemReplacement
 *
 * Public: Yes
 */
params [["_oldItem", "", [0,""]], ["_newItems", "", ["", []]], ["_replaceInherited", false, [false]]];
TRACE_3("registerItemReplacement",_oldItem,_newItems,_replaceInherited);

// Setup on first run
if (isNil QGVAR(itemReplacements)) then {
    GVAR(itemReplacements) = createHashMap;
    GVAR(inheritedReplacements) = [];
    GVAR(oldItems) = [];
    ["loadout", LINKFUNC(replaceRegisteredItems)] call CBA_fnc_addPlayerEventHandler;
};

// Get config case - if item doesn't exist, "" is returned
if (_oldItem isEqualType "") then {
    _oldItem = _oldItem call FUNC(getConfigName);
};

if (_oldItem isEqualTo "") exitWith {
    ERROR("Item doesn't exist");
};

// Save item replacement
// $ prefix is used for types (numbers) and replacements with inheritance
if (_replaceInherited) then {
    _oldItem = "$" + _oldItem;
    GVAR(inheritedReplacements) pushBack _oldItem;
};
if (_oldItem isEqualType 0) then {
    _oldItem = "$" + str _oldItem;
};
if (_newItems isEqualType "") then {
    _newItems = [_newItems];
};

private _oldReplacements = GVAR(itemReplacements) getOrDefault [_oldItem, [], true];
_oldReplacements append _newItems;

// Force item scan when new replacement was registered in PostInit
if !(isNull ACE_player) then {
    GVAR(oldItems) = [];

    // Exec next frame to ensure full scan only runs once per frame
    // For example, if item replacements are registred in PostInit (due to CBA
    // settings) by different addons, the inventory is only scanned once in the
    // next frame, not once per addon.
    [LINKFUNC(replaceRegisteredItems), [ACE_player]] call CBA_fnc_execNextFrame;
};
