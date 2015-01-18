#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "ace_main", "ace_common" };
        author[] = {"KoffeinFlummi"};
        authorUrl = "https://github.com/KoffeinFlummi";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgSounds.hpp"

#include "CfgWeapons.hpp"

#include "RscTitles.hpp"
