#include "..\script_component.hpp"
/*
 * Author: mrschick
 * Checks if caller can blindfold the captive.
 *
 * Arguments:
 * 0: Caller (player) <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can blindfold <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_captives_fnc_canBlindfoldCaptive
 *
 * Public: No
 */

params ["_unit", "_target"];
// Alive, handcuffed, not being escorted, caller has a blindfold in their inventory and target isn't already wearing a blindfold

(_target getVariable [QGVAR(isHandcuffed), false]) &&
{isNull (attachedTo _target)} &&
{alive _target} &&
{(GVAR(blindfolds) findAny (_unit call EFUNC(common,uniqueItems))) != -1} &&
{!((goggles _target) in GVAR(blindfolds))}
