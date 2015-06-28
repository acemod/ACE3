#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {QGVAR(ModuleSettings), QGVAR(ModuleSurrender)};
        weapons[] = {"ACE_CableTie"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ACE_Interaction"};
        author[] = {"commy2", "KoffeinFlummi"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMoves.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
