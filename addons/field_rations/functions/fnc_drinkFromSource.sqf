#include "script_component.hpp"
/*
 * Author: mharis001
 * Makes the player drink directly from the given water source.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Water Source <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _source] call ace_field_rations_drinkFromSource
 *
 * Public: No
 */

params ["_player", "_source"];

// Store current animation for resetting
_player setVariable [QGVAR(previousAnim), animationState _player];

private _animation = [_player, _source] call FUNC(getDrinkAnimation);
[_player, _animation, 1] call EFUNC(common,doAnimation);

private _fnc_onSuccess = {
    params ["_args"];
    _args params ["_player", "_source"];

    // Reduce player thirst
    private _thirst = _player getVariable [QXGVAR(thirst), 0];
    _player setVariable [QXGVAR(thirst), (_thirst - (DRINK_FROM_SOURCE_QUENCHED * XGVAR(thirstQuenched))) max 0];
    _player setVariable [QGVAR(previousAnim), nil];

    // Update remaining water in source
    private _waterInSource = _source call FUNC(getRemainingWater);

    if (_waterInSource != REFILL_WATER_INFINITE) then {
        [_source, (_waterInSource - DRINK_FROM_SOURCE_AMOUNT) max 0] call FUNC(setRemainingWater);
    };
};

private _fnc_onFailure = {
    params ["_args"];
    _args params ["_player"];

    // Reset animation if needed
    if (vehicle _player == _player && {!(_player call EFUNC(common,isSwimming))}) then {
        private _previousAnim = _player getVariable [QGVAR(previousAnim), ""];
        if (_previousAnim != "") then {
            [_player, _previousAnim, 2] call EFUNC(common,doAnimation);
        };
    };

    _player setVariable [QGVAR(previousAnim), nil];
};

private _fnc_condition = {
    params ["_args"];
    _args params ["_player", "_source"];

    [_player, _source] call FUNC(canDrinkFromSource)
};

private _sourceType = typeOf _source;
private _progressText = if (_sourceType == "") then {
    LLSTRING(DrinkingFromSource)
} else {
    format [LLSTRING(DrinkingFromX), getText (configFile >> "CfgVehicles" >> _sourceType >> "displayName")]
};

[
    DRINK_FROM_SOURCE_TIME,
    [_player, _source],
    _fnc_onSuccess,
    _fnc_onFailure,
    _progressText,
    _fnc_condition
] call EFUNC(common,progressBar);
