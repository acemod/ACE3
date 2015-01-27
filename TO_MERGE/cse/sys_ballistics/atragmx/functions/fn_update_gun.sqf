#include "script_component.hpp"

ctrlSetText [1000, (cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 0];
if (cse_ab_ATragMX_currentUnit == 1) then
{
	ctrlSetText [ 100, Str(Round(((cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 5) / 2.54 * 100) / 100)];
} else
{
	ctrlSetText [ 100, Str(Round(((cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 5) * 100) / 100)];
};
if (cse_ab_ATragMX_currentUnit == 1) then
{
	ctrlSetText [ 110, Str(Round(((cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 12) * 15.4323584))];
} else
{
	ctrlSetText [ 110, Str(Round((cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 12))];
};
if ((["cse_AB_moduleAdvancedBallistics"] call cse_fnc_isModuleEnabled_F) && cse_AB_AdvancedAirDragEnabled) then {
	ctrlSetText [ 120, Str(Round(((cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 15) * 1000) / 1000)];
} else {
	ctrlSetText [ 120, Str(Round(((cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 4) * -1000 * 1000) / 1000)];
};
if (cse_ab_ATragMX_currentUnit == 1) then
{
	ctrlSetText [130, Str(Round(((cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 1) * 3.2808399))];
} else
{
	ctrlSetText [130, Str(Round((cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 1))];
};
if (cse_ab_ATragMX_currentUnit == 2) then
{
	ctrlSetText [140, Str(Round((cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 2))];
} else
{
	ctrlSetText [140, Str(Round(((cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 2) * 1.0936133))];
};

call cse_ab_ATragMX_fnc_update_scope_unit;
