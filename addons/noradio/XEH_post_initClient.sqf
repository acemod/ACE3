// by commy2

#include "script_component.hpp"

0 spawn {
  waitUntil {!isNull AGM_player};

  [AGM_player] call AGM_Core_fnc_muteUnit;
  AGM_player setVariable [QGVAR(isMuted), true, true];
};

[missionNamespace, "playerChanged", {
  [_this select 0] call AGM_Core_fnc_muteUnit;
  (_this select 0) setVariable [QGVAR(isMuted), true, true];

  if (!((_this select 1) getVariable ["AGM_isUnconscious", false]) && {alive (_this select 1)}) then {
    [_this select 1] call AGM_Core_fnc_unmuteUnit;
  };
  (_this select 1) setVariable [QGVAR(isMuted), false, true];
}] call AGM_Core_fnc_addCustomEventHandler;
