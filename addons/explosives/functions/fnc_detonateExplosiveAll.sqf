/*
 * Author: VKing
 * Causes the unit to detonate all passed explosives.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Range (-1 to ignore) <NUMBER>
 * 2: Explosives to detonate <ARRAY>
 *     0: Explosive <OBJECT>
 *     1: Fuse time <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, -1, [[c4,0.5]]] call ACE_Explosives_fnc_detonateExplosiveAll;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_range", "_explosivesList"];
TRACE_3("Params",_unit,_range,_explosivesList);

{
    [_unit,_range,_x] call FUNC(detonateExplosive);
} forEach _explosivesList;
