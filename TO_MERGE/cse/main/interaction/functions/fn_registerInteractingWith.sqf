/**
 * fn_registerInteractingWith.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_target","_prevTarget","_register"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_Param;
_target = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_Param;

if (local _unit) then {
	_prevTarget = [_unit,"cse_interactionTarget"] call cse_fnc_getVariable;
	if (!isNull _prevTarget) then {
		[_unit,_prevTarget] call cse_fnc_unregisterInteractingWith;
		//waituntil {sleep 0.1; !([_unit,_prevTarget] call cse_fnc_isRegisteredInteractingWith)};
	};
	[_unit,"cse_interactionTarget",_target] call cse_fnc_setVariable;
};
if (!local _target) exitwith {
	[_this, "cse_fnc_registerInteractingWith",owner _target, false] spawn BIS_fnc_MP;
};

// local on target !
_register = [_target,"cse_interactionRegister",[]] call cse_fnc_getVariable;
_register pushback _unit;
[_target,"cse_interactionRegister",_register] call cse_fnc_setVariable;