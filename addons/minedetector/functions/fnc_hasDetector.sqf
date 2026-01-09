#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Checks if the unit has a mine detector.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Detector type <STRING> (default: currentWeapon Unit)
 *
 * Return Value:
 * Current weapon is a mine detector <BOOL>
 *
 * Example:
 * player call ace_minedetector_fnc_hasDetector
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

((param [1, currentWeapon _unit, [""]]) call FUNC(getDetectorConfig)) isNotEqualTo [] // return
