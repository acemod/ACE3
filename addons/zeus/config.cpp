#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {
            QGVAR(moduleCapture),
        	QGVAR(moduleKnockout),
            QGVAR(moduleSurrender)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"SilentSpike"};
        authorUrl = "https://github.com/SilentSpike";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"
