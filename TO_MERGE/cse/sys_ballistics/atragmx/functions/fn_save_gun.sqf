#include "script_component.hpp"

private ["_index"];
_index = 0 max (lbCurSel 6000);

cse_ab_ATragMX_gunList set [_index, +(cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget)];

lbClear 6000;
{
	lbAdd [6000, _x select 0];
} forEach cse_ab_ATragMX_gunList;

profileNamespace setVariable ["cse_ab_ATragMX_gunList", cse_ab_ATragMX_gunList];
