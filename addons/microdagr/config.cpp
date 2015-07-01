#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_microDAGR_Item"};
        weapons[] = {"ACE_microDAGR"};
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
#include "ACE_Settings.hpp"
