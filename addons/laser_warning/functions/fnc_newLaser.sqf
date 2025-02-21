#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Handles a laser "ping" and forwards it immediately to any handlers
 *
 * Arguments:
 * 0: Source Position (ASL) <ARRAY>
 * 1: Source Direction <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [getPosASL player, [0.707, 0, 0.707]] call ace_laser_warning_fnc_newLaser;
 *
 * Public: No
 */
params ["_sourcePosition", "_sourceDirection"];