#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {QXGVAR(setupModule), QXGVAR(buildLocationModule)};
        weapons[] = {"ACE_Fortify", "ACE_FortifyToken"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Kingsley"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };

    BWC_CONFIG(XADDON);
};

#include "Cfg3DEN.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

#include "ACEX_Fortify_Presets.hpp"
