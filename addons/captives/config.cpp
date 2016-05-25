#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {QGVAR(ModuleSettings), QGVAR(ModuleSurrender), QGVAR(ModuleHandcuffed)};
        weapons[] = {"ACE_CableTie"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ACE_Interaction"};
        author[] = {"commy2", "KoffeinFlummi"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMoves.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgEden.hpp"

class ACE_newEvents {
    SettingsInitialized = "ace_settingsInitialized";
    medical_onUnconscious = "ace_medical_onUnconscious";
    SetSurrendered = QGVAR(setSurrendered);
    SetHandcuffed = QGVAR(setHandcuffed);
    MoveOutCaptive = QGVAR(moveOutCaptive);
    MoveInCaptive = QGVAR(moveInCaptive);
    playerChanged = "ace_playerChanged";
    CaptiveStatusChanged = "ace_captiveStatusChanged";
};
