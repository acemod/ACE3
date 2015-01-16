
#include "script_component.hpp"

private "_unit";
_unit = _this select 0;
if !(local _unit) exitwith{};
if !(_unit getvariable[QGVAR(addedToUnitLoop),false]) then{
	_unit setvariable [QGVAR(addedToUnitLoop),true];
};

if ([_unit] call FUNC(hasMedicalEnabled_CMS)) then {
	if (isnil QGVAR(injuredUnitCollection)) then {
		GVAR(injuredUnitCollection) = [];
	};
	if (_unit in GVAR(injuredUnitCollection)) exitwith {};
	GVAR(injuredUnitCollection) pushback _unit;
} else
{
	systemChat format["has no medical system enabled: %1",_unit];
}