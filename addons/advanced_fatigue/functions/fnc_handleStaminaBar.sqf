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

private _staminaBarContainer = uiNamespace getVariable [QGVAR(staminaBarContainer), controlNull];
if !(ctrlShown _staminaBarContainer) exitWith {};

private _staminaBar =  uiNamespace getVariable [QGVAR(staminaBar), controlNull];

private _stamina = GVAR(anReserve) / AN_MAXRESERVE;

// - Size ---------------------------------------------------------------------
// Change size of container to cut-off bar picture
private _sizeAndPos = ctrlPosition _staminaBarContainer;
_sizeAndPos set [2, _stamina * STAMINA_BAR_WIDTH];
_staminaBarContainer ctrlSetPosition _sizeAndPos;

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
_staminaBar ctrlCommit 0;
_staminaBarContainer ctrlCommit 1;

