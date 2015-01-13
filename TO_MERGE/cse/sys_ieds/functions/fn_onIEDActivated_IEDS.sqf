/**
 * fn_onIEDActivated_IEDS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_logic","_chain","_iedLogic", "_trigger", "_getMasterIED"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;


_getMasterIED = {
	if (_logic getvariable ["cse_subclass_IED",false]) then {
		_logic = _logic getvariable ["cse_controlledBy_IED",_logic];
		if (_logic getvariable ["cse_subclass_IED",false]) then {
			call _getMasterIED;
		};
	};
};
call _getMasterIED;

_chain = _logic getvariable ["cse_iedCollection",[]];
_chain pushback _logic;
{
	private ["_ied", "_trigger"];
	_iedLogic = _x;
	_trigger = _iedLogic getvariable ["cse_linkedIED_IEDS", objNull];
	[_iedLogic,_trigger, _logic] spawn {
		_iedLogic = _this select 0;
		_trigger = _this select 1;
		_master = _this select 2;
		if (!isNull _trigger) then {
			if (random(1)>0.5 && (_iedLogic != _master)) then {
				uisleep (random(2));
			};
			//(_iedLogic getvariable ["explosiveType","R_60mm_HE"]) createVehicle (getPos _iedLogic);
			deleteVehicle _iedLogic;
			_trigger setDamage 1;
		};
	};
}foreach _chain;

[format["%1 is triggering ied chain: %1",_logic, _chain]] call cse_fnc_debug;