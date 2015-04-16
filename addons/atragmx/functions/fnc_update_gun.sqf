/*
 * Author: Ruthberg
 * Updates all gun column input fields
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_update_gun
 *
 * Public: No
 */
#include "script_component.hpp"

ctrlSetText [1000, GVAR(workingMemory) select 0];
if (GVAR(currentUnit) == 1) then
{
    ctrlSetText [ 100, Str(Round((GVAR(workingMemory) select 5) / 2.54 * 100) / 100)];
} else
{
    ctrlSetText [ 100, Str(Round((GVAR(workingMemory) select 5) * 100) / 100)];
};
if (GVAR(currentUnit) == 1) then
{
    ctrlSetText [ 110, Str(Round((GVAR(workingMemory) select 12) * 15.4323584))];
} else
{
    ctrlSetText [ 110, Str(Round(GVAR(workingMemory) select 12))];
};
if ((missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) && (missionNamespace getVariable [QEGVAR(advanced_ballistics,AdvancedAirDragEnabled), false])) then {
    ctrlSetText [ 120, Str(Round((GVAR(workingMemory) select 15) * 1000) / 1000)];
} else {
    ctrlSetText [ 120, Str(Round((GVAR(workingMemory) select 4) * -1000 * 1000) / 1000)];
};
if (GVAR(currentUnit) == 1) then
{
    ctrlSetText [130, Str(Round((GVAR(workingMemory) select 1) * 3.2808399))];
} else
{
    ctrlSetText [130, Str(Round(GVAR(workingMemory) select 1))];
};
if (GVAR(currentUnit) == 2) then
{
    ctrlSetText [140, Str(Round(GVAR(workingMemory) select 2))];
} else
{
    ctrlSetText [140, Str(Round((GVAR(workingMemory) select 2) * 1.0936133))];
};

[] call FUNC(update_scope_unit);
