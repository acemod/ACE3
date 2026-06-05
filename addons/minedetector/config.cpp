#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {"ACE_VMH3", "ACE_VMM3"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_explosives"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Grey", "Glowbal", "Rocko", "esteldunedain"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Arsenal_Stats.hpp"
#include "ACE_detector.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgAmmo.hpp"
#include "CfgVehicles.hpp"
#include "CfgSounds.hpp"
