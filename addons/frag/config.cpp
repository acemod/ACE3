#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Nou"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventhandlers.hpp"
#include "CfgAmmo.hpp"
#include "ACE_Settings.hpp"
class ACE_newEvents {
    SettingsInitialized = "ace_settingsInitialized";
    firedNonPlayerVehicle = "ace_firedNonPlayerVehicle";
    firedPlayerVehicleNonLocal = "ace_firedPlayerVehicleNonLocal";
    firedPlayerVehicle = "ace_firedPlayerVehicle";
    firedNonPlayer = "ace_firedNonPlayer";
    firedPlayerNonLocal = "ace_firedPlayerNonLocal";
    firedPlayer = "ace_firedPlayer";
};