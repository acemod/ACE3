#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ace_interaction"};
    author[] = {"PabstMirror"};
    authorUrl = "https://github.com/acemod/ACE3";
    VERSION_CONFIG;
  };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

class ACE_newEvents {
    SettingsInitialized = "ace_settingsInitialized";
    VehicleLock_SetVehicleLock = "ace_vehicleLock_SetVehicleLock";
    VehicleLock_SetupCustomKey = "ace_vehicleLock_SetupCustomKey";
};
