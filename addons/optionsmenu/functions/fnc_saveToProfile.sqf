/**
* fnc_saveToProfile.sqf
* @Descr: Save the clientside option to the profile.
* @Author: Glowbal
*
* @Arguments: [name STRING (Name of setting)]
* @Return: BOOL True if saved.
* @PublicAPI: false
*/
#include "script_component.hpp"

private ["_nameSelected", "_saved"];
PARAMS_2(_type,_name);

switch (_type) do {
case (MENU_TAB_OPTIONS): {
		{
			_nameSelected = _x select 0;
			if (_nameSelected == _name) exitwith {
				profileNamespace setvariable [(format ["ace_option_%1", _name]), (_x select 4)];
				_saved = true;
			};
		}foreach GVAR(clientSideOptions);
	};
case (MENU_TAB_COLORS): {
		{
			_nameSelected = _x select 0;
			if (_nameSelected == _name) exitwith {
				profileNamespace setvariable [(format ["ace_color_%1", _name]), (_x select 3)];
				_saved = true;
			};
		}foreach GVAR(clientSideColors);
	};
};

_saved
