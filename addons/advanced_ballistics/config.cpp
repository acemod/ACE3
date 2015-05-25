#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_ballistics", "ace_weather", "ace_modules"};
        author[] = {"Ruthberg"};
        authorUrl = "https://github.com/ulteq";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "RscTitles.hpp"
#include "ACE_Settings.hpp"

class ACE_Extensions {
    extensions[] += {"ace_advanced_ballistics"};
};
