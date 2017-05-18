/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to add projectiles to be drawn when a unit fires
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
    _unit removeEventHandler ["Fired", _thisEventHandler];
    SETVAR(_unit,GVAR(firedEH),nil);
};

// Fire time used for unit icon highlighting
_unit setVariable [QGVAR(highlightTime), time + FIRE_HIGHLIGHT_TIME];

// Store projectiles / grenades for drawing
if (GVAR(drawProjectiles) && {!isNull _projectile}) then {
    if (_weapon == "Throw") then {
        if (count GVAR(grenades) > MAX_GRENADES) then { GVAR(grenades) deleteAt 0; };
        GVAR(grenades) pushBack _projectile;
    } else {
        if (count GVAR(projectiles) > MAX_PROJECTILES) then { GVAR(projectiles) deleteAt 0; };
        GVAR(projectiles) pushBack [_projectile, [[getPosVisual _projectile, [1,0,0,0]]]];
    };
};
