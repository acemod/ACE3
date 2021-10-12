#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_fastropingSupplyCrate"};
        weapons[] = {"ACE_rope12","ACE_rope15","ACE_rope18","ACE_rope27","ACE_rope36"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction","ace_logistics_rope"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"KoffeinFlummi", "BaerMitUmlaut", "Pokertour"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMoves.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWaypoints.hpp"

