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

_activeThrowable = _helper getVariable [QGVAR(throwable), objNull];

if (isNull _activeThrowable) exitWith {};

// Detach if attached (to vehicle for example or another player)
private _attachedTo = attachedTo _activeThrowable;
if (!isNull _attachedTo) then {
    detach _activeThrowable;
};

// Change locality for manipulation (some commands require local object, such as setVelocity)
if (!local _activeThrowable) then {
    ["setOwner", [_activeThrowable, clientOwner]] call EFUNC(common,serverEvent);
};

// Invoke listenable event
["ace_throwablePickedUp", [_activeThrowable, _unit, _attachedTo]] call CBA_fnc_localEvent;

_unit setVariable [QGVAR(primed), true];
_unit setVariable [QGVAR(activeThrowable), _activeThrowable];

_unit call FUNC(prepare);
