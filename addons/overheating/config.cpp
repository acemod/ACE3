#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_SpareBarrel"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"commy2", "KoffeinFlummi", "esteldunedain"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgSounds.hpp"

#include "CfgVehicles.hpp"

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