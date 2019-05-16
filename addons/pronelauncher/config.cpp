#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ace_medical",
            "ace_common",
            "ace_main",
            "A3_Anims_F_Config_Sdr",
            "A3_Anims_F_Config_Sdr_WeaponSwitching"
        };
        author = ECSTRING(common,ACETeam);
        authors[] = {"PiZZADOX"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgMovesBasic.hpp"
#include "CfgMovesMaleSdr.hpp"
#include "CfgEventHandlers.hpp"
