#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "ace_medical_engine"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2", "Dani (TCVM)"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgSounds.hpp"
#include "ACE_Medical_Treatment_Actions.hpp"
#include "RscTitles.hpp"
