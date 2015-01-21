/**
* fnc_onListBoxSettingsChanged.sqf
* @Descr: N/A
* @Author: Glowbal
*
* @Arguments: []
* @Return:
* @PublicAPI: false
*/
#include "script_component.hpp"

private ["_settingsMenu", "_optionSelected", "_onChangeCode", "_selectedSetting", "_nameOfSetting"];
disableSerialization;
_settingsMenu = uiNamespace getVariable 'ACE_settingsMenu';

_optionSelected = lbCurSel 400;
_selectedSetting =  lbCurSel 200;

if (_optionSelected < 0) then {_optionSelected = 0;};

switch (GVAR(optionMenu_openTab)) do {
case (MENU_TAB_OPTIONS): {
		if (_selectedSetting > (count GVAR(clientSideOptions))) then {
			_selectedSetting = (count GVAR(clientSideOptions)) - 1;
		};
		if (_selectedSetting < 0) then {
			_selectedSetting = 0;
		};
		_nameOfSetting = (GVAR(clientSideOptions) select _selectedSetting) select 0;
		[MENU_TAB_OPTIONS, _nameOfSetting, _optionSelected] call FUNC(updateSetting);
		[false] call FUNC(settingsMenuUpdateList);
	};
};
