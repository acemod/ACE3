#include "script_component.hpp"
/*
 * Author: mrschick
 * Checks if caller can blindfold the captive
 *
 * Arguments:
 * 0: Caller (player) <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can blindfold <BOOL>
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_canBlindfoldCaptive
 *
 * Public: No
 */

params ["_unit", "_target"];
// Alive, handcuffed, not being escorted, and caller has a Contact DLC blindfold in their inventory

(_target getVariable [QGVAR(isHandcuffed), false]) &&
{isNull (attachedTo _target)} &&
{alive _target} &&
{(vehicle _unit) == _unit} &&
{(vehicle _target) == _target} &&
{(GVAR(validBlindfolds) findAny (items _unit)) != -1}

