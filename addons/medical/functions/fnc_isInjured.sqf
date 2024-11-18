#include "..\script_component.hpp"
/*
 * Author: DartRuffian
 * Checks if a unit needs treatment.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Does unit need treatment <BOOL>
 *
 * Example:
 * player call ace_medical_fnc_isInjured
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]]];

if (!alive _unit) exitWith { false };
if (!local _unit) exitWith { ERROR_1("unit [%1] is not local",_unit); };

private _fractures = GET_FRACTURES(_unit);

((_fractures select HITPOINT_INDEX_LARM) == 1) || {(_fractures select HITPOINT_INDEX_RARM) == 1} ||
{_unit call EFUNC(medical_ai,isInjured)}
