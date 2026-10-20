#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Updates camera with inputs
 *
 * Arguments:
 * 0: Key Pressed <NUMBER>
 * 1: Down <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [5, true] call ace_spike_fnc_camera_handleKeyPress
 *
 * Public: No
 */
params ["_key", "_down"];

if !([objNull] call FUNC(camera_userInCamera)) exitWith {};

private _return = false;
private _lookInput = GVAR(activeCamera) getVariable [QGVAR(lookInput), [0, 0, 0, 0]];
private _designateInput = GVAR(activeCamera) getVariable [QGVAR(designateInput), [0]];
switch (_key) do {
    case SPIKE_KEY_DESIGNATE: {
        // designate whatever. depends on seeker to implement
        if (_down) then {
            _designateInput set [0, 1];
        } else {
            _designateInput set [0, 0];
        };
        _return = true;
    };
    case SPIKE_KEY_LEAVE: {
        [] call FUNC(camera_switchAway);
    };
    case CAMERA_KEY_UP: {
        if (_down) then {
            _lookInput set [0, 1];
        } else {
            _lookInput set [0, 0];
        };
        _return = true;
    }; //Up

    case CAMERA_KEY_LEFT: {
        if (_down) then {
            _lookInput set [2, 1];
        } else {
            _lookInput set [2, 0];
        };
        _return = true;
    }; //Left

    case CAMERA_KEY_RIGHT: {
        if (_down) then {
            _lookInput set [3, 1];
        } else {
            _lookInput set [3, 0];
        };
        _return = true;
    }; //Right

    case CAMERA_KEY_DOWN: {
        if (_down) then {
            _lookInput set [1, 1];
        } else {
            _lookInput set [1, 0];
        };
        _return = true;
    }; //Down
    case CAMERA_KEY_CHANGE_VISION_MODE: {
        if(_down) then {
            [GVAR(activeCamera)] call FUNC(camera_cycleViewMode);
        };
        _return = true;
    }; //N
    case CAMERA_KEY_ZOOM_IN: {
        if(_down) then {
            [GVAR(activeCamera), true] call FUNC(camera_changeZoom);
        };
        _return = true;
    }; // Num+
    case CAMERA_KEY_ZOOM_OUT: {
        if(_down) then {
            [GVAR(activeCamera), false] call FUNC(camera_changeZoom);
        };
        _return = true;
    }; // Num-
};
GVAR(activeCamera) setVariable [QGVAR(designateInput), _designateInput];
GVAR(activeCamera) setVariable [QGVAR(lookInput), _lookInput];

_return
