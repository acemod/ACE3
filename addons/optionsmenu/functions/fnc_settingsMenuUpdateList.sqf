/**
* fnc_settingsMenuUpdateList.sqf
* @Descr: N/A
* @Author: Glowbal
*
* @Arguments: []
* @Return:
* @PublicAPI: false
*/
#include "script_component.hpp"

private ["_settingsMenu","_ctrlList","_collection","_keyBindingText","_keybinding", "_updateKeyView"];
disableSerialization;

_updateKeyView = [_this, 0, true, [true]] call BIS_fnc_Param;

_settingsMenu = uiNamespace getVariable 'ACE_settingsMenu';
_ctrlList = _settingsMenu displayCtrl 200;
lbclear _ctrlList;

switch (GVAR(optionMenu_openTab)) do {
case (MENU_TAB_OPTIONS): {
		{
			_settingsText = ((_x select 3) select (_x select 4));
			_ctrlList lbadd (_x select 1);
			_ctrlList lbadd (_settingsText);
		}foreach GVAR(clientSideOptions);
	};
};
if (_updateKeyView) then {
	[] call FUNC(settingsMenuUpdateKeyView);
};