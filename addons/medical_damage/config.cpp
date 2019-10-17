#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_medical_engine"};
        author = ECSTRING(common,ACETeam);
        authors[] = {""};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "ACE_Medical_Injuries.hpp"
#include "CfgEventHandlers.hpp"

/*
class ACE_Extensions {
    class ace_medical {
        // Not yet used
    };
};
 */
