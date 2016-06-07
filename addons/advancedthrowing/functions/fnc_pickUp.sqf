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

// Detach if attached (to vehicle for example or another player)
private _attachedTo = attachedTo GVAR(activeThrowable);
if (!isNull _attachedTo) then {
    detach GVAR(activeThrowable);

    // Fix throw speed in some cases after detaching
    GVAR(throwSpeed) = getNumber (configFile >> "CfgMagazines" >> typeOf GVAR(activeThrowable) >> "initSpeed");
};

// Change locality for manipulation (some commands require local object, such as setVelocity)
if (!local GVAR(activeThrowable)) then {
    ["setOwner", [GVAR(activeThrowable), clientOwner]] call EFUNC(common,serverEvent);
};

// Invoke listenable event
["ace_throwablePickedUp", [GVAR(activeThrowable), _unit, _attachedTo]] call CBA_fnc_localEvent;

GVAR(primed) = true;
_unit call FUNC(prepare)
