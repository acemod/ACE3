#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_Item_SpraypaintBlack", "ACE_Item_SpraypaintRed", "ACE_Item_SpraypaintGreen", "ACE_Item_SpraypaintBlue", "ACE_Item_SpraypaintYellow", "ACE_Item_SpraypaintWhite"};
        weapons[] = {"ACE_SpraypaintBlack", "ACE_SpraypaintRed", "ACE_SpraypaintGreen", "ACE_SpraypaintBlue", "ACE_SpraypaintYellow", "ACE_SpraypaintWhite"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"BaerMitUmlaut", "esteldunedain", "Jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "ACE_Tags.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgEden.hpp"
