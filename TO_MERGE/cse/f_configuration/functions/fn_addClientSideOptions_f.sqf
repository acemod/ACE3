/**
 * fn_addClientSideOptions_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_name", "_possibleValues", "_defaultValue"];
_name = _this select 0;
_possibleValues = _this select 1;
_defaultValue = _this select 2;
_onChange = _this select 3;

if (isnil "CSE_F_CLIENT_SIDE_SETTINGS") then {
	CSE_F_CLIENT_SIDE_SETTINGS = [];
};

// missionNamespace setvariable[_name, _defaultValue];

CSE_F_CLIENT_SIDE_SETTINGS pushBack [ _name, _possibleValues, _defaultValue, _onChange];

[_name, _defaultValue] call _onChange;