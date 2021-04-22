#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_Item_Vector","ACE_Item_VectorDay"};
        weapons[] = {"ACE_Vector","ACE_VectorDay"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Ghost","Hamburger SV","commy2","bux578"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgOpticsEffect.hpp"
#include "RscInGameUI.hpp"

class CBA_PIPItems {
    GVAR(enable) = "-";
};
