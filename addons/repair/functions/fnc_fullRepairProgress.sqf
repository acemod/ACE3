#include "script_component.hpp"
/*
 * Author: GhostIsSpooky, based on ace_medical_treatment_fnc_surgicalKitProgress
 * Handles full repair by periodically repairing damaged hitpoints.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Engineer <OBJECT>
 *   1: Vehicle <OBJECT>
 * 1: Elapsed Time <NUMBER>
 * 2: Total Time <NUMBER>
 *
 * Return Value:
 * Continue Repair <BOOL>
 *
 * Example:
 * [[objNull, player], 5, 10] call ace_repair_fnc_surgicalKitProgress
 *
 * Public: No
 */

params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_engineer", "_vehicle"];

if !((alive _vehicle) && {(abs speed _vehicle) < 1}) exitWith {false}; // make sure vehicle doesn't drive off

private _allHitPointsDamage = getAllHitPointsDamage _vehicle;
_allHitPointsDamage params ["_hitPoints", "", "_damageValues"];

private _hitPointsToIgnore = [_vehicle] call FUNC(getHitPointsToIgnore);

private _firstDamagedIndex = {
    private _hitPoint = _hitPoints select _forEachIndex;
    if (_x > 0 && {!(_hitPoint in _hitPointsToIgnore)}) exitWith { _forEachIndex };
    -1
} forEach _damageValues;

// Stop repairing if there are no more damaged hitpoints
// callBackSuccess to FUNC(doFullRepair) for ignored hitpoints
if (_firstDamagedIndex == -1) exitWith {true};
private _isNearFacility = [_engineer] call FUNC(isInRepairFacility) || {[_engineer] call FUNC(isNearRepairVehicle)};
private _timeToRepair = ([_engineer, _vehicle] call FUNC(getFullRepairTime)) - (GVAR(miscRepairTime) / ([1, GVAR(fullRepairFacilitySpeed)] select _isNearFacility));

// Not enough time has elapsed to repair a hitpoint
if (_totalTime - _elapsedTime > _timeToRepair) exitWith {true};

// Repair the first damaged hitpoint
[_engineer, _vehicle, _firstDamagedIndex, "FullRepair"] call FUNC(doRepair);

true
