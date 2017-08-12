/*
 * Author: PabstMirror
 * Shows the hellfire hud when vehicle is equiped with the weapon.
 * Shows laser code, fire mode and seeker status.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call ace_hellfire_fnc_showHud
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];
TRACE_1("showHud",_player);

private _enabled = false;
private _vehicle = vehicle _player;
private _turretPath = [-1];

if ((alive _player) && {_player != _vehicle}) then {
    if (_player != (driver _vehicle)) then {
        _turretPath = _player call CBA_fnc_turretPath
    };
    {
        if ((getNumber (configFile >> "CfgWeapons" >> _x >> QGVAR(enabled))) == 1) then {
            TRACE_1("enabled",_x);
            _enabled = true;
        };
    } forEach (_vehicle weaponsTurret _turretPath);
};

if ((!_enabled) && (GVAR(pfID) < 0)) exitWith {TRACE_2("Disabled - No Change",_enabled,GVAR(pfID));};

TRACE_2("Cleaning up old pfeh and display",_enabled,GVAR(pfID));
[GVAR(pfID)] call CBA_fnc_removePerFrameHandler;
if (!isNull (uiNamespace getVariable [QGVAR(display), displayNull])) then {
    ([QGVAR(modeDisplay)] call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
};
GVAR(pfID) = -1;

if (!_enabled) exitWith {TRACE_2("Disabled - Now Off",_enabled,GVAR(pfID));};

TRACE_2("Enabled - Adding actions and PFEH",_enabled,GVAR(pfID));

[_vehicle, _turretPath] call FUNC(setupVehicle);

private _adjustDown = false; // Flares display will block ours, if present just move ours down a bit
{
    if ((getText (configFile >> "CfgWeapons" >> _x >> "simulation")) == "cmlauncher") exitWith {_adjustDown = true};
} forEach (_vehicle weaponsTurret _turretPath);

private _turretConfig = [_vehicle, _turretPath] call CBA_fnc_getTurret;
private _seekerSource = getText (_turretConfig >> "memoryPointGunnerOptics");
TRACE_3("",_adjustDown,_seekerSource,_vehicle selectionPosition _seekerSource);

GVAR(pfID) = [{
    params ["_args", "_pfID"];
    _args params ["_vehicle", "_turretPath", "_seekerSource", "_adjustDown"];

    // Restart display if null (not just at start, this will happen periodicly)
    if (isNull (uiNamespace getVariable [QGVAR(display), displayNull])) then {
        TRACE_1("creating display",_this);
        ([QGVAR(modeDisplay)] call BIS_fnc_rscLayer) cutRsc [QGVAR(modeDisplay), "PLAIN", 1, false];
        if (_adjustDown) then {
            private _ctrl = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl IDC_MODECONTROLGROUP;
            private _pos = ctrlPosition _ctrl;
            _pos set [1, (_pos select 1) + ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)];
            _ctrl ctrlSetPosition _pos;
            _ctrl ctrlCommit 0;
        };
    };

    private _currentWeapon = _vehicle currentWeaponTurret _turretPath;
    private _showLockMode = (getNumber (configFile >> "CfgWeapons" >> _currentWeapon >> QGVAR(enabled))) == 1;

    private _ctrlGroup = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl 1000;

    if (!_showLockMode) exitWith {
        _ctrlGroup ctrlShow false;
    };
    _ctrlGroup ctrlShow true;

    private _ctrlText = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl IDC_ATTACKMODE;
    private _ctrlCode = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl IDC_LASERCODE;
    private _ctrlIcon = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl IDC_LASERICON;

    // Do Laser Scan:
    private _ammo = getText (configFile >> "CfgMagazines" >> _vehicle currentMagazineTurret _turretPath >> "ammo");
    private _laserSource = AGLtoASL (_vehicle modelToWorld (_vehicle selectionPosition _seekerSource));
    private _laserCode = _vehicle getVariable [QEGVAR(laser,code), ACE_DEFAULT_LASER_CODE];
    private _seekerAngle = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ace_missileguidance" >> "seekerAngle");
    private _seekerMaxRange = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ace_missileguidance" >> "seekerMaxRange");
    private _laserResult = [_laserSource, vectorDir _vehicle, _seekerAngle, _seekerMaxRange, [ACE_DEFAULT_LASER_WAVELENGTH,ACE_DEFAULT_LASER_WAVELENGTH], _laserCode, _vehicle] call EFUNC(laser,seekerFindLaserSpot);
    private _foundTargetPos = _laserResult select 0;
    private _haveLock = !isNil "_foundTargetPos";

    private _modeShort = "ERR";
    private _vehicleLockMode = _vehicle getVariable [QEGVAR(missileguidance,attackProfile), ""];

    switch (_vehicleLockMode) do { // note: missileguidance is case sensitive
    case ("hellfire_hi"): {
            _modeShort = getText (configFile >> QEGVAR(missileguidance,AttackProfiles) >> _vehicleLockMode >> "name");
        };
    case ("hellfire_lo"): {
            _modeShort = getText (configFile >> QEGVAR(missileguidance,AttackProfiles) >> _vehicleLockMode >> "name");
        };
        default {
            _vehicleLockMode = "hellfire";
            _modeShort = if (_haveLock) then {
                getText (configFile >> QEGVAR(missileguidance,AttackProfiles) >> _vehicleLockMode >> "nameLocked");
            } else {
                getText (configFile >> QEGVAR(missileguidance,AttackProfiles) >> _vehicleLockMode >> "name");
            };
        };
    };

    _ctrlIcon ctrlSetTextColor ([[0,0,0,0.25],[1,0,0,0.75]] select _haveLock);
    _ctrlText ctrlSetText _modeShort;
    _ctrlCode ctrlSetText format ["CODE: %1", _laserCode];

}, 0.1, [_vehicle, _turretPath, _seekerSource, _adjustDown]] call CBA_fnc_addPerFrameHandler;
