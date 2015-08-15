/*
 * Author: GitHawk
 * Rearms a vehicle
 *
 * Arguments:
 * 0: The Params <ARRAY>
 * 0,1: The Target <OBJECT>
 * 0,2: The Caller <OBJECT>
 * 0,3: The Turretpath <ARRAY>
 * 0,4: The Number of magazines <NUMBER>
 * 0,5: The Magazine <STRING>
 * 0,6: The Number of rounds <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call ace_rearm_fnc_rearmSuccess
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_rounds", "_currentRounds", "_maxMagazines"];
params ["_args"];
_args params ["_target", "_caller", "_turretPath", "_numMagazines", "_magazine", "_numRounds"];

//hint format ["Target: %1\nTurretPath: %2\nNumMagazines: %3\nMagazine: %4\nNumRounds: %5", _target, _turretPath, _numMagazines, _magazine, _numRounds];

if !(local _target) exitWith {
    [_this, QUOTE(DFUNC(rearmSuccess)), _target] call EFUNC(common,execRemoteFnc);
};

_rounds = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");
_currentRounds = 0;

_maxMagazines = [_target, _turretPath, _magazine] call FUNC(getMaxMagazines);
if (_maxMagazines == 1) then {
    _target setMagazineTurretAmmo [_magazine, ((_target magazineTurretAmmo [_magazine, _turretPath]) + _numRounds) min _rounds, _turretPath];
    ace_player setVariable [QGVAR(carriedMagazine), nil]; // TODO replace by item
} else {
    for "_idx" from 1 to _maxMagazines do {
        _currentRounds = _target magazineTurretAmmo [_magazine, _turretPath];
        if (_currentRounds > 0) exitWith {
            if ((_currentRounds + _numRounds) > _rounds) then {
                _target setMagazineTurretAmmo [_magazine, _rounds, _turretPath];
                if (_numMagazines  < _maxMagazines) then {
                    _target addMagazineTurret [_magazine, _turretPath];
                    _target setMagazineTurretAmmo [_magazine, _currentRounds + _numRounds - _rounds, _turretPath];
                };
            } else {
                _target setMagazineTurretAmmo [_magazine, _currentRounds + _numRounds, _turretPath];
            };
            ace_player setVariable [QGVAR(carriedMagazine), nil]; // TODO replace by item
        };
        _target removeMagazineTurret [_magazine, _turretPath];
    };
};