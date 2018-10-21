#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2","KoffeinFlummi","esteldunedain"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgMagazines.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgActions.hpp"
#include "ACE_Settings.hpp"
#include "ACE_UI.hpp"
