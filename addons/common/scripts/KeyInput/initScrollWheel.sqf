// by commy2
#include "\z\ace\addons\common\script_component.hpp"

GVAR(ScrollWheelFrame) = diag_frameno;

GVAR(onScrollWheel) = {
  _scroll = _this select 1;

  if (GVAR(ScrollWheelFrame) == diag_frameno) exitWith {};
  GVAR(ScrollWheelFrame) = diag_frameno;

  {
    [_scroll] call _x;
  } count ((missionNamespace getVariable ["ACE_EventHandler_ScrollWheel", [-1, [], []]]) select 2);
};
