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

#define REARM_SUCCESS \
    [_unit, QGVAR(vehRearm), false] call EFUNC(common,setForceWalkStatus); \
    _dummy = _unit getVariable [QGVAR(dummy), objNull]; \
    if !(isNull _dummy) then { \
        detach _dummy; \
        deleteVehicle _dummy; \
    }; \
    _unit setVariable [QGVAR(carriedMagazine), nil, true]; \
    _weaponSelect = _unit getVariable QGVAR(selectedWeaponOnRearm); \
    _unit selectWeapon _weaponSelect; \
    _unit setVariable [QGVAR(selectedWeaponOnRearm), nil];

private ["_rounds", "_currentRounds", "_maxMagazines", "_dummy"];
params ["_args"];
_args params ["_target", "_unit", "_turretPath", "_numMagazines", "_magazine", "_numRounds"];

//hint format ["Target: %1\nTurretPath: %2\nNumMagazines: %3\nMagazine: %4\nNumRounds: %5", _target, _turretPath, _numMagazines, _magazine, _numRounds];

if !(local _target) exitWith {
    [_this, QUOTE(DFUNC(rearmSuccess)), _target] call EFUNC(common,execRemoteFnc);
};

_rounds = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");
_currentRounds = 0;

_maxMagazines = [_target, _turretPath, _magazine] call FUNC(getMaxMagazines);
if (_maxMagazines == 1) then {
    if (GVAR(level) == 1) then {
        // Fill magazine completely
        _target setMagazineTurretAmmo [_magazine, _rounds, _turretPath];
    } else {
        // Fill only at most _numRounds
        _target setMagazineTurretAmmo [_magazine, ((_target magazineTurretAmmo [_magazine, _turretPath]) + _numRounds) min _rounds, _turretPath];
    };
    [[LSTRING(Hint_RearmedTriple), _numRounds,
        getText(configFile >> "CfgMagazines" >> _magazine >> "displayName"),
        getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName")], 3, _unit] call EFUNC(common,displayTextStructured);
    
    REARM_SUCCESS
} else {
    for "_idx" from 1 to _maxMagazines do {
        _currentRounds = _target magazineTurretAmmo [_magazine, _turretPath];
        if (_currentRounds > 0) exitWith {
            if (GVAR(level) == 2) then {
                //hint format ["Target: %1\nTurretPath: %2\nNumMagazines: %3\nMaxMagazines %4\nMagazine: %5\nNumRounds: %6\nMagazine: %7", _target, _turretPath, _numMagazines, _maxMagazines, _currentRounds, _numRounds, _magazine];
                // Fill only at most _numRounds
                if ((_currentRounds + _numRounds) > _rounds) then {
                    _target setMagazineTurretAmmo [_magazine, _rounds, _turretPath];
                    if (_numMagazines  < _maxMagazines) then {
                        _target addMagazineTurret [_magazine, _turretPath];
                        _target setMagazineTurretAmmo [_magazine, _currentRounds + _numRounds - _rounds, _turretPath];
                    };
                } else {
                    _target setMagazineTurretAmmo [_magazine, _currentRounds + _numRounds, _turretPath];
                };
            } else {
                // Fill current magazine completely and fill next magazine partially
                _target setMagazineTurretAmmo [_magazine, _rounds, _turretPath];
                if (_numMagazines  < _maxMagazines) then {
                    _target addMagazineTurret [_magazine, _turretPath];
                    _target setMagazineTurretAmmo [_magazine, _currentRounds, _turretPath];
                };
            };
            [[LSTRING(Hint_RearmedTriple), _rounds,
                getText(configFile >> "CfgMagazines" >> _magazine >> "displayName"),
                getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName")], 3, _unit] call EFUNC(common,displayTextStructured);
            
            REARM_SUCCESS
        };
        _target removeMagazineTurret [_magazine, _turretPath];
        _numMagazines = _numMagazines - 1;
    };
};