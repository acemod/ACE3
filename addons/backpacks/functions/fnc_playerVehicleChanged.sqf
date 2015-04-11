#include "script_component.hpp"

private ["_unit", "_holder"];

_unit = _this select 0;
_holder = _unit getVariable "ACE_Backpack" select 0;

if (vehicle _unit != _unit) then {
	if (vehicle _unit isKindOf "ParachuteBase") then {
		_holder attachTo [vehicle _unit, [-0.12,0.65,-0.15]];
		_holder setVectorDirAndUp [[0,-0.2,-1],[0,1,0]];
	} else {
		_holder setPos [0, 0, 200];
	};
} else {
	
};