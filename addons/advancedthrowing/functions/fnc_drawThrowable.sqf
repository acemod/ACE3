/*
 * Author: Dslyecxi, Jonpas
 * Handles drawing the currently selected or cooked throwable.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_advancedthrowing_fnc_drawThrowable
 *
 * Public: No
 */
#include "script_component.hpp"

if (dialog || {!(ACE_player getVariable [QGVAR(inHand), false])} || {!([ACE_player] call FUNC(canPrepare))}) exitWith {
    [ACE_player, "In dialog or no throwable in hand or cannot prepare throwable"] call FUNC(exitThrowMode);
};

private _throwable = currentThrowable ACE_player;
private _throwableMag = _throwable select 0;
private _primed = ACE_player getVariable [QGVAR(primed), false];
private _activeThrowable = ACE_player getVariable [QGVAR(activeThrowable), objNull];

// Handle cooking last throwable in inventory
if (_primed) then {
    _throwableMag = typeOf _activeThrowable;
} else {
    // Some throwables have different classname for magazine and ammo
    // Check only CfgMagazines one for correct value only when not primed to assure correct magazine is used
    _throwSpeed = getNumber (configFile >> "CfgMagazines" >> _throwableMag >> "initSpeed");
    ACE_player setVariable [QGVAR(throwSpeed), _throwSpeed];
};

// Inventory check
if (_throwable isEqualTo [] && {!_primed}) exitWith {
    [ACE_player, "No valid throwables"] call FUNC(exitThrowMode);
};

private _throwableType = getText (configFile >> "CfgMagazines" >> _throwableMag >> "ammo");

if (!([ACE_player] call FUNC(canThrow)) && {!_primed}) exitWith {
    if (!isNull _activeThrowable) then {
        deleteVehicle _activeThrowable;
    };
};

if (isNull _activeThrowable || {(_throwableType != typeOf _activeThrowable) && {!_primed}}) then {
    if (!isNull _activeThrowable) then {
        deleteVehicle _activeThrowable;
    };
    _activeThrowable = _throwableType createVehicleLocal (getPosWorld ACE_player);
    _activeThrowable enableSimulation false;
    ACE_player setVariable [QGVAR(activeThrowable), _activeThrowable];
};


// Set position
private _posHeadRel = ACE_player selectionPosition "head";

private _leanCoef = (_posHeadRel select 0) - 0.15; // 0.15 counters the base offset
if (abs _leanCoef < 0.15 || {vehicle ACE_player != ACE_player}) then {
    _leanCoef = 0;
};

private _posCameraWorld = positionCameraToWorld [0, 0, 0];
_posHeadRel = _posHeadRel vectorAdd [-0.03, 0.01, 0.15]; // Bring closer to eyePos value
private _posFin = AGLToASL (ACE_player modelToWorldVisual _posHeadRel);

private _throwType = ACE_player getVariable [QGVAR(throwType), THROW_TYPE_DEFAULT];

// Orient it nicely, point towards player
_activeThrowable setDir ((getDirVisual ACE_player) + 90);

private _pitch = [-30, -90] select (_throwType == "high");
[_activeThrowable, _pitch, 0] call BIS_fnc_setPitchBank;


if (ACE_player getVariable [QGVAR(dropMode), false]) then {
    _posFin = _posFin vectorAdd (positionCameraToWorld [_leanCoef, 0, ACE_player getVariable [QGVAR(dropDistance), DROP_DISTANCE_DEFAULT]]);

    // Even vanilla throwables go through glass, only "GEOM" LOD will stop it but that will also stop it when there is glass in a window
    if (lineIntersects [AGLtoASL _posCameraWorld, _posFin vectorDiff _posCameraWorld]) then {
        ACE_player setVariable [QGVAR(dropDistance), (ACE_player getVariable [QGVAR(dropDistance), DROP_DISTANCE_DEFAULT] - 0.1) max DROP_DISTANCE_DEFAULT]
    };
} else {
    private _xAdjustBonus = [0, -0.075] select (_throwType == "high");
    private _yAdjustBonus = [0, 0.1] select (_throwType == "high");
    private _cameraOffset = [_leanCoef, 0, 0.3] vectorAdd [-0.05, -0.12, -0.03] vectorAdd [_xAdjustBonus, _yAdjustBonus, 0];

    _posFin = _posFin vectorAdd (positionCameraToWorld _cameraOffset);

    if (vehicle ACE_player != ACE_player) then {
        // Counteract vehicle velocity including acceleration
        private _vectorDiff = (velocity (vehicle ACE_player)) vectorMultiply (time - (ACE_player getVariable [QGVAR(lastTick), time]) + 0.01);
        _posFin = _posFin vectorAdd _vectorDiff;
        ACE_player setVariable [QGVAR(lastTick), time];
    };
};

_activeThrowable setPosASL (_posFin vectorDiff _posCameraWorld);
