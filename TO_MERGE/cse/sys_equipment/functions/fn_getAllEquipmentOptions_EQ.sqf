/**
 * fn_getAllEquipmentOptions_EQ.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private["_return"];
_return = [];
if (isnil "CSE_EQUIPMENT_OPTIONS_EQ") then {
	CSE_EQUIPMENT_OPTIONS_EQ = _return;
};
/*
{
	_return set [count _return, _x];
}foreach CSE_EQUIPMENT_OPTIONS_EQ;
*/
_return =  + CSE_EQUIPMENT_OPTIONS_EQ;
_return