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
 * 3: Trigger Item Classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, -1, [[c4,0.5]], "ACE_Clacker"] call ACE_Explosives_fnc_detonateExplosiveAll;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_range", "_explosivesList", "_triggerClassname"];
TRACE_4("Params",_unit,_range,_explosivesList,_triggerClassname);

{
    [_unit,_range,_x,_triggerClassname] call FUNC(detonateExplosive);
} forEach _explosivesList;
