#include "script_component.hpp"
/*
 * Author: jaynus / nou
 * Handles AI shooting a locking missile
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Ammo <STRING>
 * 2: Shooter <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, "x", player] call ace_missileguidance_fnc_changeMissileDirection;
 *
 * Public: No
 */

params ["_target", "_ammo", "_shooter"];

if (GVAR(enabled) < 1) exitWith {};    // bail if enabled
if !(local (gunner _shooter) || {local _shooter}) exitWith {}; // bail if not shooter

_shooter setVariable [QGVAR(vanilla_target),_target, false];
TRACE_2("setting vanilla target",_shooter,_target);
