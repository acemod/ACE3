#include "script_component.hpp"

private["_unit", "_local"];
_unit = _this select 0;
_local = _this  select 1;
if (_local) then {
	if (_unit getvariable[QGVAR(addedToUnitLoop),false]) then {
		[_unit] call FUNC(unitLoop_CMS);
	};
};