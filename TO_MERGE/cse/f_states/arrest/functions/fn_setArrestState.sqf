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
	[_unit, "cse_state_arrested", true] call cse_fnc_setVariable;

	if ([_unit] call cse_fnc_isAwake) then {
		if (vehicle _unit == _unit) then {
			[_unit,"UnaErcPoslechVelitele2",true] call cse_fnc_broadcastAnim;
		};
	};
	if (IsPlayer _unit) then {
		[["arrested", true],"cse_fnc_disableUserInput_f",_unit,false] call BIS_fnc_MP;
	};
	_unit disableAI "Move";
	_unit disableAI "ANIM";
} else {
	[_unit, "cse_state_arrested", false] call cse_fnc_setVariable;

	if ([_unit] call cse_fnc_isAwake) then {
		if (vehicle _unit == _unit) then {
			[_unit,"",true] call cse_fnc_broadcastAnim;
		};
		_unit enableAI "Move";
		_unit enableAI "ANIM";
	};
	if (IsPlayer _unit) then {
		[["arrested", false],"cse_fnc_disableUserInput_f",_unit,false] call BIS_fnc_MP;
	};
};

[[_unit, _setArrest],"setArrestState"] call cse_fnc_customEventHandler_F;