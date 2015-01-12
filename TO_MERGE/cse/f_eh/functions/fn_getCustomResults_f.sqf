/**
 * fn_getCustomResults_f.sqf
 * @Descr: Executes custom results eventhandlers, collects their output and returns this.
 * @Author: Glowbal
 *
 * @Arguments: [arguments ANY, handle STRING]
 * @Return: ARRAY Collection of all return values of all executed CustomResult handlers
 * @PublicAPI: true
 */


private ["_arguments","_handle","_ehCfg","_eventHandlerCollection","_eventHandlerName","_cfg","_code","_classType", "_return"];
_arguments = _this select 0;
_handle = _this select 1;

_eventHandlerName = ("cse_f_custom_results_eventhandler_" + _handle);
_eventHandlerCollection = missionNamespace getvariable _eventHandlerName;
if (isnil "_eventHandlerCollection") then {
	_eventHandlerCollection = [];

	_cfg = (ConfigFile >> "Combat_Space_Enhancement" >> "CustomResults" >> _handle);
	if (isClass _cfg) then {
		_numberOfEH = count _cfg;
		for [{_EHiterator=0}, {(_EHiterator< _numberOfEH)}, {_EHiterator=_EHiterator+1}] do {
			_ehCfg = _cfg select _EHiterator;
			if (isClass _ehCfg) then {
				_classType = (ConfigName _ehCfg);
				_code = (compile getText(_ehCfg >> "onCall"));
				_eventHandlerCollection set [ count _eventHandlerCollection, [_classType, _code]];
				true;
			};
		};
	};
	missionNamespace setvariable [_eventHandlerName, _eventHandlerCollection];
};

_return = [];
{
	_return set [ count _return, _arguments call (_x select 1) ];
}foreach _eventHandlerCollection;

_return