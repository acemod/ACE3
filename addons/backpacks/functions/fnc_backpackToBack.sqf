/*
 * Author: marc_book
 * Put's backpack to normal position.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * NONE.
 */

#include "script_component.hpp"

private ["_unit", "_backpack"];

_unit = _this select 0;

for "_i" from 0 to (count attachedObjects _unit - 1) step 1 do {
    if (attachedObjects _unit select _i isKindOf "groundWeaponHolder") then {
        _backpack = attachedObjects _unit select _i;
        detach _backpack;
    };
};

_unit action ["AddBag",_backpack,(backpackCargo _backpack) select 0];
_unit setVariable ["ACE_Backpack", objNull];