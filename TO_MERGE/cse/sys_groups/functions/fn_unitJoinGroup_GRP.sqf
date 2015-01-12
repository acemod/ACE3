/**
 * fn_unitJoinGroup_GRP.sqf
 * @Descr: unit joins target group and removes old group if no members are left.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, target OBJECT]
 * @Return: void
 * @PublicAPI: true
 */

private ["_unit", "_targetUnit", "_currentGroup", "_targetGroup"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_targetUnit = [_this, 1, objNull, [objNull]] call BIS_fnc_Param;

if ([_unit, _targetUnit] call cse_fnc_unitCanJoinTargetGroup_GRP) then {
	_currentGroup = group _unit;
	_targetGroup = group _targetUnit;

	if (_currentGroup != _targetGroup) then {
		[_unit] joinSilent _targetGroup;
		if (count (units _currentGroup) == 0) then {
			deleteGroup _currentGroup;
		};

		[[_unit, _targetUnit],"groupJoined"] call cse_fnc_customEventHandler_F;
	};
};