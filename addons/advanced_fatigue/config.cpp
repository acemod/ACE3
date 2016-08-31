#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"BaerMitUmlaut"};
        authorUrl = "https://github.com/BaerMitUmlaut";
        VERSION_CONFIG;
    };
};

#include "CfgEden.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMovesMaleSdr.hpp"
#include "CfgSounds.hpp"
#include "Dialog.hpp"
