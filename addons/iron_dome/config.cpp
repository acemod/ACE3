#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        // no point having this system without missile guidance: nothing would happen
        requiredAddons[] = {"ace_common","ace_missileguidance"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Dani (TCVM)"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

