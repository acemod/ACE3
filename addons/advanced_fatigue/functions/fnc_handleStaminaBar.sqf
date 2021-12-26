#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles visual changes of the stamina bar.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [0.5] call ace_advanced_fatigue_fnc_handleStaminaBar
 *
 * Public: No
 */

private _staminaBar = uiNamespace getVariable [QGVAR(staminaBar), controlNull];
if !(ctrlShown _staminaBar) exitWith {};


private _stamina = GVAR(anReserve) / AN_MAXRESERVE;

// - Size ---------------------------------------------------------------------
_staminaBar progressSetPosition _stamina;

// - Opacity ------------------------------------------------------------------
if (GVAR(fadeStaminaBar)) then {
    if (_stamina >= 0.8) then {
        _staminaBar ctrlSetFade (0.9 + 0.1 * (_stamina - 0.8) / 0.2);
    } else {
        _staminaBar ctrlSetFade (0.9 * _stamina / 0.8);
    };
} else {
    _staminaBar ctrlSetFade 0;
};

// - Color --------------------------------------------------------------------
// 1.0 - 0.8: White
// 0.6 - 0.4: Orange
// 0.4 - 0.2: Red
private _color = [1, 1, 1];
if (_stamina < 0.6) then {
    if (_stamina < 0.4) then {
        _color = [1, 0, 0] vectorAdd ([0, 0.65, 0] vectorMultiply ((_stamina - 0.2) / 0.2));
    } else {
        _color = [1, 0.65, 0] vectorAdd ([0, 0.35, 1] vectorMultiply ((_stamina - 0.4) / 0.2));
    };
};
_color pushBack 1;
_staminaBar ctrlSetTextColor _color;

