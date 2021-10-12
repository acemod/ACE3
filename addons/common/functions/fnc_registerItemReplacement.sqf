#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Registers an event handler that replaces an item or item type with one or
 * more other items.
 *
 * Arguments:
 * 0: Item or item type ID to replace <STRING or NUMBER>
 * 1: Item or list of items <STRING or ARRAY>
 * 2: Replace items that inherit from original item (only if 0 is STRING) (Optional)<BOOL>
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

// CBA player event handler function
private _fnc_replaceItems = {
    params ["_unit"];

    private _items = items _unit;
    if (_items isEqualTo GVAR(oldItems)) exitWith {};

    private _newItems = _items - GVAR(oldItems);
    _newItems = _newItems arrayIntersect _newItems; // Get unique items only
    if (_newItems isEqualTo []) exitWith {
        GVAR(oldItems) = _items;
    };

    private _cfgWeapons = configFile >> "CfgWeapons"; // Microoptimization

    for "_i" from 0 to count _newItems - 1 do {
        private _item = _newItems#_i;

        // Get count of item in each container
        private _containerCount = [];
        {
            _containerCount pushBack ({_x == _item} count _x)
        } forEach [uniformItems _unit, vestItems _unit, backpackItems _unit];

        // Determine replacement items: direct replacements, ...
         private _replacements = GVAR(itemReplacements) getVariable [_item, []];

        // ... item type replacements ...
        private _type = getNumber (_cfgWeapons >> _item >> "ItemInfo" >> "type");
        private _typeReplacements = GVAR(itemReplacements) getVariable ["$" + str _type, []];
        _replacements append _typeReplacements;

        // ... and inherited replacements
        {
            if (_item isKindOf [_x, _cfgWeapons]) then {
                private _inheritedReplacements = GVAR(itemReplacements) getVariable [_x, []];
                _replacements append _inheritedReplacements;
            };
        } forEach GVAR(inheritedReplacements);

        // Replace all items of current class in list
        if (_replacements isNotEqualTo []) then {
            TRACE_3("replace",_item,_count,_replacements);
            _unit removeItems _item;

            {
                if (_x == 0) then {continue};
                private _container = ["uniform", "vest", "backpack"] select _forEachIndex;
                for "_j" from 1 to _x do {
                    {
                        if ([_unit, _x, 1, _container == "uniform", _container == "vest", _container == "backpack"] call CBA_fnc_canAddItem) then {
                            [_unit, _x, _container] call FUNC(addToInventory)  // add to specific container
                        } else {
                            [_unit, _x, ""] call FUNC(addToInventory) // no room, add anywhere
                        }
                    } forEach _replacements;
                }
            } forEach _containerCount;
        };
    };

    GVAR(oldItems) = items _unit;
};

// Setup on first run
if (isNil QGVAR(itemReplacements)) then {
    GVAR(itemReplacements) = [] call CBA_fnc_createNamespace;
    GVAR(inheritedReplacements) = [];
    GVAR(oldItems) = [];
    ["loadout", _fnc_replaceItems] call CBA_fnc_addPlayerEventHandler;
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

private _oldReplacements = GVAR(itemReplacements) getVariable [_oldItem, []];
_oldReplacements append _newItems;
GVAR(itemReplacements) setVariable [_oldItem, _oldReplacements];

// Force item scan when new replacement was registered in PostInit
if (!isNull ACE_player) then {
    GVAR(oldItems) = [];

    // Exec next frame to ensure full scan only runs once per frame
    // For example, if item replacements are registred in PostInit (due to CBA
    // settings) by different addons, the inventory is only scanned once in the
    // next frame, not once per addon.
    [_fnc_replaceItems, [ACE_player]] call CBA_fnc_execNextFrame;
};
