#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"commy2", "KoffeinFlummi"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"

#include "Effects.hpp"

class ACE_newEvents {
    firedNonPlayer = "ace_firedNonPlayer";
    firedPlayerNonLocal = "ace_firedPlayerNonLocal";
    firedPlayer = "ace_firedPlayer";
    flashbangExplosion = "ace_flashbangExploded";
};
