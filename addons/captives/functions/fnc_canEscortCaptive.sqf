#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Tests if can escort target (attach)
 *
 * Arguments:
 * 0: Caller (player) <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Can escort <BOOL>
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_canEscortCaptive
 *
 * Public: No
 */

params ["_unit", "_target"];
// Alive, handcuffed, not being escorted, and not unconscious

(_target getVariable [QGVAR(isHandcuffed), false]) &&
{isNull (attachedTo _target)} &&
{_target call EFUNC(common,isAwake)} &&
{isNull objectParent _unit} &&
{isNull objectParent _target}
