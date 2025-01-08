#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        author = ECSTRING(common,ACETeam);
        authors[] = {"OverlordZorn [CVO]"};
        url = ECSTRING(main,URL);

        VERSION_CONFIG;
        requiredVersion = REQUIRED_VERSION;

        requiredAddons[] = {
            "ace_interact_menu",
            "ace_goggles"
        };
        skipWhenMissingDependencies = 1;

        units[] = {};
        weapons[] = {};
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgVehicles.hpp"
#include "CfgSounds.hpp"

#include "Baseclass.hpp"

#include "CfgWardrobe.hpp"
