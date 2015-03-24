#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"commy2","esteldunedain"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"

class ACE_Settings {
    class GVAR(TimePerAmmo) {
        value = 1.5;
        typeName = "SCALAR";
    };
    class GVAR(TimePerMagazine) {
        value = 2.0;
        typeName = "SCALAR";
    };
};
