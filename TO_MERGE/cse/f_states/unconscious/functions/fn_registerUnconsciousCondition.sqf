/**
 * fn_registerUnconsciousCondition.sqf
 * @Descr: Register new condition for the unconscious state. Conditions are not actively checked for units unless unit is in unconscious state.
 * @Author: Glowbal
 *
 * @Arguments: [code CODE]
 * @Return: void
 * @PublicAPI: true
 */


if (isnil "CSE_UNCONSCIOUS_CONDITIONS_F") then {
	CSE_UNCONSCIOUS_CONDITIONS_F = [];
};
if (typeName _this == typeName []) then {
	{
		if (typeName _x == typeName {}) then {
			CSE_UNCONSCIOUS_CONDITIONS_F pushback _x;
		};
	}foreach _this;
} else {
};