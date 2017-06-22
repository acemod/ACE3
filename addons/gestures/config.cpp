#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interact_menu"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"joko // Jonas", "Emperias", "Zigomarvin"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgMovesBasic.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
