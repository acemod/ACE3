#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Handles full repair by periodically repairing damaged hitpoints.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Engineer <OBJECT>
 *   1: Vehicle <OBJECT>
 *   2: Hitpoint <STRING> (unused)
 *   3: Repair action classname <STRING>
 * 1: Elapsed Time <NUMBER>
 * 2: Total Time <NUMBER>
 *
 * Return Value:
 * Continue Repair <BOOL>
 *
 * Example:
 * [[objNull, player], 5, 10] call ace_repair_fnc_fullRepairProgress
 *
 * Public: No
 */

params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_engineer", "_vehicle", "", "_action"];

if !((alive _vehicle) && {(abs speed _vehicle) < 1}) exitWith {false}; // make sure vehicle doesn't drive off

// Not enough time has elapsed to repair a hitpoint
if (_totalTime - _elapsedTime > ([_engineer, _vehicle] call FUNC(getFullRepairTime)) - (GVAR(miscRepairTime) * GVAR(timeCoefficientFullRepair))) exitWith {true};

private _allHitPointsDamage = getAllHitPointsDamage _vehicle;
_allHitPointsDamage params ["_hitPoints", "", "_damageValues"];

private _selectionsToIgnore = _vehicle call FUNC(getSelectionsToIgnore);

private _firstDamagedIndex = {
    if (_x > 0 && {!(_forEachIndex in _selectionsToIgnore)}) exitWith {_forEachIndex};
    -1
} forEach _damageValues;

// Stop repairing if there are no more damaged hitpoints
// callBackSuccess to FUNC(doFullRepair) for ignored hitpoints
if (_firstDamagedIndex == -1) exitWith {true};

// Repair the first damaged hitpoint
[_engineer, _vehicle, _firstDamagedIndex, _action] call FUNC(doRepair);

true
