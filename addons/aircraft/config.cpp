#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "ace_interact_menu", "ace_rearm"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"KoffeinFlummi", "Crusty", "commy2", "jaynus", "Kimi", "654wak654"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        // this prevents any patched class from requiring this addon
        addonRootClass = "A3_Characters_F";
    };
};

#include "ACE_Settings.hpp"
#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscInGameUI.hpp"
#include "menu.hpp"
