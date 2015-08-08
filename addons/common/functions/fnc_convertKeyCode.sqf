/*
 * Author: commy2
 *
 * Get a key code used in ACE key input eh.
 *
 * Arguments:
 * 0: Arma DIK code <NUMBER>
 * 1: Key state for shift left and shift right key <BOOL>
 * 2: Key state for ctrl left and ctrl right key <BOOL>
 * 3: Key state for alt and alt gr key <BOOL>
 *
 * Return Value:
 * Key code <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

#define KEY_MODIFIERS [42, 54, 29, 157, 56, 184]

params ["_key","_stateShift","_stateCtrl","_stateAlt"];

if (_key in KEY_MODIFIERS) exitWith {_key};

if (_stateShift) then {_key = _key + 0.1};
if (_stateCtrl) then {_key = _key + 0.2};
if (_stateAlt) then {_key = _key + 0.4};

_key
