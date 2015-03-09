// by commy2

#include "script_component.hpp"

EXPLODE_2_PVT(_this,_unit,_isCivilian);

if (isNil "_isCivilian") then {_isCivilian = true};

alive _unit
&& [side _unit != side ACE_player, side group _unit == civilian] select _isCivilian
//&& {count (weapons _unit) == 0}