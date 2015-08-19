/*
 * Author: GitHawk
 * Rearm an entire turret locally.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank, [0]] call ace_rearm_fnc_rearmEntireVehicleSuccessLocal
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_magazines", "_magazine", "_currentMagazines", "_maxMagazines", "_maxRounds", "_currentRounds"];
params ["_vehicle", "_turretPath"];

_magazines = [];
if (_turretPath isEqualTo [-1]) then {
    _magazines = [_vehicle, _turretPath] call FUNC(getConfigMagazines);
} else {
    _magazines = _vehicle magazinesTurret _turretPath;
};
{
    _magazine = _x;
    _currentMagazines = { _x == _magazine } count (_vehicle magazinesTurret _turretPath);
    _maxMagazines = [_vehicle, _turretPath, _magazine] call FUNC(getMaxMagazines);
    _maxRounds = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");
    _currentRounds = _vehicle magazineTurretAmmo [_magazine, _turretPath];

    TRACE_7("Rearmed Turret",_vehicle,_turretPath,_currentMagazines,_maxMagazines,_currentRounds,_maxRounds,_magazine);

    if (_turretPath isEqualTo [-1] && _currentMagazines == 0) then {
        // On driver, the an empty magazine is still there, but is not returned by magazinesTurret
        _currentMagazines =  _currentMagazines + 1;
    };
    if (_currentMagazines < _maxMagazines) then {
        _vehicle setMagazineTurretAmmo [_magazine, _maxRounds, _turretPath];
        for "_idx" from 1 to (_maxMagazines - _currentMagazines) do {
            _vehicle addMagazineTurret [_magazine, _turretPath];
        };
    } else {
        _vehicle setMagazineTurretAmmo [_magazine, _maxRounds, _turretPath];
    };
} foreach _magazines;
