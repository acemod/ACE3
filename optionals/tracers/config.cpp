#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_ballistics"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"ACE2 Team"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        ACE_expectedModDir = "@ACE Tracers";
        ACE_expectedSteamID = "2202414450";
    };
};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgMagazineWells.hpp"
