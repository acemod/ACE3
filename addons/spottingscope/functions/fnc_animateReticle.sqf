/*
 * Author: commy2
 * Animate scripted reticle of spotting scope.
 *
 * Arguments:
 * 0: Reticles RSC info display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY] call ace_spottingscope_fnc_animateReticle
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

params ["_display"];
uinamespace setVariable [QGVAR(dlgSpottingScope), _display];

private _ctrlReticle = _display displayCtrl IDC_RETICLE;
private _ctrlBody = _display displayCtrl IDC_BODY;
private _ctrlBlackLeft = _display displayCtrl IDC_BLACK_LEFT;
private _ctrlBlackRight = _display displayCtrl IDC_BLACK_RIGHT;

// check if optics are used
// hide all controls otherwise
private _isUsingOptic = ctrlShown (_display displayCtrl 154);

_ctrlReticle ctrlShow _isUsingOptic;
_ctrlBody ctrlShow _isUsingOptic;
_ctrlBlackLeft ctrlShow _isUsingOptic;
_ctrlBlackRight ctrlShow _isUsingOptic;

// animate reticle
private _zoom = ([] call EFUNC(common,getZoom)) * MAGIC_SCOPE_NUMBER;

_ctrlReticle ctrlSetPosition [
    POS_X_BASE(_zoom),
    POS_Y_BASE(_zoom),
    POS_W_BASE(_zoom),
    POS_H_BASE(_zoom)
];

_ctrlReticle ctrlCommit 0;
