#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common","ace_interact_menu"};
        author[] = {"commy2"};
        authorUrl = "https://github.com/commy2";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgVehicleClasses.hpp"
#include "CfgVehicles.hpp"

#include "ACE_Settings.hpp"
#include "ACE_repair.hpp"

class CfgActions {
    class None;
    class Repair: None {
        show = 0;
    };
    class RepairVehicle: None {
        show = 0;
    };
};