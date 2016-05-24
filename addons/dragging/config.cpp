#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"Garth 'L-H' de Wet", "commy2"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgMovesBasic.hpp"

class ACE_newEvents {
    medical_onUnconscious = "ace_medical_onUnconscious";
    playerWeaponChanged = "ace_playerWeaponChanged";
    playerVehicleChanged = "ace_playerVehicleChanged";
    playerChanged = "ace_playerChanged";
    setDir = "ace_setDir";
    fixFloating = "ace_fixFloating";
    fixPosition = "ace_fixPosition";
    fixCollision = "ace_fixCollision";
};
