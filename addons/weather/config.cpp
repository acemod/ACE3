#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"q1184", "Rocko", "esteldunedain", "Ruthberg"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventhandlers.hpp"
#include "CfgWorlds.hpp"
#include "RscTitles.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"
