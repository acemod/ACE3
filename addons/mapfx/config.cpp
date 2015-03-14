#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"Rocko","CAA-Picard"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class ACE_Settings {
    class GVAR(mapIllumination) {
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(mapShake) {
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(mapLimitZoom) {
        value = 0;
        typeName = "BOOL";
    };
};