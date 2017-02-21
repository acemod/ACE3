#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"acex_main"};
        author = ACECSTRING(common,ACETeam);
        authors[] = {"Kingsley"};
        url = ACECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "ACE_Settings.hpp"
#include "CfgVehicles.hpp"
