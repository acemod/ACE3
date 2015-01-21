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

private ["_settingsMenu", "_ctrlList", "_settingsText", "_color", "_settingsColor", "_updateKeyView"];
DEFAULT_PARAM(0,_updateKeyView,true);

disableSerialization
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
case (MENU_TAB_COLORS): {
    {
      _color = +(_x select 3);
      {
        _color set [_forEachIndex, ((round (_x * 100))/100)];
      } forEach _color;
      _settingsColor = str _color;
      _ctrlList lbadd (_x select 1);
      _ctrlList lbadd (_settingsColor);
      _ctrlList lnbSetColor [[_forEachIndex, 1], (_x select 3)];
    }foreach GVAR(clientSideColors);
  };
};
if (_updateKeyView) then {
  [] call FUNC(settingsMenuUpdateKeyView);
};
