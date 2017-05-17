/*
 * Author: SilentSpike
 * Function used to select the vision mode
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_newVision"];

private _oldVision = GVAR(camVision);
private _visions = GVAR(availableVisions);

// If new vision isn't available then keep current (unless current also isn't)
if !(_newVision in _visions) then {
    _newVision = _visions select ((_visions find _oldVision) max 0);
};

// Nothing to do here
if (_newVision == _oldVision) exitWith {};

// Vision mode does not apply to fps view
if (GVAR(camMode) != MODE_FPS) then {
    // 0+ are all thermal vision types
    if (_newVision < 0) then {
        false setCamUseTi 0;
        camUseNVG (_newVision >= VISION_NVG);
    } else {
        true setCamUseTi _newVision;
    };

    // Give user feedback that vision mode changed
    playSound "RscDisplayCurator_visionMode";
};

GVAR(camVision) = _newVision;
