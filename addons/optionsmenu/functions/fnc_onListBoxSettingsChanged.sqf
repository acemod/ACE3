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

private ["_settingsMenu", "_rightDropDownIndex", "_onChangeCode", "_settingIndex", "_settingIndex"];
disableSerialization;
_settingsMenu = uiNamespace getVariable 'ACE_settingsMenu';


_settingIndex =  lbCurSel 200;  //Index of left list
_rightDropDownIndex = lbCurSel 400;  //Index of right drop down

if (_rightDropDownIndex < 0) then {_rightDropDownIndex = 0;};

switch (GVAR(optionMenu_openTab)) do {
case (MENU_TAB_OPTIONS): {
		if ((_settingIndex >= 0) && (_settingIndex < (count GVAR(clientSideOptions)))) then {
			_settingIndex = (GVAR(clientSideOptions) select _settingIndex) select 0;
			[MENU_TAB_OPTIONS, _settingIndex, _rightDropDownIndex] call FUNC(updateSetting);
		};
		[false] call FUNC(settingsMenuUpdateList);
	};
};
