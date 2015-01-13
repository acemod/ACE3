/**
 * fn_handleDamage_eh_f.sqf
 * @Descr: Execute the handleDamage Eventhandler
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: NUMBER Returns a number based on output of executed eventhandlers
 * @PublicAPI: false
 */

private ["_vehicle","_allPreInitHandlers","_handle","_totalValue","_cfg","_amountOfHandlers", "_newCfg","_returnValue","_ehCfg", "_fullDamage", "_returnDamage"];
_vehicle = (_this select 0) select 0;
_handle = _this select 1;
if (!local _vehicle) exitwith {};
if (_vehicle isKindOf "CAManBase") then {
	_name = _vehicle getVariable "cse_name";
	if (isNil "_name") then {
		_vehicle setvariable ["cse_name", name _vehicle, true];
	};
};

_eventHandlerName = "cse_f_eventhandler_handleDamage";
_eventHandlerCollection = missionNamespace getvariable _eventHandlerName;
if (isnil "_eventHandlerCollection") then {
	_eventHandlerCollection = [];
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
						if (getText(_ehCfg >> _handle) != "") then {
							_eventHandlerCollection pushBack [(ConfigName _ehCfg), compile getText(_ehCfg >> _handle)];
						};
					};
				};
			};
		};
	}foreach CSE_F_MODULE_OBJ_EH;
	missionNamespace setvariable [_eventHandlerName, _eventHandlerCollection];

	if (isnil "cse_f_eventhandlers_collection") then {
		cse_f_eventhandlers_collection = [];
	};
	cse_f_eventhandlers_collection pushBack _eventHandlerName;
};
_returnDamage = (_this select 0) select 2;
{
	if (_vehicle isKindOf (_x select 0)) then {
		private "_returnValue";
		_returnValue  = (_this select 0) call (_x select 1);
		if (!isnil "_returnValue") then {
			if (typeName _returnValue == typeName 0) then {
				_returnDamage = _returnValue;
			};
		};
	};
}foreach _eventHandlerCollection;

if (typeName _returnDamage == typeName 0) then {
	if (_returnDamage >= 0.9) then {
		if (isnil "CSE_ENABLE_REVIVE_F") then {
			CSE_ENABLE_REVIVE_F = 0;
		};
		if ((CSE_ENABLE_REVIVE_F == 1 && isPlayer _vehicle) || (CSE_ENABLE_REVIVE_F == 2)) then {
			_returnDamage = 0.9;
		};
	};
} else {
	_returnDamage = (_this select 0) select 2;
};
_returnDamage