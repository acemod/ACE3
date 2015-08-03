/*
 * Author: KoffeinFlummi
 *
 * Returns [pitch, bank, yaw] for given vehicle in degrees.
 *
 * Arguments:
 * 0: Unit/Vehicle
 *
 * Return Value:
 * [pitch, bank, yaw]
 */
#include "script_component.hpp"

params ["_unit"];

(_unit call BIS_fnc_getPitchBank) + [getDir (_this select 0)]
