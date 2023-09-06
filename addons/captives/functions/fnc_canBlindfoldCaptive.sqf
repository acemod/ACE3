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
 * [player, cursorObject] call ACE_captives_fnc_canBlindfoldCaptive
 *
 * Public: No
 */

params ["_unit", "_target"];
// Alive, handcuffed, not being escorted, and caller has a blindfold in their inventory

(_target getVariable [QGVAR(isHandcuffed), false]) &&
{isNull (attachedTo _target)} &&
{alive _target} &&
{isNull objectParent _unit} &&
{isNull objectParent _target} &&
{(GVAR(blindfolds) findAny (_unit call EFUNC(common,uniqueItems))) != -1}
