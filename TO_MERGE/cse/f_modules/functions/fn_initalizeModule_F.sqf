/**
 * fn_initalizeModule_F.sqf
 * @Descr: Initalize a CSE Module. To be called through the BI A3 Module Framework
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return: void
 * @PublicAPI: true
 */

private ["_moduleName","_arguments","_logic","_units", "_activated","_cfg", "_moduleInfo", "_value", "_typeNameArgument"];
if (count _this > 1) then {
	_moduleName = typeOf (_this select 0);
} else {
	_moduleName = _this select 0;
};
[format["Initalize module: %1 IN QUE",_moduleName], 3] call cse_fnc_debug;
waituntil {(!isnil 'cse_f_modules')};
[format["Initalize module: %1 STARTED",_moduleName], 3] call cse_fnc_debug;

_arguments = [];
if (count _this >1) then {
	_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
	_units = [_this,1,[],[[]]] call BIS_fnc_param;
	_activated = [_this,2,true,[true]] call BIS_fnc_param;
	_moduleName = typeOf _logic;
	_cfg = (ConfigFile >> "CfgVehicles" >> _moduleName >> "Arguments");
	if (isClass _cfg) then {
		for [{_i=0}, {_i < (count _cfg)}, {_i=_i+1}] do {
			if (isClass (_cfg select _i)) then {
				_value = _logic getvariable (ConfigName (_cfg select _i));
				if (!isnil "_value") then {
					_arguments pushback [(ConfigName (_cfg select _i)), _value];
				} else {
					_typeNameArgument = getText ((_cfg select _i) >> "typeName");
					_value = "";
					if (_typeNameArgument != "") then {
						call {
							if (_typeNameArgument == "BOOL") exitwith {
								_value = getNumber((_cfg select _i) >> "defaultValue") == 1;
							};
							if (_typeNameArgument == "NUMBER") exitwith {
								_value = getNumber((_cfg select _i) >> "defaultValue");
							};
							if (_typeNameArgument == "STRING") exitwith {
								_value = getText((_cfg select _i) >> "defaultValue");
							};
						};
						[format["Module Argument has not been set %1 %2. Module need to be replaced. Value used: %4", _moduleName, (ConfigName (_cfg select _i)), _typeNameArgument, _value], 1] call cse_fnc_debug;
						_arguments pushback [(ConfigName (_cfg select _i)), _value];
					};
				};
			};
		};
	};
} else {
	_moduleName = _this select 0;
};
[_moduleName, _arguments] call cse_fnc_enableModule_f;