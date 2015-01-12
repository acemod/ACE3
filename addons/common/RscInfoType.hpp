
class RscInGameUI {
  class RscUnitInfo;
  class RscUnitInfoSoldier: RscUnitInfo {
    onLoad = "uiNamespace setVariable ['ACE_dlgSoldier',   _this select 0]; {_this call _x} forEach ((missionNamespace getVariable ['ACE_onLoadInfoSoldier',   [-1, [], []]]) select 2); {_this call _x} forEach ((missionNamespace getVariable ['ACE_onLoadInfoAny', [-1, [], []]]) select 2); [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
  };
  class RscUnitInfoTank: RscUnitInfo {
    onLoad = "uiNamespace setVariable ['ACE_dlgVehicle',   _this select 0]; {_this call _x} forEach ((missionNamespace getVariable ['ACE_onLoadInfoVehicle',   [-1, [], []]]) select 2); {_this call _x} forEach ((missionNamespace getVariable ['ACE_onLoadInfoAny', [-1, [], []]]) select 2); [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
  };
  class RscUnitInfoAir: RscUnitInfo {
    onLoad = "uiNamespace setVariable ['ACE_dlgAircraft',  _this select 0]; {_this call _x} forEach ((missionNamespace getVariable ['ACE_onLoadInfoAircraft',  [-1, [], []]]) select 2); {_this call _x} forEach ((missionNamespace getVariable ['ACE_onLoadInfoAny', [-1, [], []]]) select 2); [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
  };
  class RscUnitInfoShip: RscUnitInfo {
    onLoad = "uiNamespace setVariable ['ACE_dlgShip',      _this select 0]; {_this call _x} forEach ((missionNamespace getVariable ['ACE_onLoadInfoShip',      [-1, [], []]]) select 2); {_this call _x} forEach ((missionNamespace getVariable ['ACE_onLoadInfoAny', [-1, [], []]]) select 2); [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
  };
  class RscUnitInfoParachute: RscUnitInfo {
    onLoad = "uiNamespace setVariable ['ACE_dlgParachute', _this select 0]; {_this call _x} forEach ((missionNamespace getVariable ['ACE_onLoadInfoParachute', [-1, [], []]]) select 2); {_this call _x} forEach ((missionNamespace getVariable ['ACE_onLoadInfoAny', [-1, [], []]]) select 2); [""onLoad"",_this,""RscUnitInfo"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""";
  };
};

class RscDisplayInventory {
  onLoad = "[""onLoad"",_this,""RscDisplayInventory"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; {_this call _x} forEach ((missionNamespace getVariable ['ACE_onLoadInventory', [-1, [], []]]) select 2);";
};

class RscDisplayChannel {
  onLoad = QUOTE(_this call GVAR(onLoadRscDisplayChannel));
};
