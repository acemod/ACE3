#include "..\script_component.hpp"
/*
 * Author: PabstMirror, Ruthberg (Based on ace_atragmx)
 * Gets ballistic info for a weapon, mag and ammo
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Weapon Info <ARRAY>
 *
 * Example:
 * [] call ace_xm157_fnc_ballistics_getData
 *
 * Public: No
 */

private _unit = ace_player;
private _weaponClass = primaryWeapon _unit;
private _magazineClass = (primaryWeaponMagazine _unit) param [0, ""];
private _ammoClass = getText (configFile >> "CfgMagazines" >> _magazineClass >> "ammo");

private _key = format ["weaponInfoCache-%1-%2-%3",_weaponClass,_magazineClass,_ammoClass];
private _weaponInfo = GVAR(data) getOrDefault [_key, []];
if ((_weaponInfo isEqualTo []) && {_magazineClass != ""}) then {
    TRACE_3("new weapon/mag",_weaponClass,_magazineClass,_ammoClass);

    private _zeroRange = 100;
    private _boreHeight = [_unit, 0] call EFUNC(scopes,getBoreHeight);

    private _ammoConfig = _ammoClass call EFUNC(advanced_ballistics,readAmmoDataFromConfig);
    _ammoConfig params ["_airFriction","_caliber","_bulletLength","_bulletMass","","_dragModel","_ballisticCoefficients","","_atmosphereModel","","_muzzleVelocityTable","_barrelLengthTable"];
    private _weaponConfig = _weaponClass call EFUNC(advanced_ballistics,readWeaponDataFromConfig);
    _weaponConfig params ["_barrelTwist", "_twistDirection", "_barrelLength"];
    private _bc = if (_ballisticCoefficients isEqualTo []) then { 0 } else { _ballisticCoefficients # 0 };

    private _useAB = (
        missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false] &&
        {missionNamespace getVariable [QEGVAR(advanced_ballistics,barrelLengthInfluenceEnabled), false]} &&
        {_bc != 0}
    );

    // Get Muzzle Velocity
    private _muzzleVelocity = if (_barrelLength > 0 && _useAB) then {
        [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, 0] call EFUNC(advanced_ballistics,calculateBarrelLengthVelocityShift)
    } else {
        private _initSpeed = getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "initSpeed");
        private _initSpeedCoef = getNumber (configFile >> "CfgWeapons" >> _weaponClass >> "initSpeed");
        if (_initSpeedCoef < 0) then {
            _initSpeed = _initSpeed * -_initSpeedCoef;
        };
        if (_initSpeedCoef > 0) then {
            _initSpeed = _initSpeedCoef;
        };
        _initSpeed
    };

    // Scope Base Angle
    private _zeroAngle = "ace_advanced_ballistics" callExtension format ["calcZero:%1:%2:%3:%4", _zeroRange, _muzzleVelocity, _airFriction, _boreHeight];
    private _scopeBaseAngle = parseNumber _zeroAngle;

    _weaponInfo = [_scopeBaseAngle,_boreHeight,_airFriction,_muzzleVelocity,_bc,_dragModel,_atmosphereModel,_barrelTwist,_twistDirection,_caliber,_bulletLength,_bulletMass];
    GVAR(data) set [_key, _weaponInfo];
    TRACE_1("setting cache",_weaponInfo);
};

_weaponInfo
