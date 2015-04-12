#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Item_Kestrel"};
        weapons[] = {"ACE_Kestrel"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"Falke","commy2","KoffeinFlummi","esteldunedain"};
        authorUrl = "https://github.com/KoffeinFlummi/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscTitles.hpp"
