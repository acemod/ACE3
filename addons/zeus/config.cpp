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
};

#include "CfgEventHandlers.hpp"

class CfgVehicles {
    class Module_F;
    class ModuleCurator_F: Module_F {
        function = QUOTE(FUNC(bi_moduleCurator));
    };
};