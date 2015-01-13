/**
 * fn_setArrestState.sqf
 * @Descr: Set a unit in arrest state
 * @Author: Glowbal
 *
 * @Arguments: [unitToBeArrested OBJECT, setArrested BOOL]
 * @Return: void
 * @PublicAPI: true
 */

private ["_unit","_setArrest"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_setArrest = [_this, 1, false, [false]] call BIS_fnc_Param;

if (_setArrest) then {
	[_unit, QGVAR(StateArrested), true] call FUNC(setDefinedVariable);

	if ([_unit] call FUNC(isAwake)) then {
		if (vehicle _unit == _unit) then {
			[_unit,"UnaErcPoslechVelitele2",true] call FUNC(broadcastAnim);
		};
	};
	if (IsPlayer _unit) then {
		[["arrested", true],"FUNC(disableUserInput_f)",_unit,false] call BIS_fnc_MP;
	};
	_unit disableAI "Move";
	_unit disableAI "ANIM";
} else {
	[_unit, QGVAR(StateArrested), false] call FUNC(setDefinedVariable);

	if ([_unit] call FUNC(isAwake)) then {
		if (vehicle _unit == _unit) then {
			[_unit,"",true] call FUNC(broadcastAnim);
		};
		_unit enableAI "Move";
		_unit enableAI "ANIM";
	};
	if (IsPlayer _unit) then {
		[["arrested", false],"FUNC(disableUserInput_f)",_unit,false] call BIS_fnc_MP;
	};
};

[[_unit, _setArrest],"setArrestState"] call FUNC(customEventHandler_F);