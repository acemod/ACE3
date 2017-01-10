/*
 * Author: PabstMirror
 * xx
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, [0]] call ace_hellfire_fnc_turretChanged
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_turretPath"];

private _vehicle = vehicle _player;
private _typeOf = typeOf _vehicle;
if ((!alive _player) || {_player == _vehicle}) exitWith {};

private _enabled = false;
{
    private _weapon = _x;
    if ((getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(enabled))) == 1) then {
        TRACE_1("enabled",_weapon);
        _enabled = true;
    };
} forEach (_vehicle weaponsTurret _turretPath);

TRACE_3("turretChanged",_enabled,_typeOf,_turretPath);
if (!_enabled) exitWith {};

[_vehicle] call FUNC(insertFireModeActions);

private _turretConfig = [configFile >> "CfgVehicles" >> _typeOf, _turretPath] call EFUNC(common,getTurretConfigPath);
private _seekerSource = getText (_turretConfig >> "memoryPointGunnerOptics");
TRACE_2("",_seekerSource,_vehicle selectionPosition _seekerSource);
if ((_vehicle modelToWorld (_vehicle selectionPosition _seekerSource)) isEqualTo [0,0,0]) then {WARNING("seeker has no mem point");};


[{
    params ["_args", "_pfID"];
    _args params ["_vehicle", "_turretPath", "_seekerSource"];

    // If we switched vehicles or turret, exit
    if (!(((vehicle ace_player) == _vehicle) && {_turretPath isEqualTo (ace_player call CBA_fnc_turretPath)})) exitWith {
        TRACE_1("exiting pfeh",_this);
        [_pfID] call CBA_fnc_removePerFrameHandler;
        if (!isNull (uiNamespace getVariable [QGVAR(display), displayNull])) then {
            ([QGVAR(modeDisplay)] call BIS_fnc_rscLayer) cutText ["", "PLAIN"];
        };
    };

    // Restart display if null
    if (isNull (uiNamespace getVariable [QGVAR(display), displayNull])) then {
        TRACE_1("creating display",time);
        ([QGVAR(modeDisplay)] call BIS_fnc_rscLayer) cutRsc [QGVAR(modeDisplay), "PLAIN", 1, false];
    };

    private _currentWeapon = _vehicle currentWeaponTurret _turretPath;
    private _ammo = _vehicle ammo _currentWeapon;
    private _showLockMode = ((_ammo > 0) && {(getNumber (configFile >> "CfgWeapons" >> _currentWeapon >> QGVAR(enabled))) == 1});

    private _ctrlGroup = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl 1000;

    if (!_showLockMode) exitWith {
        _ctrlGroup ctrlShow false;
    };
    _ctrlGroup ctrlShow true;

    private _ctrlText = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl 1001;
    private _ctrlIcon = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl 1002;
    private _ctrlCode = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl 1003;

    // Do Laser Scan:
    private _laserSource = AGLtoASL (_vehicle modelToWorld (_vehicle selectionPosition _seekerSource));
    private _laserCode = _vehicle getVariable [QEGVAR(laser,code), ACE_DEFAULT_LASER_CODE];
    private _laserResult = [_laserSource, vectorDir _vehicle, 70, 5000, [ACE_DEFAULT_LASER_WAVELENGTH,ACE_DEFAULT_LASER_WAVELENGTH], _laserCode, _vehicle] call EFUNC(laser,seekerFindLaserSpot);
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

}, 0.1, [_vehicle, _turretPath, _seekerSource]] call CBA_fnc_addPerFrameHandler;
