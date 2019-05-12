#include "script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, mharis001
 * Handles converting vanilla medical items with ACE equivalents.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_medical_treatment_fnc_checkItems
 *
 * Public: No
 */

if (GVAR(convertItems) == 2) exitWith {};

params ["_unit"];

private _fnc_loop = if (GVAR(convertItems) == 0) then {
    {
        _x params ["_itemToRemove", "_replacementItems"];

        private _count = [_unit, _itemToRemove] call EFUNC(common,getCountOfItem);

        if (_count > 0) then {
            _unit removeItems _itemToRemove;

            {
                _x params ["_item", "_amount"];

                for "_i" from 1 to (_amount * _count) do {
                    _unit addItem _item;
                };
            } forEach _replacementItems;
        };
    }
} else {
    {
        _x params ["_itemToRemove"];
        _unit removeItems _itemToRemove;
    }
};

_fnc_loop forEach (uiNamespace getVariable QGVAR(replacementItems));
