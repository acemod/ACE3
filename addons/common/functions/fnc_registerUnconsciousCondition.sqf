/**
 * fn_registerUnconsciousCondition.sqf
 * @Descr: Register new condition for the unconscious state. Conditions are not actively checked for units unless unit is in unconscious state.
 * @Author: Glowbal
 *
 * @Arguments: [code CODE]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

if (isnil QGVAR(unconsciousConditions_F)) then {
	GVAR(unconsciousConditions_F) = [];
};
if (typeName _this == typeName []) then {
	{
		if (typeName _x == typeName {}) then {
			GVAR(unconsciousConditions_F) pushback _x;
		};
	}foreach _this;
};