/*
 * Author: GitHawk
 * Rearms a vehicle on the turret owner.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 * 2: Turret Path <ARRAY>
 * 3: Number of magazines <NUMBER>
 * 4: Magazine Classname <STRING>
 * 5: Number of rounds <NUMBER>
 * 6: Pylon Index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player, [-1], 2, "5000Rnd_762x51_Belt", 500, ""] call ace_rearm_fnc_rearmSuccessLocal
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_unit", "_turretPath", "_numMagazines", "_magazineClass", "_numRounds", "_pylon"];
TRACE_7("rearmSuccessLocal",_vehicle,_unit,_turretPath,_numMagazines,_magazineClass,_numRounds,_pylon);

private _rounds = getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "count");

if (_pylon > 0) exitWith {
    if (_turretPath isEqualTo [-1]) then {_turretPath = [];}; // Convert back to pylon turret format
    private _currentCount = _vehicle ammoOnPylon _pylon;
    private _newCount = ((_currentCount max 0) + _numRounds) min _rounds;
    TRACE_2("",_pylon,_magazineClass,_newCount);
    _vehicle setPylonLoadOut [_pylon, _magazineClass, false, _turretPath];
    _vehicle setAmmoOnPylon [_pylon, _newCount];
};

private _currentRounds = 0;
private _maxMagazines = [_vehicle, _turretPath, _magazineClass] call FUNC(getMaxMagazines);

if (_maxMagazines == 1) then {
    private _currentMagazines = { _x == _magazineClass } count (_vehicle magazinesTurret _turretPath);
    if (_currentMagazines == 0 && {!(_turretPath isEqualTo [-1])}) then {
        // Driver gun will always retain it's magazines
        _vehicle addMagazineTurret [_magazineClass, _turretPath];
        _vehicle setMagazineTurretAmmo [_magazineClass, 0, _turretPath];
    };
    if (GVAR(level) == 1) then {
        // Fill magazine completely
        _vehicle setMagazineTurretAmmo [_magazineClass, _rounds, _turretPath];
        [QEGVAR(common,displayTextStructured), [[LSTRING(Hint_RearmedTriple), _rounds,
            getText(configFile >> "CfgMagazines" >> _magazineClass >> "displayName"),
            getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")], 3, _unit], [_unit]] call CBA_fnc_targetEvent;
    } else {
        // Fill only at most _numRounds
        _vehicle setMagazineTurretAmmo [_magazineClass, ((_vehicle magazineTurretAmmo [_magazineClass, _turretPath]) + _numRounds) min _rounds, _turretPath];
        [QEGVAR(common,displayTextStructured), [[LSTRING(Hint_RearmedTriple), _numRounds,
            getText(configFile >> "CfgMagazines" >> _magazineClass >> "displayName"),
            getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")], 3, _unit], [_unit]] call CBA_fnc_targetEvent;
    };
} else {
    for "_idx" from 1 to (_maxMagazines+1) do {
        _currentRounds = _vehicle magazineTurretAmmo [_magazineClass, _turretPath];
        if (_currentRounds > 0 || {_idx == (_maxMagazines+1)}) exitWith {
            if (_idx == (_maxMagazines+1) && {!(_turretPath isEqualTo [-1])}) then {
                _vehicle addMagazineTurret [_magazineClass, _turretPath];
            };
            if (GVAR(level) == 2) then {
                //hint format ["Target: %1\nTurretPath: %2\nNumMagazines: %3\nMaxMagazines %4\nMagazine: %5\nNumRounds: %6\nMagazine: %7", _vehicle, _turretPath, _numMagazines, _maxMagazines, _currentRounds, _numRounds, _magazineClass];
                // Fill only at most _numRounds
                if ((_currentRounds + _numRounds) > _rounds) then {
                    _vehicle setMagazineTurretAmmo [_magazineClass, _rounds, _turretPath];
                    if (_numMagazines  < _maxMagazines) then {
                        _vehicle addMagazineTurret [_magazineClass, _turretPath];
                        _vehicle setMagazineTurretAmmo [_magazineClass, _currentRounds + _numRounds - _rounds, _turretPath];
                    };
                } else {
                    _vehicle setMagazineTurretAmmo [_magazineClass, _currentRounds + _numRounds, _turretPath];
                };
                [QEGVAR(common,displayTextStructured), [[LSTRING(Hint_RearmedTriple), _numRounds,
                    getText(configFile >> "CfgMagazines" >> _magazineClass >> "displayName"),
                    getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")], 3, _unit], [_unit]] call CBA_fnc_targetEvent;
            } else {
                // Fill current magazine completely and fill next magazine partially
                _vehicle setMagazineTurretAmmo [_magazineClass, _rounds, _turretPath];
                if (_numMagazines  < _maxMagazines) then {
                    _vehicle addMagazineTurret [_magazineClass, _turretPath];
                    _vehicle setMagazineTurretAmmo [_magazineClass, _currentRounds, _turretPath];
                };
                [QEGVAR(common,displayTextStructured), [[LSTRING(Hint_RearmedTriple), _rounds,
                    getText(configFile >> "CfgMagazines" >> _magazineClass >> "displayName"),
                    getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")], 3, _unit], [_unit]] call CBA_fnc_targetEvent;
            };
        };
        _vehicle removeMagazineTurret [_magazineClass, _turretPath];
        _numMagazines = _numMagazines - 1;
    };
};
