#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ACE_common", "ACE_weather"};
        versionDesc = "ACE Advanced Ballistics";
        version = VERSION;
        author[] = {$STR_ACE_Common_ACETeam, "Glowbal", "Ruthberg"};
    };
};

class CfgAddons {
    class PreloadAddons {
       class ADDON {
          list[] = {QUOTE(ADDON)};
       };
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "RscTitles.hpp"