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
	_name = _x select 0;
	_default = _x select 5;
	[MENU_TAB_OPTIONS, _name, _default] call FUNC(updateSetting);
} forEach GVAR(clientSideOptions);	

{
	_name = _x select 0;
	_default = _x select 4;
	[MENU_TAB_COLORS, _name, _default] call FUNC(updateSetting);
} forEach GVAR(clientSideColors);

_lastSelected = lbCurSel 200;
[GVAR(optionMenu_openTab)] call FUNC(onListBoxShowSelectionChanged);
if (_lastSelected != -1) then {
	lbSetCurSel [200, _lastSelected];
};
