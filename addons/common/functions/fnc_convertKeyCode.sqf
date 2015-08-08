/*
 * Author: commy2
 *
 * Get a key code used in ACE key input eh.
 *
 * Arguments:
 * 0: Arma DIK code (Number)
 * 1: Key state for shift left and shift right key (Bool)
 * 2: Key state for ctrl left and ctrl right key (Bool)
 * 3: Key state for alt and alt gr key (Bool)
 *
 * Return value:
 * Key code (Number)
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
