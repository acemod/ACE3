/*
 * Author: GitHawk
 * Rearm an entire turret locally.
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: TurretPath <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ammo_truck, tank, [0]] call ace_rearm_fnc_rearmEntireVehicleSuccessLocal
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_truck", objNull, [objNull]], ["_vehicle", objNull, [objNull]], ["_turretPath", [], [[]]]];
TRACE_3("rearmEntireVehicleSuccessLocal",_truck,_vehicle,_turretPath);

private _magazines = [_vehicle, _turretPath] call FUNC(getVehicleMagazines);
if (isNil "_magazines") exitWith {};
{
    private _magazine = _x;
    private _currentMagazines = { _x == _magazine } count (_vehicle magazinesTurret _turretPath);
    private _maxMagazines = [_vehicle, _turretPath, _magazine] call FUNC(getMaxMagazines);
    private _maxRounds = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");
    private _currentRounds = _vehicle magazineTurretAmmo [_magazine, _turretPath];

    TRACE_7("Rearmed Turret",_vehicle,_turretPath,_currentMagazines,_maxMagazines,_currentRounds,_maxRounds,_magazine);

    if (_turretPath isEqualTo [-1] && _currentMagazines == 0) then {
        // On driver, the empty magazine is still there, but is not returned by magazinesTurret
        _currentMagazines =  _currentMagazines + 1;
    };
    if (_currentMagazines < _maxMagazines) then {
        private _success = true;
        if ((GVAR(supply) == 0) || {[_truck, _magazine, (_maxRounds - _currentRounds)] call FUNC(removeMagazineFromSupply)}) then {
            _vehicle setMagazineTurretAmmo [_magazine, _maxRounds, _turretPath];
        };

        for "_idx" from 1 to (_maxMagazines - _currentMagazines) do {
            if ((GVAR(supply) > 0) && {[_truck, _magazine, _maxRounds] call FUNC(removeMagazineFromSupply)}) then {
                _vehicle addMagazineTurret [_magazine, _turretPath];
            };
        };
    } else {
        private _success = true;
        if (GVAR(supply) > 0) then {
            _success = [_truck, _magazine, (_maxRounds - _currentRounds)] call FUNC(removeMagazineFromSupply);
        };
        if (_success) then {
            _vehicle setMagazineTurretAmmo [_magazine, _maxRounds, _turretPath];
        };
    };
    false
} count _magazines;

