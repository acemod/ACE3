/*
 * Author: KoffeinFlummi
 *
 * Returns [pitch, bank, yaw] for given vehicle in degrees.
 *
 * Arguments:
 * 0: Unit/Vehicle<OBJECT>
 *
 * Return Value:
 * 0: pitch
 * 1: bank
 * 2: yaw
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

(_unit call BIS_fnc_getPitchBank) + [getDir _unit]
