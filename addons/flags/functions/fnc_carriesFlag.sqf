#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Checks if the unit is carrying a flag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Unit is carrying a flag <BOOLEAN>
 *
 * Example:
 * [player] call ace_flags_fnc_carriesFlag
 *
 * Public: No
 */

params ["_unit"];

(_unit getVariable [QGVAR(carryingFlag), ""] isNotEqualTo "") &&
{(getForcedFlagTexture _unit) isNotEqualTo ""}
