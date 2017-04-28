#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        VERSION_CONFIG;
    };
};

class CfgMissions {
    class MPMissions {
        class ACETestingMap1 {
            briefingName = "ACE Testing Map 1";
            directory = QUOTE(PATHTO_R(MPMissions\ACETestingMap1.Stratis));
        };
    };
};
