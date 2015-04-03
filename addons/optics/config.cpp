#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_optic_DMS","ACE_optic_Hamr_PIP"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {""};
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgOpticsEffect.hpp"
#include "CfgRscTitles.hpp"
#include "CfgWeapons.hpp"
