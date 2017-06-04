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

// 1.70 pylons
private _pylonConfigs = configProperties [configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"];
{
    private _pylonTurret = getArray (_x >> "turret");
    if (_pylonTurret isEqualTo []) then {_pylonTurret = [-1];}; // convert to expected array for driver
    if (_pylonTurret isEqualTo _turretPath) then {
        private _pylonIndex = _forEachIndex + 1; // GJ BIS
        private _pylonAmmo = _vehicle ammoOnPylon _pylonIndex;
        private _pylonMagazine = (getPylonMagazines _vehicle) select _forEachIndex;
        private _maxRounds = getNumber (configFile >> "CfgMagazines" >> _pylonMagazine >> "count");
        TRACE_4("",_pylonIndex,_pylonAmmo,_maxRounds,_pylonMagazine);
        if (_pylonAmmo < _maxRounds) then {
            if ((GVAR(supply) == 0) || {[_truck, _pylonMagazine, (_maxRounds - _pylonAmmo)] call FUNC(removeMagazineFromSupply)}) then {
                TRACE_3("Adding Rounds",_vehicle,_pylonIndex,_maxRounds);
                _vehicle setAmmoOnPylon [_pylonIndex, _maxRounds];
            };
        };
    };
} forEach _pylonConfigs;

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
            if ((GVAR(supply) == 0) || {[_truck, _magazine, _maxRounds] call FUNC(removeMagazineFromSupply)}) then {
                _vehicle addMagazineTurret [_magazine, _turretPath];
            };
        };
    } else {
        if ((GVAR(supply) == 0) || {[_truck, _magazine, (_maxRounds - _currentRounds)] call FUNC(removeMagazineFromSupply)}) then {
            _vehicle setMagazineTurretAmmo [_magazine, _maxRounds, _turretPath];
        };
    };
    false
} count _magazines;

