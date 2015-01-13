#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {"ace_main", "ace_common"};
    version = QUOTE(VERSION);
    versionStr = QUOTE(VERSION);
    versionAr[] = {VERSION_AR};
    author[] = {"bux578"};
    authorUrl = "https://github.com/bux578/";
  };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"

class ACE_Parameters_Numeric {
  GVAR(SafeZoneRadius) = 100;
};

class ACE_Parameters_Boolean {
  GVAR(EnableSwitchUnits) = 0;
  GVAR(SwitchToWest) = 0;
  GVAR(SwitchToEast) = 0;
  GVAR(SwitchToIndependent) = 0;
  GVAR(SwitchToCivilian) = 0;
  GVAR(EnableSafeZone) = 1;
};
