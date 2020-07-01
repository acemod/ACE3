#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_medical_treatment", "ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Glowbal", "mharis001"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgUIGrids.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "gui.hpp"
