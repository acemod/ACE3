/**
 * fn_unitsInGroupLeft_GRP.sqf
 * @Descr: Check if the group has more as one member
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL Returns true if group of unit contains more units as 1
 * @PublicAPI: true
 */

private ["_unit", "_currentGroup", "_newgroup"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
if (_unit iskindof "CaManBase") then {
	(count (units (group _unit)) > 1)
} else {
	false;
};