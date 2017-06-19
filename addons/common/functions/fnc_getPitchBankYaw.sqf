/*
 * Author: KoffeinFlummi
 * Returns pitch, bank, yaw for given vehicle in degrees.
 *
 * Arguments:
 * 0: Unit/Vehicle <OBJECT>
 *
 * Return Value:
 * 0: pitch <NUMBER>
 * 1: bank <NUMBER>
 * 2: yaw <NUMBER>
 *
 * Example:
 * [plane] call ace_common_fnc_getPitchBankYaw
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_vehicle"];

(_vehicle call BIS_fnc_getPitchBank) + [getDir _vehicle]
