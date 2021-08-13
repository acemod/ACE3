#include "script_component.hpp"
/*
 * Author: mharis001
 * Returns an appropriate animation for drinking directly from the given water source.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Water Source <OBJECT>
 *
 * Return Value:
 * Animation <STRING>
 *
 * Example:
 * [_player, _source] call ace_field_rations_getDrinkAnimation
 *
 * Public: No
 */

params ["_player", "_source"];

private _offset = _source call FUNC(getActionOffset);
private _actionPos = _source modelToWorld _offset;
private _playerPos = _player modelToWorld [0, 0, 0];

private _difference = (_actionPos vectorDiff _playerPos) select 2;

// Experimentally determined values to try to match height difference to different animations
switch (true) do {
    case (_difference < 0.1): {QGVAR(drinkFromSourceSquatLow)};
    case (_difference < 0.4): {QGVAR(drinkFromSourceSquat)};
    case (_difference < 0.8): {QGVAR(drinkFromSourceSquatHigh)};
    case (_difference < 1.2): {QGVAR(drinkFromSourceLow)};
    case (_difference < 1.4): {QGVAR(drinkFromSource)};
    default {QGVAR(drinkFromSourceHigh)};
};
