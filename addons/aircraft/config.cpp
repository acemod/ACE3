#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"KoffeinFlummi", "Crusty", "commy2", "jaynus", "Kimi", "Alexus", "Zabuza", "sargken"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        // this prevents any patched class from requiring this addon
        addonRootClass = "A3_Characters_F";
    };
};


class CfgFunctions {
    class ADDON {
        class ADDON {
            class gau8_muzzleEffect {
                file = QPATHTOF(functions\fnc_gau8_muzzleEffect.sqf);
            };
        };
    };
};



#include "CfgAmmo.hpp"
#include "CfgCloudlets.hpp"
#include "CfgLights.hpp"
#include "CfgMagazines.hpp"
#include "CfgSoundSets.hpp"
#include "CfgSoundShaders.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "Effects.hpp"
#include "RscInGameUI.hpp"
