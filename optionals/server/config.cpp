#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"Glowbal"};
        authorUrl = "https://github.com/Glowbal/";
        VERSION_CONFIG;
    };
};

class ACE_ServerSettings {
    #include "\userconfig\ace\serverconfig.hpp"
};
