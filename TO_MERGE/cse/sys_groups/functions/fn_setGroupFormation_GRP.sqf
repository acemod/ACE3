/**
 * fn_setGroupFormation_GRP.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit", "_formation", "_groupUnits"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_formation = [_this, 1, "", [""]] call BIS_fnc_Param;


if (([_unit] call cse_fnc_canInteract) && (formationLeader _unit == _unit)) then {
	(group _unit) setFormation  _formation;
	[format["Setting formation of group %1 to %2",group _unit, _formation]] call cse_fnc_debug;
} else {
	[format["cant set formation of group %1 to %2 because: %3 %4",group _unit, _formation, ([_unit] call cse_fnc_canInteract), (formationLeader _unit == _unit)]] call cse_fnc_debug;
};