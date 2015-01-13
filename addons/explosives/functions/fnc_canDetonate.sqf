/*
Name: ACE_Explosives_fnc_canDetonate

Author: Garth de Wet (LH)

Description:
Checks if a unit can detonate an explosive

Parameters:
0: OBJECT - unit

Returns:
BOOLEAN - if the unit has explosives and detonators.

Example:
[player] call ACE_Explosives_fnc_canDetonate;
*/
#include "script_component.hpp"
private "_unit";
_unit = _this select 0;

[_unit] call FUNC(hasPlacedExplosives) and {count ([_unit] call FUNC(getDetonators)) > 0}
