#include "script_component.hpp"
/*
 * Author: mharis001, Glowbal, PabstMirror
 * Main looping function that updates thirst/hunger status.
 *
 * Arguments:
 * 0: Next MP sync <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [60] call ace_field_rations_fnc_update
 *
 * Public: No
 */

// 1 sec (update interval) * 100 (max thirst/hunger) / 3600 (sec in hour) = 0.02777778
#define CHANGE_CONSTANT 0.02777778

params ["_nextMpSync"];

// Access global variable once
private _player = ACE_player;

// Exit if player is not alive or a virtual unit
if (!alive _player || {_player isKindOf "VirtualMan_F"}) exitWith {
    [FUNC(update), _nextMpSync, 1] call CBA_fnc_waitAndExecute;
    QGVAR(hud) cutFadeOut 0.5;
};

// Get current thirst and hunger
private _thirst = _player getVariable [QXGVAR(thirst), 0];
private _hunger = _player getVariable [QXGVAR(hunger), 0];

// Determine base change based on work multiplier
private _currentWork = 1;
if (vehicle _player == _player && {isTouchingGround _player}) then {
    private _speed = vectorMagnitude velocity _player;
    _currentWork = linearConversion [2, 7, _speed, 1, 2, true];
};

private _thirstChange = _currentWork * CHANGE_CONSTANT / XGVAR(timeWithoutWater);
private _hungerChange = _currentWork * CHANGE_CONSTANT / XGVAR(timeWithoutFood);

// Run status modifiers
{_thirstChange = _thirstChange + (_player call _x) * CHANGE_CONSTANT / XGVAR(timeWithoutWater)} forEach GVAR(thirstModifiers);
{_hungerChange = _hungerChange + (_player call _x) * CHANGE_CONSTANT / XGVAR(timeWithoutFood)} forEach GVAR(hungerModifiers);

// Change thirst and hunger status
_thirst = _thirst + _thirstChange min 100 max 0;
_hunger = _hunger + _hungerChange min 100 max 0;

// Check if we want to do a MP sync
private _doSync = false;

if (CBA_missionTime >= _nextMpSync) then {
    _doSync = true;
    _nextMpSync = CBA_missionTime + MP_SYNC_INTERVAL;
};

// Set new thirst and hunger values
_player setVariable [QXGVAR(thirst), _thirst, _doSync];
_player setVariable [QXGVAR(hunger), _hunger, _doSync];

// Handle any effects/consequences of high thirst or hunger
[_player, _thirst, _hunger] call FUNC(handleEffects);

// Handle showing/updating or hiding of HUD
if (!EGVAR(common,OldIsCamera) && {_thirst > XGVAR(hudShowLevel) || {_hunger > XGVAR(hudShowLevel)} || {GVAR(hudInteractionHover)}}) then {
    [_thirst, _hunger] call FUNC(handleHUD);
} else {
    QGVAR(hud) cutFadeOut 0.5;
};

[FUNC(update), _nextMpSync, 1] call CBA_fnc_waitAndExecute;
