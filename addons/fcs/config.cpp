#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"KoffeinFlummi","BadGuy (simon84)","commy2"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "ACE_UI.hpp"

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

#include "CfgOptics.hpp"

class ACE_Extensions {
    extensions[] += {"ace_fcs"};
};
