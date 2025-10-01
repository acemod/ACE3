#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {"ace_xm157_prototype"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_advanced_ballistics", "ace_scopes"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"PabstMirror"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgSounds.hpp"
#include "CfgWeapons.hpp"
#include "RscInGameUI.hpp"

class asdg_OpticRail;
class asdg_OpticRail1913: asdg_OpticRail {
    class compatibleItems {
        ace_xm157_prototype = 1;
    };
};
