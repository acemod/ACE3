#include "script_component.hpp"
/*
 * Author: GhostIsSpooky, based on ace_medical_treatment_fnc_getHealTime
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
_allHitPointsDamage params ["_hitPoints", "_selections", "_damageValues"];
private _postRepairDamageMin = ([_engineer] call FUNC(getPostRepairDamage)) max 0.5; // single repair is capped at 0.5 in doRepair
private _isNearFacility = [_engineer] call FUNC(isInRepairFacility) || {[_engineer] call FUNC(isNearRepairVehicle)};

// get hitpoints of wheels with their selections
([_vehicle] call FUNC(getWheelHitPointsWithSelections)) params ["_wheelHitPoints", "_wheelHitSelections"];

private _hitPointsToIgnore = [_vehicle] call FUNC(getHitPointsToIgnore);

private _repairsNeeded = 0;
{
    private _damage = _damageValues select _forEachIndex;
    private _hitPoint = toLower (_hitPoints select _forEachIndex);
    if (_hitPoint in _hitPointsToIgnore) then { continue };
    _repairsNeeded = _repairsNeeded + ceil (_damage / (1 - _postRepairDamageMin));
} forEach _selections;

// time for a repair for ignored hitpoints + actual repairs * time
(GVAR(miscRepairTime) + _repairsNeeded * GVAR(miscRepairTime))
