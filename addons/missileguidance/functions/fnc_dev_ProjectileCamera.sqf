#include "..\script_component.hpp"
/*
 * Author: tcvm
 * tracks a projectile until it explodes
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_projectile"];

private _camera = "camera" camCreate getPosATL _projectile;
_camera camPrepareFov 0.7;
_camera cameraEffect ["internal", "back"];

_camera camCommitPrepared 0;

GVAR(debug_camera_close) = false;
private _displayEH = (findDisplay 46) displayAddEventHandler ["KeyDown", {
    params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
    GVAR(debug_camera_close) = (_key == 1);
    true
}];

[{
    params ["_args", "_pfh"];
    _args params ["_projectile", "_camera", "_projectilePos", "_displayEH"];
    if (!alive _projectile || GVAR(debug_camera_close)) exitWith {
        private _delay = 1.5;
        if (GVAR(debug_camera_close)) then {
            _delay = 0;
        };

        (findDisplay 46) displayRemoveEventHandler ["KeyDown", _displayEH];

        [{
            params ["_camera"];

            _camera cameraEffect ["terminate", "back"];
            _camera camCommitPrepared 0;
            camDestroy _camera;
        }, [_camera], _delay] call CBA_fnc_waitAndExecute;

        _camera camPrepareTarget _projectilePos;
        _camera camCommitPrepared 0;

        [_pfh] call CBA_fnc_removePerFrameHandler;
    };

    _camera camPrepareTarget _projectile;
    _camera camPrepareRelPos [0, -5, 1];
    _camera camCommitPrepared 0;

    _args set [2, getPosATL _projectile];
}, 0, [_projectile, _camera, getPosATL _projectile, _displayEH]] call CBA_fnc_addPerFrameHandler;
