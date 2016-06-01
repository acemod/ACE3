#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2","KoffeinFlummi","Tachii"};
        PBO_URL
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgFatigue.hpp"
//#include "CfgInventoryGlobalVariable.hpp"
#include "CfgMoves.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"
