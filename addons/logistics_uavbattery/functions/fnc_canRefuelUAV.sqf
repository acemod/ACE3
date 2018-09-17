#include "script_component.hpp"
/*
 * Author: marc_book
 * Tests if unit can refuel the target UAV
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: UAV <OBJECT>
 *
 * Return Value:
 * Can the player rechange the UAV <BOOL>
 *
 * Example:
 * [player, theUAV] call ace_logistics_uavbattery_fnc_canRefuelUAV
 *
 * Public: No
 */

params ["_caller", "_target"];

("ACE_UAVBattery" in (_caller call EFUNC(common,uniqueItems))) && {(fuel _target) < 1} && {(speed _target) < 1} && {!(isEngineOn _target)} && {(_target distance _caller) <= 4}
