/*
 * Author: Dslyecxi, Jonpas, SilentSpike
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
#include "script_component.hpp"

if (dialog || {!(ACE_player getVariable [QGVAR(inHand), false])} || {!([ACE_player, true] call FUNC(canPrepare))}) exitWith {
    [ACE_player, "In dialog or no throwable in hand or cannot prepare throwable"] call FUNC(exitThrowMode);
};

private _primed = ACE_player getVariable [QGVAR(primed), false];
private _activeThrowable = ACE_player getVariable [QGVAR(activeThrowable), objNull];

// Exit if throwable died primed in hand
if (isNull _activeThrowable && {_primed}) exitWith {
    [ACE_player, "Throwable died primed in hand"] call FUNC(exitThrowMode);
};

private _throwable = currentThrowable ACE_player;

// Inventory check
if (_throwable isEqualTo [] && {!_primed}) exitWith {
    [ACE_player, "No valid throwables"] call FUNC(exitThrowMode);
};

private _throwableMag = _throwable param [0, "#none"];

// If not primed, double check we actually have the magazine in inventory
if ((!_primed) && {!((_throwableMag in (uniformItems ACE_player)) || {_throwableMag in (vestItems ACE_player)} || {_throwableMag in (backpackItems ACE_player)})}) exitWith {
    [ACE_player, "No valid throwable (glitched currentThrowable)"] call FUNC(exitThrowMode);
};

// Get correct throw power for primed grenade
if (_primed) then {
    private _ammoType = typeOf _activeThrowable;
    _throwableMag = GVAR(ammoMagLookup) getVariable _ammoType;
    if (isNil "_throwableMag") then {
        // What we're trying to throw must not be a normal throwable because it is not in our lookup hash (e.g. 40mm smoke)
        // Just use HandGrenade as it has an average initSpeed value
        _throwableMag = "HandGrenade";
    };
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

private _power = linearConversion [0, 180, _phi - 30, 1, 0.3, true];
ACE_player setVariable [QGVAR(throwSpeed), _throwSpeed * _power];

#ifdef DEBUG_MODE_FULL
hintSilent format ["Heading: %1\nPower: %2\nSpeed: %3\nThrowMag: %4\nMuzzle: %5", _phi, _power, _throwSpeed * _power, _throwableMag, ACE_player getVariable [QGVAR(activeMuzzle), ""]];
#endif

private _throwableType = getText (configFile >> "CfgMagazines" >> _throwableMag >> "ammo");

if (!([ACE_player] call FUNC(canThrow)) && {!_primed}) exitWith {
    if (!isNull _activeThrowable) then {
        deleteVehicle _activeThrowable;
        // Restore muzzle ammo (setAmmo 1 has no impact if no appliccable throwable in inventory)
        ACE_player setAmmo [ACE_player getVariable [QGVAR(activeMuzzle), ""], 1];
    };
};

if (isNull _activeThrowable || {(_throwableType != typeOf _activeThrowable) && {!_primed}}) then {
    if (!isNull _activeThrowable) then {
        deleteVehicle _activeThrowable;
        // Restore muzzle ammo (setAmmo 1 has no impact if no appliccable throwable in inventory)
        ACE_player setAmmo [ACE_player getVariable [QGVAR(activeMuzzle), ""], 1];
    };
    _activeThrowable = _throwableType createVehicleLocal [0, 0, 0];
    _activeThrowable enableSimulation false;
    ACE_player setVariable [QGVAR(activeThrowable), _activeThrowable];

    // Set muzzle ammo to 0 to block vanilla throwing (can only be 0 or 1)
    private _muzzle = _throwableMag call FUNC(getMuzzle);
    ACE_player setAmmo [_muzzle, 0];
    ACE_player setVariable [QGVAR(activeMuzzle), _muzzle];
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
if (abs _leanCoef < 0.15 || {vehicle ACE_player != ACE_player} || {weaponLowered ACE_player}) then {
    _leanCoef = 0;
};

private _posCameraWorld = AGLToASL (positionCameraToWorld [0, 0, 0]);
_posHeadRel = _posHeadRel vectorAdd [-0.03, 0.01, 0.15]; // Bring closer to eyePos value
private _posFin = AGLToASL (ACE_player modelToWorldVisual _posHeadRel);

private _throwType = ACE_player getVariable [QGVAR(throwType), THROW_TYPE_DEFAULT];

// Orient it nicely, point towards player
_activeThrowable setDir (_unitDirVisual + 90);

private _pitch = [-30, -90] select (_throwType == "high");
[_activeThrowable, _pitch, 0] call BIS_fnc_setPitchBank;


if (ACE_player getVariable [QGVAR(dropMode), false]) then {
    _posFin = _posFin vectorAdd (AGLToASL (positionCameraToWorld [_leanCoef, 0, ACE_player getVariable [QGVAR(dropDistance), DROP_DISTANCE_DEFAULT]]));

    // Even vanilla throwables go through glass, only "GEOM" LOD will stop it but that will also stop it when there is no glass in a window
    if (lineIntersects [_posCameraWorld, _posFin vectorDiff _posCameraWorld]) then {
        ACE_player setVariable [QGVAR(dropDistance), ((ACE_player getVariable [QGVAR(dropDistance), DROP_DISTANCE_DEFAULT]) - 0.1) max DROP_DISTANCE_DEFAULT];
    };
} else {
    private _xAdjustBonus = [0, -0.075] select (_throwType == "high");
    private _yAdjustBonus = [0, 0.1] select (_throwType == "high");
    private _cameraOffset = [_leanCoef, 0, 0.3] vectorAdd [-0.1, -0.15, -0.03] vectorAdd [_xAdjustBonus, _yAdjustBonus, 0];

    _posFin = _posFin vectorAdd (AGLToASL (positionCameraToWorld _cameraOffset));

    if (vehicle ACE_player != ACE_player) then {
        // Counteract vehicle velocity including acceleration
        private _vectorDiff = (velocity (vehicle ACE_player)) vectorMultiply (time - (ACE_player getVariable [QGVAR(lastTick), time]) + 0.01);
        _posFin = _posFin vectorAdd _vectorDiff;
        ACE_player setVariable [QGVAR(lastTick), time];
    };
};

_activeThrowable setPosASL (_posFin vectorDiff _posCameraWorld);
