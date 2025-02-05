#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        addonRootClass = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ace_medical_engine",
            "ace_arsenal"
        };
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "ACE_Arsenal_Stats.hpp"
