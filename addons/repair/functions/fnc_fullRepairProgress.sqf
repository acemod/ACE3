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

private _allHitPointsDamage = getAllHitPointsDamage _vehicle;
_allHitPointsDamage params ["_hitPoints", "", "_damageValues"];

private _firstDamagedIndex = _damageValues findIf {_x > 0};

// Stop repairing if there are no more damaged hitpoints
if (_firstDamagedIndex == -1) exitWith {false};

// Get amount of needed repairs
private _repairsNeeded = ([_engineer, _vehicle] call FUNC(getFullRepairTime)) / GVAR(miscRepairTime);

// Not enough time has elapsed to repair a hitpoint
if (_totalTime - _elapsedTime > ((_repairsNeeded - 1) * GVAR(miscRepairTime))) exitWith {true};
systemChat format ["Repairing at Time: %1, HitPoint: %2", _elapsedTime, _hitPoints select _firstDamagedIndex];

// Repair the first damaged hitpoint
[_engineer, _vehicle, _firstDamagedIndex] call FUNC(doRepair);

true
