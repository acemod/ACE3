#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_ballistics"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"ACE2 Team"};
        PBO_URL;
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
