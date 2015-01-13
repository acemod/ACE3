/**
 * fn_unitCanJoinTargetGroup_GRP.sqf
 * @Descr: Check if a unit can join the target group
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, target OBJECT]
 * @Return: BOOL True if unit can join the targets group
 * @PublicAPI: true
 */

private ["_unit", "_targetUnit", "_currentGroup", "_targetGroup", "_return"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_targetUnit = [_this, 1, objNull, [objNull]] call BIS_fnc_Param;

_return = false;
if (_unit != _targetUnit) then {
	if (_unit iskindof "CaManBase" && (_targetUnit isKindOf "CAManBase")) then {
		if (side _unit == side _targetUnit) then {
			_currentGroup = group _unit;
			_targetGroup = group _targetUnit;
			if (_currentGroup != _targetGroup) then {
				_return = true
			};
		};
	};
};
_return