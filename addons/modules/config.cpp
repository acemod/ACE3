#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_main"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Glowbal"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class CBA_Extended_EventHandlers;
class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };
    class ACE_Module: Module_F {
        class EventHandlers {
            init = QUOTE(_this call DFUNC(moduleInit));
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
};

#include "CfgEventHandlers.hpp"
