/*
 * Author: Jonpas
 * Updates controls hints based on current state.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_advanced_throwing_fnc_updateControlsHint
 *
 * Public: No
 */
#include "script_component.hpp"

if (!GVAR(showMouseControls)) exitWith {};

private _primed = ACE_player getVariable [QGVAR(primed), false];

private _mmb = [localize LSTRING(ChangeMode), localize LSTRING(Extend)] select (ACE_player getVariable [QGVAR(dropMode), false]);

if (!_primed) then {
    _mmb = [_mmb, localize LSTRING(Cook)] joinString " / ";
};

[
    localize LSTRING(Throw),
    [localize ELSTRING(common,Cancel), ""] select _primed,
    _mmb
] call EFUNC(interaction,showMouseHint);
