/**
* fnc_resetSettings.sqf
* @Descr:
* @Author: Glowbal
*
* @Arguments: []
* @Return:
* @PublicAPI: true
*/
#include "script_component.hpp"

private ["_type", "_collection", "_default", "_lastSelected"];

{
	_type = _x;
	_collection = [];
	switch (_type) do {
	case (MENU_TAB_OPTIONS): {_collection = GVAR(clientSideOptions);};
	case (MENU_TAB_COLORS): {_collection = GVAR(clientSideColors);};
	};

	{
		_name = _x select 0;
		_default = _x select 5;
		
		systemChat format ["Reseting %1 to %2", _name, _default];
		[_type, _name, _default] call FUNC(updateSetting);
	} forEach _collection;

} forEach [MENU_TAB_OPTIONS, MENU_TAB_COLORS];


_lastSelected = lbCurSel 200;
[GVAR(optionMenu_openTab)] call FUNC(onListBoxShowSelectionChanged);
if (_lastSelected != -1) then {
  lbSetCurSel [200, _lastSelected];
};
