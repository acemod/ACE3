#include "script_component.hpp"
/*
 * Author: mharis001
 * Displays the remaining water in the given water source.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Water source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _source] call ace_field_rations_fnc_checkWater
 *
 * Public: No
 */

params ["_player", "_source"];

[
    CHECK_WATER_TIME,
    [_player, _source],
    {
        params ["_args"];
        _args params ["_player", "_source"];

        private _water = _source call FUNC(getRemainingWater);

        if (_water > 0) then {
            [[LSTRING(RemainingWater), _water], 1.5, _player] call EFUNC(common,displayTextStructured);
        } else {
            [LSTRING(NoWaterRemaining), 1.5, _player] call EFUNC(common,displayTextStructured);
        };
    },
    {},
    LLSTRING(CheckingWater)
] call EFUNC(common,progressBar);
