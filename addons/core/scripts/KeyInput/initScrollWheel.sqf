// by commy2

GVAR(ScrollWheelFrame) = diag_frameno;

GVAR(onScrollWheel) = {
  _scroll = _this select 1;

  if (GVAR(ScrollWheelFrame) == diag_frameno) exitWith {};
  GVAR(ScrollWheelFrame) = diag_frameno;

  {
    [_scroll] call _x;
  } count ((missionNamespace getVariable ["AGM_EventHandler_ScrollWheel", [-1, [], []]]) select 2);
};
