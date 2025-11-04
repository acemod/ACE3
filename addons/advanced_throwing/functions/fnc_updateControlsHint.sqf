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
private _dropMode = ACE_player getVariable [QGVAR(dropMode), false];

private _mmb = [format [LLSTRING(ChangePower), localize "STR_dik_shift"], LLSTRING(Extend)] select _dropMode;

if (!_primed) then {
    _mmb = [_mmb, LLSTRING(Cook)] joinString " / ";
};
private _modifier = if (_dropMode || {GVAR(throwStepSetting) == 1}) then {
    []
} else {
    [["-", LLSTRING(SnapPower), [toUpper localize "STR_dik_shift", "+", image QPATHTOEF(interaction,UI\mouse_scroll_ca.paa)]]]
};

[
    LLSTRING(Throw),
    [LELSTRING(common,Cancel), ""] select _primed,
    _mmb,
    _modifier
] call EFUNC(interaction,showMouseHint);
