/**
 * fn_setUnitGroupLeader_GRP.sqf
 * @Descr: Sets unit as the leader of units group.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: true
 */

private ["_unit","_groupMembers"];
_unit = _this select 0;
if !(_unit isKindOf "CAManBase") exitwith {};

_groupMembers = units group _unit;
{
	if (_x != _unit) then {
		[_x] call cse_fnc_unitLeaveGroup_GRP;
	};
}foreach _groupMembers;

{
	if (_x != _unit) then {
		[_x, _unit] call cse_fnc_unitJoinGroup_GRP;
	};
}foreach _groupMembers;

true;