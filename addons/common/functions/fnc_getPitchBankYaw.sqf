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
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

(_unit call BIS_fnc_getPitchBank) + [getDir _unit]
