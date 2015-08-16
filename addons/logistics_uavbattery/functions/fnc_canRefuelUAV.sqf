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
#include "script_component.hpp"

params ["_caller", "_target"];

("ACE_UAVBattery" in (items _caller)) && {(fuel _target) < 1} && {(speed _target) < 1} && {!(isEngineOn _target)} && {(_target distance _caller) <= 4}
