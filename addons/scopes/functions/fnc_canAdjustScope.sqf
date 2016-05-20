/*
 * Author: PabstMirror
 * Tests if player would be in a position to adjust scope
 * Mainly for determining edge cases with turned-out / FFV.
 *
 * Argument:
 * 0: Unit <OBJECT>
 *
 * Return value:
 * <BOOL>
 *
 * Example:
 * [player] call ace_scopes_fnc_canAdjustScope
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if ((vehicle _unit) == _unit) exitWith {true};

private _animationState = animationState _unit;
private _moves = configFile >> getText (configFile >> "CfgVehicles" >> (typeof _unit) >> "moves");

(getNumber (_moves >> "States" >> _animationState  >> "canPullTrigger") == 1)
