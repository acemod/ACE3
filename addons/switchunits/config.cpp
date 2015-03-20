#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ace_main", "ace_common"};
    author[] = {"bux578"};
    authorUrl = "https://github.com/bux578/";
    VERSION_CONFIG;
  };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"

class ACE_Settings {
    class GVAR(EnableSwitchUnits) {
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(SwitchToWest) {
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(SwitchToEast) {
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(SwitchToIndependent) {
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(SwitchToCivilian) {
        value = 0;
        typeName = "BOOL";
    };
    class GVAR(EnableSafeZone) {
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(SafeZoneRadius) {
        value = 100;
        typeName = "SCALAR";
    };
};
