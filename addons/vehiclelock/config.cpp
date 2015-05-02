#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ace_interaction"};
    author[] = {"PabstMirror", "GieNkoV"};
    authorUrl = "https://github.com/acemod/ACE3";
    VERSION_CONFIG;
  };
};

class ACE_Settings {
    class GVAR(DefaultLockpickStrength) {
        value = 10;
        typeName = "SCALAR";
    };
    class GVAR(LockVehicleInventory) {
        value = 0;
        typeName = "BOOL";
    };    
    class GVAR(VehicleStartingLockState) {
        value = -1;
        typeName = "SCALAR";
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
