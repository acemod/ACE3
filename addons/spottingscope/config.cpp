#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Item_SpottingScope"};
        weapons[] = {"ACE_SpottingScope"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_apl", "ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Rocko", "Scubaman3D", "Ruthberg", "commy2", "p1nga"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgMoves.hpp"
