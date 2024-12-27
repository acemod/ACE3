#include "..\script_component.hpp"
/*
 * Author: tcvm
 * SACLOS seeker
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Position of wanted missile pos relative to the camera direction <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_seekerType_SACLOS
 *
 * Public: No
 */
params ["", "_args"];
_args params ["_firedEH", "", "", "_seekerParams", "_stateParams", "_targetData"];
_firedEH params ["_shooter","_weapon","","","","","_projectile"];
_seekerParams params ["_seekerAngle"];
_stateParams params ["", "_seekerStateParams"];
_seekerStateParams params ["_memoryPointGunnerOptics", "_animationSourceBody", "_animationSourceGun", "_usePilotCamera"];

private _shooterPos = AGLToASL (_shooter modelToWorldVisual (_shooter selectionPosition _memoryPointGunnerOptics));
private _projPos = getPosASL _projectile;

private _lookDirection = if (_shooter isKindOf "CAManBase" || {_shooter isKindOf "StaticWeapon"}) then {
    _shooterPos = eyePos _shooter;
    _shooter weaponDirection _weapon
} else {
    private _finalLookDirection = if (_usePilotCamera) then {
        _shooterPos = _shooter modelToWorldVisualWorld getPilotCameraPosition _shooter;
        private _trackingTarget = getPilotCameraTarget _shooter;
        _trackingTarget params ["_isTracking", "_trackingPos"];
        // Because ARMA doesnt update the camera rotation if you are locked on immediatly, we have to calculate the look direction manually or else the SACLOS target will be wrong, especially if shooter is moving
        if (_isTracking) then {
            vectorNormalized (_trackingPos vectorDiff _shooterPos);
        } else {
            _shooter vectorModelToWorldVisual getPilotCameraDirection _shooter;
        };
    } else {
        // use animationSourcePhase
        private _gBody = -deg(_shooter animationSourcePhase _animationSourceBody);
        private _gGun = deg(_shooter animationSourcePhase _animationSourceGun);
        _shooter vectorModelToWorldVisual ([1, _gBody, _gGun] call CBA_fnc_polar2vect);
    };
    _finalLookDirection
};

private _distanceToProj = _shooterPos vectorDistance _projPos;
private _testPointVector = vectorNormalized (_projPos vectorDiff _shooterPos);
private _testDotProduct = (_lookDirection vectorDotProduct _testPointVector);

private _testIntersections = lineIntersectsSurfaces [_shooterPos, _projPos, _shooter];

if ((_testDotProduct < (cos _seekerAngle)) || {_testIntersections isNotEqualTo []}) exitWith {
    // out of LOS of seeker
    [0, 0, 0]
};

private _returnPos = _shooterPos vectorAdd (_lookDirection vectorMultiply _distanceToProj);

_targetData set [0, _projPos vectorFromTo _returnPos];
_targetData set [2, _returnPos vectorDistance getPosASLVisual _projectile];

_returnPos
