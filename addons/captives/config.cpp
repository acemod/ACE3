#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {QGVAR(ModuleSettings), QGVAR(ModuleSurrender), QGVAR(ModuleHandcuffed)};
        weapons[] = {"ACE_CableTie"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ACE_Interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2", "KoffeinFlummi"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMoves.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgEden.hpp"