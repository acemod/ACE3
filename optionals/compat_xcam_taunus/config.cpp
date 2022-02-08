#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"xcam_taunus"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"GrueArbre"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "AceAdvancedBallistics.hpp"
