#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Checks hitpoint damage and determines if a vehicle should cookoff
 *
 * Arguments:
 * 0: The vehicle
 * 1: Chance of fire
 *
 * Return Value:
 * If cooked off
 *
 * Example:
 * [tank2, 0.1] call ace_vehicleDamage_fnc_handleCookoff;
 *
 *
 * Public: No
 */
params ["_vehicle", "_chanceOfFire", "_intensity"];

private _alreadyCookingOff = _vehicle getVariable [QGVAR(cookingOff), false];
private _alreadyDetonating = _vehicle getVariable [QGVAR(detonating), false];

if (!_alreadyCookingOff && { _chanceOfFire >= random 1 }) exitWith {
    private _fireDetonateChance = [configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(detonationDuringFireProb), "number", 0] call CBA_fnc_getConfigEntry;
    [_vehicle, _intensity, objNull, true, _fireDetonateChance, false] call EFUNC(cookoff,cookOff);
    if (!_alreadyDetonating && { _fireDetonateChance > random 1 }) then {
        [_vehicle, 1] call FUNC(handleDetonation);
        LOG_2("Detonating [%1] while cooking off with a chance of [%2] hit [%3]",_vehicle,_fireDetonateChance);
    };
    _vehicle setVariable [QGVAR(cookingOff), true];
    LOG_2("Cooking-off [%1] with a chance-of-fire [%2] hit [%3]",_vehicle,_chanceOfFire);
    [_vehicle] spawn FUNC(abandon);
    LOG_1("[%1] is on fire is bailing",_vehicle);
    true
};

// Avoid RPT spam
if (_alreadyCookingOff) exitWith { true };

LOG_5("[%1] No Cook-off - Chance of fire [%2]",_vehicle,_chanceOfFire);
false
