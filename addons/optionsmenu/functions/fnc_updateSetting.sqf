/*
 * Author: Glowbal
 * Updates the setting when the client has selected a new value.  Saves to profilenamespace and calls setSetting.
 *
 * Arguments:
 * 0: The Tab Open <NUMBER>
 * 1: The setting's name <STRING>
 * 2: The new value either an index or a color <NUMBER>OR<ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [MENU_TAB_COLORS, "ace_fireTruckColor", [1,0,0,1]] call ACE_optionsmenu_fnc_updateSetting
 *
 * Public: No
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

          if !((_x select 9) isEqualTo _newValue) then {
            _changed = true;
            _x set [9, _newValue];
          } ;

        };
      } foreach GVAR(clientSideOptions);
  };
  case (MENU_TAB_COLORS): {
      {
        if (((_x select 0) == _name) && {!((_x select 9) isEqualTo _newValue)}) then {
          _changed = true;
          _x set [9, _newValue];
        };
      } foreach GVAR(clientSideColors);
  };
  case (MENU_TAB_SERVER_OPTIONS): {
      {
        if ((_x select 0) == _name) then {

          if ((_x select 1) == "BOOL") then {
            _newValue = [false, true] select _newValue;
          };

          if !((_x select 9) isEqualTo _newValue) then {
            _changed = true;
            _x set [9, _newValue];
          } ;

        };
      } foreach GVAR(serverSideOptions);
  };
  case (MENU_TAB_SERVER_COLORS): {
      {
        if (((_x select 0) == _name) && {!((_x select 9) isEqualTo _newValue)}) then {
          _changed = true;
          _x set [9, _newValue];
        };
      } foreach GVAR(serverSideColors);
  };
  case (MENU_TAB_SERVER_VALUES): {
      {
        if (((_x select 0) == _name) && {!((_x select 9) isEqualTo _newValue)}) then {
          _changed = true;
          _x set [9, _newValue];
        };
      } foreach GVAR(serverSideValues);
  };
};

if (_changed) then {
  if (GVAR(serverConfigGeneration) > 0) then {
    if !(isMultiplayer) then {
      missionNamespace setvariable [_name, _newValue];
    };
  } else {
    profileNamespace setVariable [_name, _newValue];
    [_name, _newValue] call EFUNC(common,setSetting);
  };
};
