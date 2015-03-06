/*
 * Author: Glowbal
 * Upidates a setting.
 *
 * Arguments:
 * 0: Type Of setting <NUMBER>
 * 1: Name of setting <STRING>
 * 2: New value <ANY>
 *
 * Return Value:
 * NONE
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

        if !((_x select 8) isEqualTo _newValue) then {
          _changed = true;
          _x set [8, _newValue];
        } ;

      };
    } foreach GVAR(clientSideOptions);
  };
case (MENU_TAB_COLORS): {
    {
      if (((_x select 0) == _name) && {!((_x select 8) isEqualTo _newValue)}) then {
        _changed = true;
        _x set [8, _newValue];
      };
    } foreach GVAR(clientSideColors);
  };
};

if (_changed) then {
  profileNamespace setVariable [_name, _newValue];
  [_name, _newValue] call EFUNC(common,setSetting);
};
