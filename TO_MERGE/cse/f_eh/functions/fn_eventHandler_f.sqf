/**
 * fn_eventHandler_f.sqf
 * @Descr: Execute eventhandlers
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: void
 * @PublicAPI: false
 */

private ["_args","_handle","_entity","_cfgFile","_cfg","_numberOfEH","_ehCfg","_value", "_code", "_eventHandlerCollection", "_classType", "_eventHandlerName"];
_args = _this select 0;
_handle = _this select 1;
_entity = _args select 0;

if (isnil "CSE_F_MODULE_OBJ_EH") then {
	CSE_F_MODULE_OBJ_EH = [];
};

if (!(local _entity) && _handle != "fired") exitwith {};
_eventHandlerName = ("cse_f_eventhandler_" + _handle);

_eventHandlerCollection = missionNamespace getvariable _eventHandlerName;
if (isnil "_eventHandlerCollection") then {
	_eventHandlerCollection = [];
	{
		_cfg = (ConfigFile >> "Combat_Space_Enhancement" >> "CfgModules" >> _x >> "EventHandlers");
		if (isClass (_cfg)) then {
			_numberOfEH = count (_cfg);

			for "_EHiterator" from 0 to (_numberOfEH -1) do {
				_ehCfg = ((_cfg) select _EHiterator);
				if (isClass _ehCfg) then {
					_classType = (ConfigName _ehCfg);
					_text = getText(_ehCfg >> _handle);
					if (_text != "") then {
						_code = (compile _text);
						_eventHandlerCollection pushBack [_classType, _code, _x];
						true;
					};
				};
			};
		};
	}count CSE_F_MODULE_OBJ_EH;
	missionNamespace setvariable [_eventHandlerName, _eventHandlerCollection];
	if (isnil "cse_f_eventhandlers_collection") then {
		cse_f_eventhandlers_collection = [];
	};
	cse_f_eventhandlers_collection pushBack _eventHandlerName;
};

_setHandler = _entity getvariable ("cse_f_setEventhandler_" + _handle);
if (isnil "_setHandler") then {
	{
		if (_entity isKindOf (_x select 0)) then {
			_args call (_x select 1);
		};
		false;
	}count _eventHandlerCollection;
} else {
	{
		_args call (_X select 1);
		false;
	}count _setHandler;
};