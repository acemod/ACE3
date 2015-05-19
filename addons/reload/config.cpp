#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"commy2","KoffeinFlummi","esteldunedain"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"

#include "CfgMagazines.hpp"

#include "CfgEventHandlers.hpp"

#include "CfgActions.hpp"

#include "RscInGameUI.hpp"

#include "ACE_Settings.hpp"
