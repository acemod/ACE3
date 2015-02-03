/**
* fnc_updateSetting.sqf
* @Descr:
* @Author: Glowbal
*
* @Arguments: []
* @Return:
* @PublicAPI: true
*/
#include "script_component.hpp"

private ["_changed"];
PARAMS_3(_type,_name,_newValue);

_changed = false;

switch (_type) do {
case (MENU_TAB_OPTIONS): {
    {
      if ((_x select 0) == _name) then {

        if ((_x select 1) == "BOOL") then {
          _newValue = [false, true] select _newValue;
        };

        if !((_x select 7) isEqualTo _newValue) then {
          _changed = true;
          _x set [7, _newValue];
        } ;

      };
    } foreach GVAR(clientSideOptions);
  };
case (MENU_TAB_COLORS): {
    {
      if (((_x select 0) == _name) && {!((_x select 7) isEqualTo _newValue)}) then {
        _changed = true;
        _x set [7, _newValue];
      };
    } foreach GVAR(clientSideColors);
  };
};

if (_changed) then {
  profileNamespace setvariable [_name, _newValue];
  missionNameSpace setVariable [_name, _newValue];
  ["SettingChanged", [_name, _newValue]] call EFUNC(common,localEvent);
  TRACE_2("Variable Updated",_name,_newValue);
};
