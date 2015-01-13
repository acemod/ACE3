/**
 * fn_HandleHeal_eh_f.sqf
 * @Descr: Execute the handleHeal Eventhandlers. Is currently bugged due to Arma Engine problem?
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: BOOL Returns true if handleHeal has been fully handled
 * @PublicAPI: false
 */

private ["_vehicle","_allPreInitHandlers","_handle","_totalValue","_cfg","_amountOfHandlers", "_newCfg","_returnValue","_ehCfg"];
_vehicle = (_this select 0) select 1;
_handle = _this select 1;
_allPreInitHandlers = [];

if (!local _vehicle) exitwith {};
if (isnil "CSE_fnc_HandleHeal_EH_F") then {
	CSE_fnc_HandleHeal_EH_F = compile preProcessFileLineNumbers '\cse\cse_f_eh\fn_HandleHeal_EH_F.sqf';
};

if (isnil "CSE_F_MODULE_OBJ_EH") then {
	CSE_F_MODULE_OBJ_EH = [];
};
{

	_cfg = (ConfigFile >> "Combat_Space_Enhancement" >> "CfgModules" >> _x);
	if (isClass _cfg) then {
		if (isClass (_cfg >> "EventHandlers")) then {
			_numberOfEH = count (_cfg >> "EventHandlers");
			for "_j" from 0 to (_numberOfEH -1) /* step +1 */ do {
			//for [{_j=0}, {_j< _numberOfEH}, {_j=_j+1}] do {
				_ehCfg = ((_cfg >> "EventHandlers") select _j);
				if (isClass _ehCfg) then {
					if (_vehicle isKindOf (ConfigName _ehCfg)) then {
						_allPreInitHandlers pushback compile getText(_ehCfg >> _handle);
					};
				};
			};
		};
	};
}foreach CSE_F_MODULE_OBJ_EH;
{
	private ["_returnValue"];
	_returnValue  = (_this select 0) call _x;
}foreach _allPreInitHandlers;
[_allPreInitHandlers] call cse_fnc_debug;

AISFinishHeal [(_this select 0) select 0, (_this select 0) select 1, (_this select 0) select 2];

if (count _allPreInitHandlers > 0) then {
	true;
} else {
	false;
};