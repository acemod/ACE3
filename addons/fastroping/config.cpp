#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_fastropingSupplyCrate"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction","ace_logistics_rope"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"KoffeinFlummi", "BaerMitUmlaut", "Pokertour", "veteran29"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMoves.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWaypoints.hpp"

