#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"PabstMirror"};
        authorUrl = "https://github.com/PabstMirror/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "gui.hpp"

class ACE_Settings {
    class GVAR(MapDataAvailable) {
        value = 2;
        typeName = "SCALAR";
        isClientSetable = 0;
    };
};
