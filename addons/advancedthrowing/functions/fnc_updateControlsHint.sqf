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
 * call ace_advancedthrowing_fnc_updateControlsHint
 *
 * Public: No
 */
#include "script_component.hpp"

if (!GVAR(showMouseControls)) exitWith {};

private _mmb = [localize LSTRING(ChangeMode), localize LSTRING(Extend)] select GVAR(extendedDrop);

if (!GVAR(primed)) then {
    _mmb = [_mmb, localize LSTRING(Cook)] joinString " / ";
};

[
    localize LSTRING(Throw),
    [localize ELSTRING(common,Cancel), ""] select (GVAR(primed)),
    _mmb
] call EFUNC(interaction,showMouseHint);
