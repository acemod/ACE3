#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ace_common", "ace_interaction"};
    author[] = {"PabstMirror"};
    authorUrl = "https://github.com/PabstMirror/";
    VERSION_CONFIG;
  };
};

class ACE_Parameters_Numeric {
  GVAR(DefaultLockpickStrength) = 10;
};

#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
