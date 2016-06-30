#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgMoves.hpp"
#include "CfgRecoils.hpp"

class CfgCameraShake {
    // What does this do, really? It seems like the engine no longer respects it.
    defaultCaliberCoefWeaponFire = 0;
};
