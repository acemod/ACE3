/*
 * Author: Jonpas
 * Picks up a throwable from the ground.
 *
 * Arguments:
 * 0: Pick Up Helper <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, throwable] call ace_advancedthrowing_fnc_pickUp
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_helper", "_unit"];

GVAR(activeThrowable) = _helper getVariable [QGVAR(throwable), objNull];

if (isNull GVAR(activeThrowable)) exitWith {};

GVAR(primed) = true;

_unit call FUNC(prepare)
