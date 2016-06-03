#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMoves.hpp"
#include "CfgVehicles.hpp"

class ACE_newEvents {
    SettingsInitialized = "ace_settingsInitialized";
    SetHandcuffed = QEGVAR(captives,setHandcuffed);
    medical_onUnconscious = "ace_medical_onUnconscious";
};