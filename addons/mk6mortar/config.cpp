#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"PabstMirror"};
        authorUrl = "https://github.com/acemod";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscInGameUI.hpp"

class ACE_Settings {
    class GVAR(useMils) {
        value = 1;
        typeName = "BOOL";
        isClientSetable = 1;
        displayName = "$STR_ACE_mk6mortar_useMils";
    };
    class GVAR(airResistanceEnabled) {
        value = 0;
        typeName = "BOOL";
        isClientSetable = 0;
    };
    class GVAR(disableComputerRangefinder) {
        value = 0;
        typeName = "BOOL";
        isClientSetable = 0;
    };
};
