#include "script_component.hpp"

ctrlSetText [1000, (GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 0];
if (GVAR(ATragMX_currentUnit) == 1) then
{
	ctrlSetText [ 100, Str(Round(((GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 5) / 2.54 * 100) / 100)];
} else
{
	ctrlSetText [ 100, Str(Round(((GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 5) * 100) / 100)];
};
if (GVAR(ATragMX_currentUnit) == 1) then
{
	ctrlSetText [ 110, Str(Round(((GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 12) * 15.4323584))];
} else
{
	ctrlSetText [ 110, Str(Round((GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 12))];
};
if (AdvancedBallistics && AB_AdvancedAirDragEnabled) then {
	ctrlSetText [ 120, Str(Round(((GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 15) * 1000) / 1000)];
} else {
	ctrlSetText [ 120, Str(Round(((GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 4) * -1000 * 1000) / 1000)];
};
if (GVAR(ATragMX_currentUnit) == 1) then
{
	ctrlSetText [130, Str(Round(((GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 1) * 3.2808399))];
} else
{
	ctrlSetText [130, Str(Round((GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 1))];
};
if (GVAR(ATragMX_currentUnit) == 2) then
{
	ctrlSetText [140, Str(Round((GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 2))];
} else
{
	ctrlSetText [140, Str(Round(((GVAR(ATragMX_workingMemory) select GVAR(ATragMX_currentTarget)) select 2) * 1.0936133))];
};

call compile preprocessFile ("\atragmx\fnc_update_scope_unit.sqf");
