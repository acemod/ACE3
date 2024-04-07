#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles replacing unit's items with their registered replacements.
 * Called by CBA Player Loadout Event, but can be used to replace items on AI.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_common_fnc_replaceRegisteredItems
 *
 * Public: Yes
 */
params [["_unit", objNull, [objNull]]];

private _items = items _unit;
if (_items isEqualTo GVAR(oldItems)) exitWith {};

private _newItems = _items - GVAR(oldItems);
_newItems = _newItems arrayIntersect _newItems; // Get unique items only
if (_newItems isEqualTo []) exitWith {
    GVAR(oldItems) = _items;
};
TRACE_2("replacing",_unit,_newItems);

if (GVAR(blockItemReplacement)) exitWith {
    TRACE_2("blocked delay",_unit,_newItems);
    [{!GVAR(blockItemReplacement)}, LINKFUNC(replaceRegisteredItems), _unit] call CBA_fnc_waitUntilAndExecute;
};

private _cfgWeapons = configFile >> "CfgWeapons"; // Microoptimization
private _containerItems = [uniformItems _unit, vestItems _unit, backpackItems _unit];

for "_i" from 0 to count _newItems - 1 do {
    private _item = _newItems#_i;

    private _doReplace = false;
    private _replacements = [];

    // Determine replacement items: direct replacements, ...
    private _directReplacements = GVAR(itemReplacements) getVariable _item;
    if (!isNil "_directReplacements") then {
        _doReplace = true;
        _replacements append _directReplacements;
    };

    // ... item type replacements ...
    private _type = getNumber (_cfgWeapons >> _item >> "ItemInfo" >> "type");
    private _typeReplacements = GVAR(itemReplacements) getVariable ("$" + str _type);
    if (!isNil "_typeReplacements") then {
        _doReplace = true;
        _replacements append _typeReplacements;
    };

    // ... and inherited replacements
    {
        if (_item isKindOf [_x, _cfgWeapons]) then {
            private _inheritedReplacements = GVAR(itemReplacements) getVariable _x;
            if (!isNil "_inheritedReplacements") then {
                _doReplace = true;
                _replacements append _inheritedReplacements;
            };
        };
    } forEach GVAR(inheritedReplacements);

    // Replace all items of current class in list
    if (_doReplace) then {
        TRACE_2("replace",_item,_replacements);
        _unit removeItems _item;

        if (_replacements isEqualTo []) exitWith {};
        // Get count of item in each container
        private _containerCount = _containerItems apply {{_x == _item} count _x};
        TRACE_1("",_containerCount);

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
