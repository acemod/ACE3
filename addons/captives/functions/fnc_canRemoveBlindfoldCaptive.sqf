#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Checks if caller can remove blindfold from the captive.
 *
 * Arguments:
 * 0: Caller (player) <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can remove blindfold <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_captives_fnc_canRemoveBlindfoldCaptive
 *
 * Public: No
 */

params ["_unit", "_target"];
// Alive, handcuffed, not being escorted, and target is wearing a blindfold

(_target getVariable [QGVAR(isHandcuffed), false]) &&
{isNull (attachedTo _target)} &&
{alive _target} &&
{(goggles _target) in GVAR(blindfolds)}
