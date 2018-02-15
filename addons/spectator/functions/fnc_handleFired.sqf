/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to add projectiles to be drawn when a unit fires
 *
 * Arguments:
 * Fired EH arguments
 *
 * Return Value:
 * None
 *
 * Example:
 * _unit addEventHandler ["Fired",{_this call ace_spectator_fnc_handleFired}]
 *
 * Public: No
 */

#include "script_component.hpp"

params [
    "_unit",
    ["_weapon", "", [""]],
    "", // Muzzle
    "", // Mode
    ["_ammo", "", [""]], // Ammo
    "", // Magazine
    ["_projectile", objNull, [objNull]]
];

// Remove the EH when spectator is no longer active or unit is removed
if (isNil QGVAR(entitiesToDraw) || {!(_unit in GVAR(entitiesToDraw))}) exitWith {
    //USES_VARIABLES ["_thisEventHandler"]
    _unit removeEventHandler ["Fired", _thisEventHandler];
    SETVAR(_unit,GVAR(firedEH),nil);
};

// Fire time used for unit icon highlighting
_unit setVariable [QGVAR(highlightTime), time + FIRE_HIGHLIGHT_TIME];

// expensive, but any non local units might have this as null for 'global' projectiles (like grenades)
if (isNull _projectile) then {
    _projectile = nearestObject [_unit, _ammo];
};

// Store projectiles / grenades for drawing
if (_weapon == "Throw") then {
    [QGVAR(addToGrenadeTracking), [_projectile]] call CBA_fnc_localEvent;
} else {
    [QGVAR(addToProjectileTracking), [_projectile]] call CBA_fnc_localEvent;
};
