#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_weather"};
        versionDesc = "ACE Wind Deflection";
        version = VERSION;
        author[] = {$STR_ACE_Common_ACETeam, "Glowbal", "Ruthberg"};
        authorUrl = "http://csemod.com";
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
#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"