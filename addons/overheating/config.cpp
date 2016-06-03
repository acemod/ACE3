#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_SpareBarrel"};
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
class ACE_newEvents {
    SettingsInitialized = "ace_settingsInitialized";
    initiateSwapBarrelAssisted = QGVAR(initiateSwapBarrelAssisted);
    showWeaponTemperature = QGVAR(showWeaponTemperature);
    firedPlayerNonLocal = "ace_firedPlayerNonLocal";
    firedPlayer = "ace_firedPlayer";
    spareBarrelsLoadCoolest = QGVAR(spareBarrelsLoadCoolest);
    spareBarrelsSendTemperatureHint = QGVAR(spareBarrelsSendTemperatureHint);
    displayTextStructured = "ace_displayTextStructured";
    weaponJammed = "ace_weaponJammed";
};
