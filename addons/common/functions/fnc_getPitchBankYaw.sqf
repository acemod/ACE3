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
 * Public: Yes
 */
#include "script_component.hpp"

private ["_vehicle"];

(_vehicle call BIS_fnc_getPitchBank) + [getDir _vehicle]
