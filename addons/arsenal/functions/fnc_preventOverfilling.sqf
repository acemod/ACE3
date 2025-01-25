#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43, mrschick
 * Checks the current loadout of the given unit for inventory containers (uniform/vest/backpack) filled beyond their max load, removing excess items if present.
 *
 * Arguments:
 * 0: Unit to check for overfill <OBJECT>
 * 1: Which container to check (0: all, 1: uniform, 2: vest, 3: backpack) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_unit", ["_container", 0]];

// Remove excess items from uniform
if (_container in [0, 1]) then {
    private _uniformItems = uniformItems _unit;
    private _index = count _uniformItems - 1;
    while {loadUniform _unit > 1 && {_index >= 0}} do {
        _unit removeItemFromUniform (_uniformItems select _index);
        DEC(_index);
    };
};

// Remove excess items from vest
if (_container in [0, 2]) then {
    private _vestItems = vestItems _unit;
    private _index = count _vestItems - 1;
    while {loadVest _unit > 1 && {_index >= 0}} do {
        _unit removeItemFromVest (_vestItems select _index);
        DEC(_index);
    };
};

// Remove excess items from backpack
if (_container in [0, 3]) then {
    private _backpackItems = backpackItems _unit;
    private _index = count _backpackItems - 1;
    while {loadBackpack _unit > 1 && {_index >= 0}} do {
        _unit removeItemFromBackpack (_backpackItems select _index);
        DEC(_index);
    };
};
