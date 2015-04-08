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
    //Time to move a round from one magazine to another
    class GVAR(TimePerAmmo) {
        value = 1.5;
        typeName = "SCALAR";
    };
    //Time to swap between magazines when repacking
    class GVAR(TimePerMagazine) {
        value = 2.0;
        typeName = "SCALAR";
    };
    //Time to relink 2 belts together
    class GVAR(TimePerBeltLink) {
        value = 8.0;
        typeName = "SCALAR";
    };
};
