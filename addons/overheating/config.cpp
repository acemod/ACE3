#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2", "KoffeinFlummi", "esteldunedain"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgSounds.hpp"

#include "CfgVehicles.hpp"

#include "CfgMagazines.hpp"

#include "CfgWeapons.hpp"

#include "ACE_Settings.hpp"

class CfgMovesBasic {
    class ManActions {
        GVAR(GestureMountMuzzle) = QGVAR(GestureMountMuzzle);
        GVAR(GestureDismountMuzzle) = QGVAR(GestureDismountMuzzle);
    };

    class Actions {
        class NoActions: ManActions {
            GVAR(GestureMountMuzzle)[] = {QGVAR(GestureMountMuzzle), "Gesture"};
            GVAR(GestureDismountMuzzle)[] = {QGVAR(GestureDismountMuzzle), "Gesture"};
        };
    };
};

class CfgGesturesMale {
    class States {
        class GestureMountMuzzle;
        class GVAR(GestureMountMuzzle): GestureMountMuzzle {
            speed = 0.3;
        };
        class GestureDismountMuzzle;
        class GVAR(GestureDismountMuzzle): GestureDismountMuzzle {
            speed = 0.3;
        };
    };
};
