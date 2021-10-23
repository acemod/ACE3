#include "script_component.hpp"
/*
 * Author: mharis001, Glowbal, PabstMirror
 * Consumes an item. Creates a progress bar and handles relevant thirst/hunger values.
 *
 * Arguments:
 * 0: Target (not used) <OBJECT>
 * 1: Player <OBJECT>
 * 2: Item classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [objNull, ACE_player, "ACE_WaterBottle"] call ace_field_rations_fnc_consumeItem
 *
 * Public: No
 */

params ["", "_player", "_consumeItem"];
TRACE_2("Consume item started",_player,_consumeItem);

private _config = configFile >> "CfgWeapons" >> _consumeItem;

// Get consume time for item
private _consumeTime = getNumber (_config >> QXGVAR(consumeTime));

// Get restored values and replacement item
private _thirstQuenched = XGVAR(thirstQuenched) * getNumber (_config >> QXGVAR(thirstQuenched));
private _hungerSatiated = XGVAR(hungerSatiated) * getNumber (_config >> QXGVAR(hungerSatiated));
private _replacementItem = getText (_config >> QXGVAR(replacementItem));

// Create consume text for item
private _displayName = getText (_config >> "displayName");
private _consumeText = getText (_config >> QXGVAR(consumeText));

if (_consumeText == "") then {
    _consumeText = if (_hungerSatiated > 0) then {
        LLSTRING(EatingX);
    } else {
        LLSTRING(DrinkingX);
    };
};

// Format displayName onto consume text
// Allows for common strings to be used for multiple items
_consumeText = format [_consumeText, _displayName];

// Get consume animation and sound for item
private _stanceIndex = ["STAND", "CROUCH", "PRONE"] find stance _player;

// Handle in vehicle when stance is UNDEFINED
if (vehicle _player != _player) then {_stanceIndex = 0};

private _consumeAnim = getArray (_config >> QXGVAR(consumeAnims)) param [_stanceIndex, "", [""]];
private _consumeSound = getArray (_config >> QXGVAR(consumeSounds)) param [_stanceIndex, "", [""]];

private _soundPlayed = if (_consumeAnim != "" && {vehicle _player == _player && {!(_player call EFUNC(common,isSwimming))}}) then {
    // Store current animation for resetting
    _player setVariable [QGVAR(previousAnim), animationState _player];
    [_player, _consumeAnim, 1] call EFUNC(common,doAnimation);
    false
} else {
    // No animation to sync sound to
    if (_consumeSound != "") then {
        playSound _consumeSound;
    };
    true
};

private _fnc_onSuccess = {
    params ["_args"];
    _args params ["_player", "_consumeItem", "_replacementItem", "_thirstQuenched", "_hungerSatiated"];
    TRACE_1("Consume item successful",_args);

    // Remove consumed item
    _player removeItem _consumeItem;

    // Add replacement item if needed
    if (_replacementItem != "") then {
        [_player, _replacementItem] call EFUNC(common,addToInventory);
    };

    // Handle thirst and hunger values
    if (_thirstQuenched > 0) then {
        private _thirst = _player getVariable [QXGVAR(thirst), 0];
        _player setVariable [QXGVAR(thirst), (_thirst - _thirstQuenched) max 0];
    };

    if (_hungerSatiated > 0) then {
        private _hunger = _player getVariable [QXGVAR(hunger), 0];
        _player setVariable [QXGVAR(hunger), (_hunger - _hungerSatiated) max 0];
    };

    ["acex_rationConsumed", [_player, _consumeItem, _replacementItem, _thirstQuenched, _hungerSatiated]] call CBA_fnc_localEvent;

    _player setVariable [QGVAR(previousAnim), nil];
};

private _fnc_onFailure = {
    params ["_args"];
    _args params ["_player"];
    TRACE_1("Consume item failed",_args);

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
    _args params ["_player", "_consumeItem", "", "", "", "_consumeAnim", "_consumeSound", "_soundPlayed"];

    // Attempt to sync sound with animation start
    if (!_soundPlayed && {_consumeSound != "" && {_consumeAnim == "" || {animationState _player == _consumeAnim}}}) then {
        playSound _consumeSound;
        _args set [7, true];
    };

    _consumeItem in (_player call EFUNC(common,uniqueItems))
};

[
    _consumeTime,
    [
        _player,
        _consumeItem,
        _replacementItem,
        _thirstQuenched,
        _hungerSatiated,
        _consumeAnim,
        _consumeSound,
        _soundPlayed
    ],
    _fnc_onSuccess,
    _fnc_onFailure,
    _consumeText,
    _fnc_condition,
    ["isNotInside"]
] call EFUNC(common,progressBar);
