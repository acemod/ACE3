#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {"ACE_IR_Strobe_Item"};
    requiredVersion = 0.60;
    requiredAddons[] = {"ace_common", "ace_interaction"};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi", "eRazeri", "CAA-Picard"};
    authorUrl = "https://github.com/KoffeinFlummi/";
  };
};

#include "CfgEventHandlers.hpp"

#include "CfgVehicles.hpp"

#include "CfgWeapons.hpp"

#include "CfgMagazines.hpp"
