/*
 * Author: VKing
 * Calculate FCS solution
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Turret <ARRAY>
 * 2: Target distance <NUMBER>
 * 3: Azimuth offset <UNKNOWN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [car, [turret], 5, ?] call ace_fcs_fnc_calculateSolution
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_vehicle","_turret","_distance","_angleTarget"];
TRACE_4("params",_vehicle,_turret,_distance,_angleTarget);

private _FCSInitSpeed = [];
private _FCSMagazines = [];
private _FCSElevation = [];
private _turretConfig = [configFile >> "CfgVehicles" >> typeOf _vehicle, _turret] call EFUNC(common,getTurretConfigPath);

{
    private _magazine = _x;
    private _ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");

    private _bulletSimulation = getText (configFile >> "CfgAmmo" >> _ammo >> "simulation");
    if !(_bulletSimulation == "shotMissile") then {
        private _maxElev     = getNumber (_turretConfig >> "maxElev");
        private _initSpeed   = getNumber (configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
        private _airFriction = getNumber (configFile >> "CfgAmmo" >> _ammo >> "airFriction");

        {
            private _weapon = _x;
            private _muzzles = getArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles");
            private _weaponMagazines = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");

            {
                if (_x != "this") then {
                    _weaponMagazines append getArray (configFile >> "CfgWeapons" >> _weapon >> _x >> "magazines");
                };
                false
            } count _muzzles;

            // Fix the `in` operator being case sensitive and BI fucking up the spelling of their own classnames
            private _weaponMagazinesCheck = _weaponMagazines apply {toLower _x};

            // Another BIS fix: ShotBullet simulation uses weapon initSpeed, others ignore it
            if (toLower _magazine in _weaponMagazinesCheck && {_bulletSimulation == "shotBullet"}) exitWith {
                private _initSpeedCoef = getNumber(configFile >> "CfgWeapons" >> _weapon >> "initSpeed");

                if (_initSpeedCoef < 0) then {
                    _initSpeed = _initSpeed * -_initSpeedCoef;
                };

                if (_initSpeedCoef > 0) then {
                    _initSpeed = _initSpeedCoef;
                };
            };
            false
        } count (_vehicle weaponsTurret _turret);

        private _offset = "ace_fcs" callExtension format ["%1,%2,%3,%4", _initSpeed, _airFriction, _angleTarget, _distance];
        _offset = parseNumber _offset;

        _FCSInitSpeed pushBack _initSpeed;
        _FCSMagazines pushBack _magazine;
        _FCSElevation pushBack _offset;
    };
    false
} count (_vehicle magazinesTurret _turret);

[_vehicle, format ["%1_%2", QGVAR(Distance),  _turret],     _distance] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(InitSpeed), _turret], _FCSInitSpeed] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Magazines), _turret], _FCSMagazines] call EFUNC(common,setVariablePublic);
[_vehicle, format ["%1_%2", QGVAR(Elevation), _turret], _FCSElevation] call EFUNC(common,setVariablePublic);
