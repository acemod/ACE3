#include "..\script_component.hpp"
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

if (!GVAR(showMouseControls)) exitWith {};

private _primed = ACE_player getVariable [QGVAR(primed), false];

private _mmb = [LLSTRING(ChangeMode), LLSTRING(Extend)] select (ACE_player getVariable [QGVAR(dropMode), false]);

if (!_primed) then {
    _mmb = [_mmb, LLSTRING(Cook)] joinString " / ";
};

[
    LLSTRING(Throw),
    [LELSTRING(common,Cancel), ""] select _primed,
    _mmb
] call EFUNC(interaction,showMouseHint);
