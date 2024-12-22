#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Calculates the Full Repair time based on the amount of hitpoints to repair
 *
 * Arguments:
 * 0: Engineer <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * Repair Time <NUMBER>
 *
 * Example:
 * [player, vehicle] call ace_repair_fnc_getFullRepairTime
 *
 * Public: No
 */

params ["_engineer", "_vehicle"];

private _allHitPointsDamage = getAllHitPointsDamage _vehicle;
_allHitPointsDamage params ["_hitPoints", "", "_damageValues"];

private _selectionsToIgnore = _vehicle call FUNC(getSelectionsToIgnore);

private _repairsNeeded = 0;
private _doExtraRepair = false;
{
    if (_x <= 0) then {continue}; // skip hitpoints that don't need repairs
    if (_forEachIndex in _selectionsToIgnore) then { // only add extra repair for ignore hitpoints if they're damaged
        _doExtraRepair = true;
        continue
    };
    _repairsNeeded = _repairsNeeded + ceil (_x / 0.5); // repair is capped at 0.5 in FUNC(doRepair)
} forEach _damageValues;

if (_doExtraRepair) then {
    _repairsNeeded = _repairsNeeded + 1;
};

_repairsNeeded * GVAR(miscRepairTime) * GVAR(timeCoefficientFullRepair) // return
