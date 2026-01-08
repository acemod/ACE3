#include "..\script_component.hpp"
/*
 * Author: Dslyecxi, Jonpas, kymckay
 * Handles drawing the currently selected or cooked throwable.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_advanced_throwing_fnc_drawThrowable
 *
 * Public: No
 */

if (dialog || {!(ACE_player getVariable [QGVAR(inHand), false])} || {!([ACE_player, true] call FUNC(canPrepare))}) exitWith {
    [ACE_player, "In dialog or no throwable in hand or cannot prepare throwable"] call FUNC(exitThrowMode);
};

private _primed = ACE_player getVariable [QGVAR(primed), false];
private _activeThrowable = ACE_player getVariable [QGVAR(activeThrowable), objNull];

// Exit if throwable died primed in hand
if (_primed && {isNull _activeThrowable}) exitWith {
    [ACE_player, "Throwable died primed in hand"] call FUNC(exitThrowMode);
};

private _throwable = currentThrowable ACE_player;

// Inventory check
if (!_primed && {_throwable isEqualTo []}) exitWith {
    [ACE_player, "No valid throwables"] call FUNC(exitThrowMode);
};

_throwable params ["_throwableMag", "_muzzle"];

// If not primed, double check we actually have the magazine in inventory
// Can't use ace_common_fnc_hasMagazine, as it doesn't account for empty mags (grenade is emptied so that it can't be thrown via vanilla keybind)
if (!_primed && {!(_throwableMag in (magazines [ACE_player, true]))}) exitWith {
    [ACE_player, "No valid throwable (glitched currentThrowable)"] call FUNC(exitThrowMode);
};

// Get correct throw power for primed grenade
if (_primed) then {
    // If ammo type is not found:
    // What we're trying to throw must not be a normal throwable because it is not in our lookup hash (e.g. 40mm smoke)
    // Just use HandGrenade as it has an average initSpeed value
    _throwableMag = (uiNamespace getVariable QGVAR(ammoMagLookup)) getOrDefault [typeOf _activeThrowable, "HandGrenade"];
};

// Some throwables have different classname for magazine and ammo
// Primed magazine may be different, read speed before checking primed magazine!
private _throwSpeed = getNumber (configFile >> "CfgMagazines" >> _throwableMag >> "initSpeed");

// Reduce power of throw over shoulder and to sides
private _unitDirVisual = getDirVisual ACE_player;
private _cameraDir = getCameraViewDirection ACE_player;
_cameraDir = (_cameraDir select 0) atan2 (_cameraDir select 1);

private _phi = abs (_cameraDir - _unitDirVisual) % 360;
_phi = [_phi, 360 - _phi] select (_phi > 180);

private _power = linearConversion [0, 180, (ACE_player getVariable [QGVAR(throwMod), THROW_MODIFER_DEFAULT]) * (_phi - 30), 1, 0.3, true];
ACE_player setVariable [QGVAR(throwSpeed), _throwSpeed * _power];

TRACE_5("",_phi,_power,_throwSpeed * _power,_throwableMag,ACE_player getVariable ARR_2([QGVAR(activeMuzzle),ARR_2(["",-1])]));

private _throwableType = getText (configFile >> "CfgMagazines" >> _throwableMag >> "ammo");

if (!_primed && {!([ACE_player] call FUNC(canThrow))}) exitWith {
    if (!isNull _activeThrowable) then {
        deleteVehicle _activeThrowable;
        // Restore muzzle ammo (setAmmo has no impact if no applicable throwable in inventory)
        ACE_player setAmmo (ACE_player getVariable [QGVAR(activeMuzzle), ["", -1]]);
    };
};

