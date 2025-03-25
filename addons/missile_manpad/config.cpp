#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_missileguidance"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Dani (TCVM)", "PabstMirror"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgSounds.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
