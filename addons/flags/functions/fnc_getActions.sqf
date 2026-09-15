#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Gets the child actions for placing and carrying flags.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [player] call ace_flags_fnc_getActions
 *
 * Public: No
 */

params ["_player"];

private _actions = [];

{
    (GVAR(flagItemCache) get _x) params ["_flagName", "", "", "_actionIconPlace", "_actionIconCarry"];

    // Place flag
    _actions pushBack [
        [
            QGVAR(place_) + _x,
            format [LLSTRING(Place), _flagName],
            _actionIconPlace,
            { // Statement
                params ["_player", "", "_item"];
                [_player, _item] call FUNC(placeFlag);
            },
            { // Condition
                GVAR(enablePlacing) &&
                {[_player, objNull, ["isNotSwimming", "isNotOnLadder"]] call EFUNC(common,canInteractWith)}
            },
            {},
            _x
        ] call EFUNC(interact_menu,createAction),
        [],
        _player
    ];

    // Carry flag
    _actions pushBack [
        [
            QGVAR(carry_) + _x,
            format [LLSTRING(Carry), _flagName],
            _actionIconCarry,
            { // Statement
                params ["_player", "", "_item"];
                [_player, _item] call FUNC(carryFlag);
            },
            { // Condition
                GVAR(enableCarrying) &&
                {!([_player] call FUNC(isCarryingFlag))} &&
                {[_player, objNull, ["isNotSwimming", "isNotOnLadder"]] call EFUNC(common,canInteractWith)}
            },
            {},
            _x
        ] call EFUNC(interact_menu,createAction),
        [],
        _player
    ];
} forEach ([_player] call FUNC(getFlags));

_actions
