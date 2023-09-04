#include "script_component.hpp"
/*
 * Author: mrschick
 * Tests if caller has a Contact DLC blindfold in their inventory to put on the captive
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_canBlindfoldCaptive
 *
 * Public: No
 */

params ["_unit", "_target"];
//Alive, handcuffed, not being escorted, and caller has a Contact DLC blindfold in their inventory

(_target getVariable [QGVAR(isHandcuffed), false]) &&
{isNull (attachedTo _target)} &&
{alive _target} &&
{(vehicle _unit) == _unit} &&
{(vehicle _target) == _target} &&
{(["G_Blindfold_01_black_F", "G_Blindfold_01_white_F"] findAny (items _unit)) != -1}

