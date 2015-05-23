#include "script_component.hpp"

#include "asdgJR_comp.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {
            "ACE_optic_RKSL_LDS_PIP"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"RKSL_LDS"};
        author[]={"da12thMonkey"};
        VERSION_CONFIG;
    };
};

#include "CfgRscTitles.hpp"
#include "CfgWeapons.hpp"