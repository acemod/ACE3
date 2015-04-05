#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ACE_ballistics", "ACE_weather"};
        author[] = {"Ruthberg"};
        authorUrl = "https://github.com/ulteq";
        VERSION_CONFIG;
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
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "RscTitles.hpp"
