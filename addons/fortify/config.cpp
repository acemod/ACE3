#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {QXGVAR(setupModule), QXGVAR(buildLocationModule)};
        weapons[] = {"ACE_Fortify"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Kingsley"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };

    class XADDON: ADDON {
        units[] = {};
        weapons[] = {};
    };
};

#include "Cfg3DEN.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

#include "ACEX_Fortify_Presets.hpp"
