/**
 * fn_settingsDefineDetails_f.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_name","_type", "_title","_descr"];
_name = _this select 0;
_type = _this select 1;
_title = _this select 2;
_descr = _this select 3;

if (isnil "CSE_SETTINGS_MENUS_DETAILS_F") then {
	CSE_SETTINGS_MENUS_DETAILS_F = [];
	CSE_SETTINGS_ACTIONS_DETAILS_F = [];
	CSE_SETTINGS_CLIENTSIDE_DETAILS_F = [];
};

if (_type == "menu") then {
	CSE_SETTINGS_MENUS_DETAILS_F pushback [_name, _title, _descr];
} else {
	if (_type == "action") then {
		CSE_SETTINGS_ACTIONS_DETAILS_F pushback [_name, _title, _descr];
	} else {
		if (_type == "option") then {
			CSE_SETTINGS_CLIENTSIDE_DETAILS_F pushback [_name, _title, _descr];
		};
	};
};