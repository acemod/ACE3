#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Switches to the currently controlled camera
 *
 * Arguments:
 * 0: Camera <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cam] call ace_spike_fnc_camera_switchTo
 *
 * Public: No
 */
if ([] call FUNC(camera_userInCamera)) exitWith {};

params ["_cameraNamespace"];
private _camera = _cameraNamespace getVariable QGVAR(camera);
private _projectile = _cameraNamespace getVariable QGVAR(missile);
_camera cameraEffect ["internal", "BACK"];
GVAR(activeCamera) = _cameraNamespace;
[_cameraNamespace, _cameraNamespace getVariable [QGVAR(tiModeString), "normal"]] call FUNC(camera_setViewMode);
[_cameraNamespace, _cameraNamespace getVariable [QGVAR(currentZoomIndex), 0]] call FUNC(camera_setZoom);


private _reticleData = _cameraNamespace getVariable QGVAR(reticleData);
_reticleData params ["_titleRsc", "_centerReticle", "_controlsToDisappearOnLock", "_controlsToAppearOnLock", "_leftGate", "_rightGate", "_topGate", "_bottomGate", "_uiNamespaceDialogVariable"];

// setup the HUD reticle
QGVAR(camera_hud) cutRsc [_titleRsc, "PLAIN"];

private _rscDissapearOnLock = [];
private _rscAppearOnLock = [];

{
    _rscDissapearOnLock pushBack ((uiNamespace getVariable _uiNamespaceDialogVariable) displayCtrl _x);
} forEach _controlsToDisappearOnLock;

{
    _rscAppearOnLock pushBack ((uiNamespace getVariable _uiNamespaceDialogVariable) displayCtrl _x);
} forEach _controlsToAppearOnLock;

_cameraNamespace setVariable [QGVAR(reticleCenter), (uiNamespace getVariable _uiNamespaceDialogVariable) displayCtrl _centerReticle];
_cameraNamespace setVariable [QGVAR(disappearOnLock), _rscDissapearOnLock];
_cameraNamespace setVariable [QGVAR(appearOnLock), _rscAppearOnLock];
_cameraNamespace setVariable [QGVAR(reticleLeft), (uiNamespace getVariable _uiNamespaceDialogVariable) displayCtrl _leftGate];
_cameraNamespace setVariable [QGVAR(reticleRight), (uiNamespace getVariable _uiNamespaceDialogVariable) displayCtrl _rightGate];
_cameraNamespace setVariable [QGVAR(reticleTop), (uiNamespace getVariable _uiNamespaceDialogVariable) displayCtrl _topGate];
_cameraNamespace setVariable [QGVAR(reticleBottom), (uiNamespace getVariable _uiNamespaceDialogVariable) displayCtrl _bottomGate];
