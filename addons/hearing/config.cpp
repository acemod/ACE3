#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {"ACE_EarPlugs"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction", "A3_Characters_F", "A3_Characters_F_Kart"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"KoffeinFlummi", "esteldunedain", "HopeJ", "commy2", "Rocko", "Rommel", "Ruthberg"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgSounds.hpp"
#include "CfgWeapons.hpp"
#include "CfgAmmo.hpp"
#include "ACE_Settings.hpp"