if (isNull _activeThrowable || {!_primed && {_throwableType != typeOf _activeThrowable}}) then {
    if (!isNull _activeThrowable) then {
        deleteVehicle _activeThrowable;
        // Restore muzzle ammo (setAmmo has no impact if no applicable throwable in inventory)
        ACE_player setAmmo (ACE_player getVariable [QGVAR(activeMuzzle), ["", -1]]);
    };
    _activeThrowable = _throwableType createVehicleLocal [0, 0, 0];
    _activeThrowable enableSimulation false;
    ACE_player setVariable [QGVAR(activeThrowable), _activeThrowable];

    if ((GVAR(hiddenThrowables) findIf {(_x isEqualTo true) || {_x == _throwableType}}) != -1) then {
        //if show disabled, hide active but retain vehicle for path calculation.
        hideObject _activeThrowable;
    };
    // Set muzzle ammo to 0 to block vanilla throwing
    ACE_player setVariable [QGVAR(activeMuzzle), [_muzzle, ACE_player ammo _muzzle]];
    ACE_player setAmmo [_muzzle, 0];
};

// Exit in case of explosion in hand
if (isNull _activeThrowable) exitWith {
    [ACE_player, "No active throwable (explosion in hand)"] call FUNC(exitThrowMode);
};

// Exit if locality changed (someone took the throwable from hand)
if (!local _activeThrowable && {ACE_player getVariable [QGVAR(localityChanged), true]}) exitWith {
    [ACE_player, "Throwable locality changed"] call FUNC(exitThrowMode);
};

// Set position
private _posHeadRel = ACE_player selectionPosition "head";

private _leanCoef = (_posHeadRel select 0) - 0.15; // 0.15 counters the base offset
// Don't take leaning into account when weapon is lowered due to jiggling when walking side-ways (bandaid)
if (abs _leanCoef < 0.15 || {!isNull objectParent ACE_player} || {weaponLowered ACE_player}) then {
    _leanCoef = 0;
};

private _posCameraWorld = AGLToASL (positionCameraToWorld [0, 0, 0]);
_posHeadRel = _posHeadRel vectorAdd [-0.03, 0.01, 0.15]; // Bring closer to eyePos value
private _posFin = ACE_player modelToWorldVisualWorld _posHeadRel;

private _throwMod = ACE_player getVariable [QGVAR(throwMod), THROW_MODIFER_DEFAULT];

// Orient it nicely, point towards player
_activeThrowable setDir (_unitDirVisual + 90);

private _pitch = linearConversion [THROW_MODIFER_MIN, THROW_MODIFER_MAX, _throwMod, -90, -30];
[_activeThrowable, _pitch, 0] call BIS_fnc_setPitchBank;

// Force drop mode if underwater
if (underwater player) then {
    ACE_player setVariable [QGVAR(dropMode), true];
};

if (ACE_player getVariable [QGVAR(dropMode), false]) then {
    _posFin = _posFin vectorAdd (AGLToASL (positionCameraToWorld [_leanCoef, 0, ACE_player getVariable [QGVAR(dropDistance), DROP_DISTANCE_DEFAULT]]));

    // Even vanilla throwables go through glass, only "GEOM" LOD will stop it but that will also stop it when there is no glass in a window
    if (lineIntersects [_posCameraWorld, _posFin vectorDiff _posCameraWorld]) then {
        ACE_player setVariable [QGVAR(dropDistance), ((ACE_player getVariable [QGVAR(dropDistance), DROP_DISTANCE_DEFAULT]) - 0.1) max DROP_DISTANCE_DEFAULT];
    };
} else {
    private _xAdjustBonus = linearConversion [THROW_MODIFER_MIN, THROW_MODIFER_MAX, _throwMod, -0.075, 0];
    private _yAdjustBonus = linearConversion [THROW_MODIFER_MIN, THROW_MODIFER_MAX, _throwMod, 0.1, 0];
    private _cameraOffset = [_leanCoef, 0, 0.3] vectorAdd [-0.1, -0.15, -0.03] vectorAdd [_xAdjustBonus, _yAdjustBonus, 0];

    _posFin = _posFin vectorAdd (AGLToASL (positionCameraToWorld _cameraOffset));

    if (!isNull objectParent ACE_player) then {
        // Counteract vehicle velocity including acceleration
        private _vectorDiff = (velocity (vehicle ACE_player)) vectorMultiply (time - (ACE_player getVariable [QGVAR(lastTick), time]) + 0.01);
        _posFin = _posFin vectorAdd _vectorDiff;
        ACE_player setVariable [QGVAR(lastTick), time];
    };
};

_activeThrowable setPosASL (_posFin vectorDiff _posCameraWorld);
