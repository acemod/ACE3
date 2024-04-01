#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"esteldunedain","Cyruz","diwako"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};
class CfgAmmo {
    class GrenadeBase; // Reference the base class

    class G_40mm_HE: GrenadeBase {
        // Override the specific parameters here
        cartridge = "FxCartridge_40mm";
        // Other parameters can also be modified if needed
    };
};
#include "CfgEventHandlers.hpp"
