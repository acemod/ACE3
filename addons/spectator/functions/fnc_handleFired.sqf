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
    "", // Ammo
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

// Store projectiles / grenades for drawing
if (GVAR(drawProjectiles) && {!isNull _projectile}) then {
    if (_weapon == "Throw") then {
        if (count GVAR(grenadesToDraw) > MAX_GRENADES) then { GVAR(grenadesToDraw) deleteAt 0; };
        GVAR(grenadesToDraw) pushBack _projectile;
    } else {
        if (count GVAR(projectilesToDraw) > MAX_PROJECTILES) then { GVAR(projectilesToDraw) deleteAt 0; };
        GVAR(projectilesToDraw) pushBack [_projectile, [[getPosVisual _projectile, [1,0,0,0]]]];
    };
};
