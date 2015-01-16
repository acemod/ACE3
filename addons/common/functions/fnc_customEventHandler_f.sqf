/**
 * fn_customEventHandler_f.sqf
 * @Descr: Execute a custom defined eventhandler.
 * @Author: Glowbal
 *
 * @Arguments: [arguments ANY, handle STRING (The name of the eventhandler)]
 * @Return: ARRAY Array containing the results of the called eventhandlers.
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_arguments","_handle","_ehCfg","_eventHandlerCollection","_eventHandlerName","_cfg","_code","_classType", "_return"];
_arguments = _this select 0;
_handle = _this select 1;

// TODO figure out how we want to handle custom eventhandlers

_eventHandlerName = (QGVAR(f_custom_eventhandlers_) + _handle);
_eventHandlerCollection = missionNamespace getvariable _eventHandlerName;
if (isnil "_eventHandlerCollection") then {
	_eventHandlerCollection = [];
	[format["caching Custom Eventhandler: %1",_handle]] call FUNC(debug);
	_cfg = (ConfigFile >> "ACE_Eventhandlers" >> "CustomEventHandlers" >> _handle);
	if (isClass _cfg) then {
		_numberOfEH = count _cfg;

		for "_EHiterator" from 0 to (_numberOfEH -1) /* step +1 */ do {
		//for [{_EHiterator=0}, {(_EHiterator< _numberOfEH)}, {_EHiterator=_EHiterator+1}] do {
			_ehCfg = _cfg select _EHiterator;
			if (isClass _ehCfg) then {
				_classType = (ConfigName _ehCfg);
				_code = (compile getText(_ehCfg >> "onCall"));
				_eventHandlerCollection pushback [_classType, _code];
				true;
			};
		};
	};

	_cfg = (MissionConfigFile >> "ACE_Eventhandlers" >> "CustomEventHandlers" >> _handle);
	if (isClass _cfg) then {
		_numberOfEH = count _cfg;
		for "_EHiterator" from 0 to (_numberOfEH -1) /* step +1 */ do {
		//for [{_EHiterator=0}, {(_EHiterator< _numberOfEH)}, {_EHiterator=_EHiterator+1}] do {
			_ehCfg = _cfg select _EHiterator;
			if (isClass _ehCfg) then {
				_classType = (ConfigName _ehCfg);
				_code = (compile getText(_ehCfg >> "onCall"));
				_eventHandlerCollection pushback [_classType, _code];
				true;
			};
		};
	};

	missionNamespace setvariable [_eventHandlerName, _eventHandlerCollection];
	[format["Custom Eventhandler: %1 cache: %2",_handle, _eventHandlerCollection]] call FUNC(debug);
};

_return = [];
{
	_return pushback (_arguments call (_x select 1));
}foreach _eventHandlerCollection;

_return