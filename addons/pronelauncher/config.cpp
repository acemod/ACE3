#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"PiZZADOX"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgMovesBasic.hpp"
#include "CfgMovesMaleSdr.hpp"
#include "CfgEventHandlers.hpp"
