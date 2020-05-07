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
 * [tank2, 0.1] call ace_vehicle_damage_fnc_handleCookoff;
 *
 *
 * Public: No
 */
params ["_vehicle", "_chanceOfFire", "_intensity", ["_injurer", objNull]];

private _alreadyCookingOff = _vehicle getVariable [QGVAR(cookingOff), false];

if (!_alreadyCookingOff && { _chanceOfFire >= random 1 }) exitWith {
    private _fireDetonateChance = [configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(detonationDuringFireProb), "number", 0] call CBA_fnc_getConfigEntry;
    
    private _delayWithSmoke = _chanceOfFire < random 1;
    private _detonateAfterCookoff = (_fireDetonateChance / 4) > random 1;

    [QEGVAR(cookOff,cookOff), [_vehicle, _intensity, _injurer, _delayWithSmoke, _fireDetonateChance, _detonateAfterCookoff]] call CBA_fnc_localEvent;
    _vehicle setVariable [QGVAR(cookingOff), true];
    LOG_4("Cooking-off [%1] with a chance-of-fire [%2] - Delayed Smoke | Detonate after cookoff [%3 | %4]",_vehicle,_chanceOfFire,_delayWithSmoke,_detonateAfterCookoff);
    [_vehicle] spawn FUNC(abandon);
    LOG_1("[%1] is on fire is bailing",_vehicle);
    true
};

// Avoid RPT spam
if (_alreadyCookingOff) exitWith { true };

LOG_2("[%1] No Cook-off - Chance of fire [%2]",_vehicle,_chanceOfFire);
false
