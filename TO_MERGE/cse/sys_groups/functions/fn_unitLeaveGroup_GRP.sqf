/**
 * fn_unitLeaveGroup_GRP.sqf
 * @Descr: unit leaves current group and joins an empty group.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: true
 */

private ["_unit", "_currentGroup", "_newgroup"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
if (_unit iskindof "CaManBase" && [_unit] call cse_fnc_canInteract) then {
	_currentGroup = group _unit;
	_newgroup = createGroup (side _unit);
	[_unit] joinSilent _newgroup;

	if (count (units _currentGroup) == 0) then {
		deleteGroup _currentGroup;
	};
};