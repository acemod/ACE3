#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Garth 'L-H' de Wet", "commy2"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgMovesBasic.hpp"

class ACE_newEvents {
    medical_onUnconscious = "ace_unconscious";
    playerWeaponChanged = "ace_playerWeaponChanged";
    playerVehicleChanged = "ace_playerVehicleChanged";
    playerChanged = "ace_playerChanged";
    setDir = "ace_setDir";
    fixFloating = "ace_fixFloating";
    fixPosition = "ace_fixPosition";
    fixCollision = "ace_fixCollision";
};
