#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"vn_weapons", "vn_emm"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"BaerMitUmlaut", "veteran29"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_CSW_Groups.hpp"
#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgGlasses.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "EMM_mainMenu_CfgMenus.hpp"
