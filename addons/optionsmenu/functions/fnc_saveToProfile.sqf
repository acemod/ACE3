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

_typeString = "";
_collection = [];
switch (_type) do {
case (MENU_TAB_OPTIONS): {
		_typeString = "option";
		_collection = GVAR(clientSideOptions);
	};
case (MENU_TAB_COLORS): {
		_typeString = "color";
		_collection = [];
	};
};

_saved = false;
{
	_nameSelected = _x select 0;
	if (_nameSelected == _name) exitwith {
		profileNamespace setvariable [(format ["ace_%1_%2", _typeString, _name]), (_x select 4)];
		_saved = true;
	};
}foreach GVAR(clientSideOptions);

_saved
