#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_moduleAmbianceSound"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"Glowbal", "joko // Jonas", "Exikas"};
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"
