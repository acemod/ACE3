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

if (dialog || {!GVAR(inHand)} || {!([ACE_player] call FUNC(canPrepare))}) exitWith {
    [ACE_player, "In dialog or no throwable in hand or cannot prepare throwable"] call FUNC(exitThrowMode);
};

private _throwable = currentThrowable ACE_player;
private _throwableMag = _throwable select 0;

// Handle cooking last throwable in inventory
if (GVAR(primed)) then {
    _throwableMag = typeOf GVAR(activeThrowable);
} else {
    // Some throwables have different classname for magazine and ammo
    // Check only CfgMagazines one for correct value only when not primed to assure correct magazine is used
    GVAR(throwSpeed) = getNumber (configFile >> "CfgMagazines" >> _throwableMag >> "initSpeed");
};

// Inventory check
if ((count _throwable < 1 && !GVAR(primed)) || {_throwableMag == ""}) exitWith {
    [ACE_player, "No valid throwables"] call FUNC(exitThrowMode);
};

private _throwableType = getText (configFile >> "CfgMagazines" >> _throwableMag >> "ammo");

if (!([ACE_player] call FUNC(canThrow)) && {!GVAR(primed)}) exitWith {
    if (!isNull GVAR(activeThrowable)) then {
        deleteVehicle GVAR(activeThrowable);
    };
};

if (isNull GVAR(activeThrowable) || {(_throwableType != typeOf GVAR(activeThrowable)) && {!GVAR(primed)}}) then {
    if (!isNull GVAR(activeThrowable)) then {
        deleteVehicle GVAR(activeThrowable);
    };
    GVAR(activeThrowable) = _throwableType createVehicleLocal (getPosWorld ACE_player);
    GVAR(activeThrowable) enableSimulation false;
};


// Set position
private _leanCoef = ((ACE_player selectionPosition "head") select 0) - 0.15; // 0.15 counters the base offset
if (abs _leanCoef < 0.15 || {vehicle ACE_player != ACE_player}) then {
    _leanCoef = 0;
};

private _posCameraWorld = positionCameraToWorld [0, 0, 0];
private _posFin = eyePos ACE_player;

// Orient it nicely, point towards player
GVAR(activeThrowable) setDir ((getDir ACE_player) + 90);

private _pitch = [-30, -90] select (GVAR(throwType) == "high");
[GVAR(activeThrowable), _pitch, 0] call BIS_fnc_setPitchBank;


if (GVAR(extendedDrop)) then {
    _posFin = _posFin vectorAdd (positionCameraToWorld [_leanCoef, 0, GVAR(extendedDropDistance)]);

    // Even vanilla throwables go through glass, only "GEOM" LOD will stop it but that will also stop it when there is glass in a window
    if (lineIntersects [AGLtoASL _posCameraWorld, _posFin vectorDiff _posCameraWorld]) then {
        GVAR(extendedDropDistance) = (GVAR(extendedDropDistance) - 0.10) max 0.2;
    };
} else {
    private _xAdjustBonus = [0, -0.075] select (GVAR(throwType) == "high");
    private _yAdjustBonus = [0, 0.1] select (GVAR(throwType) == "high");
    private _cameraOffset = [_leanCoef, 0, 0.3] vectorAdd [-0.05, -0.12, -0.03] vectorAdd [_xAdjustBonus, _yAdjustBonus, 0];

    if (vehicle ACE_player == ACE_player) then {
        _posFin = _posFin vectorAdd (positionCameraToWorld _cameraOffset);
    } else {
        //@todo make it work while moving properly
        _posFin = _posFin vectorAdd (positionCameraToWorld _cameraOffset);
    };
};

GVAR(activeThrowable) setPosASL (_posFin vectorDiff _posCameraWorld);
