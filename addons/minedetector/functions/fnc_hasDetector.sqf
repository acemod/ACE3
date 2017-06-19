/*
 * Author: Glowbal
 * Check if unit has a mine detector in hands
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Current weapon is a mine detector <BOOLEAN>
 *
 * Example:
 * [ace_player] call ace_minedetector_fnc_hasDetector
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

!(([currentWeapon _unit] call FUNC(getDetectorConfig)) isEqualTo []);
