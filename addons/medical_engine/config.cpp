#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        skipWhenAnyAddonPresent[] = {"ace_nomedical"}; // requires 2.22
        author = ECSTRING(common,ACETeam);
        authors[] = {"Glowbal","KoffeinFlummi","commy2"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgActions.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgExtendedAnimation.hpp"
#include "CfgFunctions.hpp"
#include "CfgMoves.hpp"
#include "CfgVehicles.hpp"
