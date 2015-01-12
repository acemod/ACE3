/**
  * fn_gui_getMenuEntries.sqf
  * @Descr: N/A
  * @Author: Glowbal
  *
  * @Arguments: []
  * @Return:
  * @PublicAPI: false
  */

private ["_menuName","_returningEntries","_MENU_VAR","_cond"];
_menuName = _this select 0;

//[_menuName] call cse_fnc_gui_sortMenuEntries;
// in futute, look into splitting this all up into multiple threads
	_returningEntries = [];

	_MENU_VAR = format["CSE_GUI_MENU_OPTIONS_%1", _menuName];
	if (isnil _MENU_VAR) then {
		call compile format["%1 = [];",_MENU_VAR];
	};

	{

		_cond = (_x select 2);

		if ((typeName _cond) == "CODE") then {
			_passing = ([player,CSE_interactionTarget] call (_x select 2));
			if (typeName _passing != "BOOL") then {
				_passing = false;
			} else {
			};
			if (_passing) then {
				_returningEntries set[count _returningEntries,_x];
			};
		} else {
			if ((typeName _cond) == "BOOL") then {
				if (_cond) then {
					_returningEntries set[count _returningEntries,_x];
				};
			};
		};
	}foreach (call compile _MENU_VAR);

_returningEntries