/*
 * Author: commy2
 * Animate scripted reticle of spotting scope.
 *
 * Arguments:
 * 0: Reticles RSC info display <DISPLAY>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

params ["_display"];

//uinamespace setVariable [QGVAR(dlgSpottingScope), _display]; 

// check if optics are used
// hide all controls otherwise
private _isUsingOptic = ctrlShown (_display displayCtrl 154);

(_display displayCtrl IDC_BLACK_LEFT) ctrlShow _isUsingOptic;
(_display displayCtrl IDC_BLACK_RIGHT) ctrlShow _isUsingOptic;

// animate reticle
private _ctrlReticle = _display displayCtrl IDC_RETICLE;
private _ctrlBody = _display displayCtrl IDC_BODY;

_ctrlReticle ctrlShow _isUsingOptic;
_ctrlBody ctrlShow _isUsingOptic;

private _zoom = ([] call EFUNC(common,getZoom)) * MAGIC_SCOPE_NUMBER;

_ctrlReticle ctrlSetPosition [
    POS_X_BASE(_zoom),
    POS_Y_BASE(_zoom),
    POS_W_BASE(_zoom),
    POS_H_BASE(_zoom)
];

_ctrlReticle ctrlCommit 0;
