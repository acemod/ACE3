#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Checks if the unit carries a flag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Unit is carrying a flag <BOOLEAN>
 *
 * Example:
 * [player] call ace_flags_fnc_isCarryingFlag
 *
 * Public: No
 */

params ["_unit"];

(_unit getVariable [QGVAR(carryingFlag), ""] isNotEqualTo "") &&
{(getForcedFlagTexture _unit) isNotEqualTo ""}
