/*
 * Author: GitHawk
 * Rearm an entire vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank] call ace_rearm_fnc_rearmEntireVehicleSuccess
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_turretPath", "_magazines", "_magazine", "_currentMagazines", "_maxMagazines", "_maxRounds", "_currentRounds"];
params ["_vehicle"];

if !(local _vehicle) exitWith {
    [_this, QFUNC(rearmEntireVehicleSuccess), _vehicle] call EFUNC(common,execRemoteFnc);
};

{
    _turretPath = _x;
    _magazines = _vehicle magazinesTurret _turretPath;
    {
        _magazine = _x;
        _currentMagazines = { _x == _magazine } count (_vehicle magazinesTurret _turretPath);
        _maxMagazines = [_vehicle, _turretPath, _magazine] call FUNC(getMaxMagazines);
        _maxRounds = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");
        _currentRounds = _vehicle magazineTurretAmmo [_magazine, _turretPath];

        //diag_log format ["Target: %1\nTurretPath: %2\nNumMagazines: %3\nMaxMagazines %4\nNumRounds: %5\nMaxRounds: %6\nMagazine: %7", _vehicle, _turretPath, _currentMagazines, _maxMagazines, _currentRounds, _maxRounds, _magazine];
        if (_currentMagazines < _maxMagazines) then {
            _vehicle setMagazineTurretAmmo [_magazine, _maxRounds, _turretPath];
            for "_idx" from 1 to (_maxMagazines - _currentMagazines) do {
                _vehicle addMagazineTurret [_magazine, _turretPath];
            };
        } else {
            if (_currentRounds > 0) then {
                _vehicle setMagazineTurretAmmo [_magazine, _maxRounds, _turretPath];
            } else {
                _vehicle removeMagazineTurret [_magazine, _turretPath];
            };
        };
    } foreach _magazines;
} foreach REARM_TURRET_PATHS;
