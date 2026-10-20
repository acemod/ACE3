#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets up MCLOS state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_MCLOS_onFired
 *
 * Public: No
 */
params ["_firedEH", "", "", "", "_stateParams"];
_firedEH params ["_shooter","_weapon","","","","","_projectile", "_gunner"];

if !(_gunner call EFUNC(common,isPlayer)) then {
    // AI shot - save shot info (ToDo: Handle offset for optics/launch dir?)
    // _stateParams params ["", "_seekerStateParams"];
    _stateParams set [1, [getPosASLVisual _projectile, vectorNormalized velocity _projectile]];
};
private _source = vehicle _shooter;

private _controlled = _source getVariable [QGVAR(mclos_projectiles), []];
_controlled pushBack _projectile;
_source setVariable [QGVAR(mclos_projectiles), _controlled];

_projectile setVariable [QGVAR(source), _source];
