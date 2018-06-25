#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Tests if can escort target (attach)
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_canEscortCaptive
 *
 * Public: No
 */

params ["_unit", "_target"];
//Alive, handcuffed, not being escored, and not unconscious

(_target getVariable [QGVAR(isHandcuffed), false]) &&
{isNull (attachedTo _target)} &&
{alive _target} &&
{!(_target getVariable ["ACE_isUnconscious", false])} &&
{(vehicle _unit) == _unit} &&
{(vehicle _target) == _target}
