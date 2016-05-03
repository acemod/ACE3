#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {"ACE_Gunbag", "ACE_Gunbag_tan", "ACE_Gunbag_full", "ACE_Gunbag_tan_full"};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ace_interaction"};
    author[] = {"Ir0n1E"};
    VERSION_CONFIG;
  };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
