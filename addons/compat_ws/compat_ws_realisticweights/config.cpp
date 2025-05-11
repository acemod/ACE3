#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "data_f_lxWS_Loadorder", "ace_realisticweights"
        };
        skipWhenMissingDependencies = 1;
        author = ECSTRING(common,ACETeam);
        authors[] = {"ThomasAngel"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        addonRootClass = QUOTE(ADDON);
    };
};

#include "CfgWeapons.hpp"
