/**
 * fn_addModuleEventhandlers_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_entity", "_handle", "_eventHandlerName", "_eventHandlerCollection", "_cfg", "_numberOfEH", "_ehCfg", "_classType", "_text", "_code", "_eventHandlerCollection","_collectedEHIDs", "_collectedID_VarName"];
_entity = _this select 0;
_handle = _this select 1;

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

_collectedID_VarName = format["cse_addModuleEventHandlers_f_%1_ids", _handle];

// clear all module eventhandlers first
_collectedEHIDs = _entity getvariable [_collectedID_VarName, []];
{
	[_entity, _handle, _x] call cse_fnc_removeEventHandler_F;
}foreach _collectedEHIDs;

// now we add the new ones
_collectedEHIDs = [];
{
	if (_entity isKindOf (_x select 0)) then {
		_collectedEHIDs pushback (format["cse_moduleEventhandlerID_", _foreachIndex]);
		[_entity, _handle, format["cse_moduleEventhandlerID_", _foreachIndex], _x select 1] call cse_fnc_setEventhandler_f;
	};
}foreach _eventHandlerCollection;

// Store the new IDs
_entity setvariable [_collectedID_VarName, _collectedEHIDs];