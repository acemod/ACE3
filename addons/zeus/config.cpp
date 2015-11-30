#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"SilentSpike"};
        authorUrl = "https://github.com/SilentSpike";
        VERSION_CONFIG;
    };
    // Use additional CfgPatches to contextually remove modules from zeus
    class GVAR(captives): ADDON {
        units[] = {
            QGVAR(moduleCaptive),
            QGVAR(moduleSurrender)
        };
    };
    class GVAR(medical): ADDON {
        units[] = {
            QGVAR(moduleUnconscious),
            QGVAR(moduleSetMedic),
            QGVAR(moduleSetMedicalVehicle),
            QGVAR(moduleSetMedicalFacility)
        };
    };
    class GVAR(cargoAndRepair): ADDON {
        units[] = {
            QGVAR(moduleAddSpareTrack),
            QGVAR(moduleAddSpareWheel)
        };
    };
};

class ACE_Curator {
    GVAR(captives) = "ace_captives";
    GVAR(medical) = "ace_medical";
    GVAR(cargoAndRepair[]) = {"ace_cargo", "ace_repair"};
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"
