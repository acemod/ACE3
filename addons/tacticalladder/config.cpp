#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_apl", "ace_interaction"};
        author[] = {"Rocko", "Ruthberg"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"

class ACE_newEvents {
    interactMenuOpened = "ace_interactMenuOpened";
    medical_onUnconscious = "ace_medical_onUnconscious";
    playerVehicleChanged = "ace_playerVehicleChanged";
    playerChanged = "ace_playerChanged";
    interactMenuOpened = "ace_interactMenuOpened";
};