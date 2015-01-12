/*
  Author(s):
    bux578
*/

0 spawn {
  private ["_side"];
  
  waitUntil {sleep 0.5; AGM_SwitchUnits_EnableSwitchUnits};
  
  //_side = [west, east, independent, civilian] select AGM_SwitchUnits_SwitchUnitsAllowedForSide;
  
  _sides = [];
  
  if(AGM_SwitchUnits_SwitchToWest) then {_sides pushBack west};
  if(AGM_SwitchUnits_SwitchToEast) then {_sides pushBack east};
  if(AGM_SwitchUnits_SwitchToIndependent) then {_sides pushBack independent};
  if(AGM_SwitchUnits_SwitchToCivilian) then {_sides pushBack civilian};
  
  if (player getVariable ["AGM_CanSwitchUnits", false]) then {
    [player, _sides] call AGM_SwitchUnits_fnc_initPlayer;
  };
};
