/*
 * Author: AACO
 * Takes a getUnitLoadout (https://community.bistudio.com/wiki/Talk:getUnitLoadout)
 * container array (uniform, vest, backpack) and adds it
 * and the gear stored inside it to a given container.
 *
 * Arguments:
 * 0: The getUnitLoadout container array <ARRAY>
 * 1: The container to add the unit container to <OBJECT>
 * 2: Is the container array a backpack (as backpacks are added to containers uniquely) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [["U_B_CombatUniform_mcam", [["FirstAidKit", 1], ["30Rnd_65x39_caseless_mag", 30, 2]]], "ACE_bodyBackHolderObject" createVehicle (getPos player), false] call ACE_medical_fnc_addContainerArrayToContainer
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    "_containerArray",
    "_toContainer",
    "_isBackpack"
];
TRACE_3("params", _containerArray, _toContainer, _isBackpack);

if !(_containerArray isEqualTo []) then {
    _containerArray params [
        "_containerArrayClass",
        "_thingsToAdd"
    ];

    if (_isBackpack) then {
        _toContainer addBackpackCargoGlobal [_containerArrayClass, 1];
    } else {
        _toContainer addItemCargoGlobal [_containerArrayClass, 1];
    };

    // if there's nothing to add exit
    if (_thingsToAdd isEqualTo []) exitWith {};

    // get the item added back (single uniform/vest/backpack assumption)
    private _lookupObject = objNull;
    {
        if (_x select 0 == _containerArrayClass) exitWith { _lookupObject = (_x select 1); };
    } forEach (everyContainer _toContainer);

    if (isNull _lookupObject) exitWith { WARNING_2("Look up container: [%1] not found in container: [%2]", _containerArrayClass, _toContainer); }; // should not happen (B&S)

    {
        // magazines have a size of 3, items/weapons have a size of 2
        if (count _x == 3) then {
            _lookupObject addMagazineAmmoCargo _x;
        } else {
            _x params ["_itemInfo", "_itemCount"];

            // stored weapons are arrays, stored items are strings
            if (_itemInfo isEqualType []) then {
                [_itemInfo, _lookupObject, _itemCount] call FUNC(addWeaponArrayToContainer);
            } else {
                _lookupObject addItemCargoGlobal _x;
            };

        };
    } forEach _thingsToAdd;
};
