/**
 * fn_initalizeModuleObjEH.sqf
 * @Descr: initalize module Object init Eventhandlers. DEPRICATED. DO NOT USE.
 * @Author: Glowbal
 *
 * @Arguments: [object OBJECT, eventhandler STRING]
 * @Return: void
 * @PublicAPI: false
 */


private ["_entity","_handle","_cfg","_ehCfg","_numberOfEH"];
_entity = (_this select 0) select 0;
_handle = _this select 1;

if (!local _entity) exitwith{};
if (isnil "cse_postInit") then {
_this spawn {
	private ["_entity"];
	_entity = (_this select 0) select 0;
	_handle = _this select 1;
	waituntil{(!isnil 'cse_postInit')};
	{
		_cfg = (ConfigFile >> "Combat_Space_Enhancement" >> "CfgModules" >> _x);
		if (isClass _cfg) then {
			if (isClass (_cfg >> "EventHandlers")) then {
				_numberOfEH = count (_cfg >> "EventHandlers");
				for [{_j=0}, {_j< _numberOfEH}, {_j=_j+1}] do {
					_ehCfg = ((_cfg >> "EventHandlers") select _j);
					if (isClass _ehCfg) then {
						if (_entity isKindOf (ConfigName _ehCfg)) then {
							(_this select 0) call (compile getText(_ehCfg >> _handle));
						};
					};
				};
			};
		};
	}foreach (call cse_fnc_getModules);
};
} else {

	if (!local _entity) exitwith{};
	{
		_cfg = (ConfigFile >> "Combat_Space_Enhancement" >> "CfgModules" >> _x);
		if (isClass _cfg) then {
			if (isClass (_cfg >> "EventHandlers")) then {
				_numberOfEH = count (_cfg >> "EventHandlers");
				for [{_j=0}, {_j< _numberOfEH}, {_j=_j+1}] do {
					_ehCfg = ((_cfg >> "EventHandlers") select _j);
					if (isClass _ehCfg) then {
						if (_entity isKindOf (ConfigName _ehCfg)) then {
							(_this select 0) call (compile getText(_ehCfg >> _handle));
						};
					};
				};
			};
		};
	}foreach (call cse_fnc_getModules);
};