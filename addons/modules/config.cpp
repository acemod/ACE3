#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"Glowbal"};
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };
    class ACE_Module: Module_F {
        class EventHandlers {
            init = QUOTE(_this call DFUNC(moduleInit));
        };
    };
    class ModuleOrdnance_F: Module_F {
        function = "ace_modules_fnc_bi_moduleProjectile";
    };
};

#include "CfgEventHandlers.hpp"
