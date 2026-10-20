#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a unit is injured (bleeding, fractured limbs, low blood, etc).
 * Unit may still require further treatment even if false.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Is unit injured <BOOL>
 *
 * Example:
 * player call ace_medical_fnc_isInjured
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

if (!alive _unit) exitWith { false };

private _fractures = GET_FRACTURES(_unit);

((_fractures select HITPOINT_INDEX_LARM) == 1) || {(_fractures select HITPOINT_INDEX_RARM) == 1} ||
{_unit call EFUNC(medical_ai,isInjured)}
