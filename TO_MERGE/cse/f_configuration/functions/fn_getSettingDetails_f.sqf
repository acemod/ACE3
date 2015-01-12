/**
 * fn_getSettingDetails_f.sqf
 * @Descr: Returns the details of current setting
 * @Author: Glowbal
 *
 * @Arguments: [name STRING, type STRING]
 * @Return: ARRAY Array with the current settings
 * @PublicAPI: false
 */

private ["_name","_type", "_title","_desc", "_return"];
_name = _this select 0;
_type = _this select 1;

_return = [_name,""];
if (isnil "CSE_SETTINGS_MENUS_DETAILS_F") then {
	CSE_SETTINGS_MENUS_DETAILS_F = [];
	CSE_SETTINGS_ACTIONS_DETAILS_F = [];
	CSE_SETTINGS_CLIENTSIDE_DETAILS_F = [];
};

if (_type == "menu") then {
	{
		if (_name == (_x select 0)) exitwith {
			_return = [_x select 1, _x select 2];
		};
	}foreach CSE_SETTINGS_MENUS_DETAILS_F;
} else {
	if (_type == "action") then {
		{
			if (_name == (_x select 0)) exitwith {
				_return = [_x select 1, _x select 2];
			};
		}foreach CSE_SETTINGS_ACTIONS_DETAILS_F;
	} else {
		{
			if (_name == (_x select 0)) exitwith {
				_return = [_x select 1, _x select 2, _x select 3];
			};
		}foreach CSE_SETTINGS_CLIENTSIDE_DETAILS_F;
	};
};

_return