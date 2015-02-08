#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common","ace_interaction"};
        author[] = {"commy2","CAA-Picard"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"

class ACE_Parameters_Numeric {
    GVAR(TimePerAmmo) = 1.5;
    GVAR(TimePerMagazine) = 2.0;
};
