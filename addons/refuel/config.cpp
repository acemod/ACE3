#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_refuel_fuelNozzle"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"GitHawk"};
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"

class ACE_newEvents {
    medical_onUnconscious = "ace_medical_onUnconscious";
    setFuel = "ace_setFuel";
    setVectorDirAndUp = "ace_setVectorDirAndUp";
    displayTextStructured = "ace_displayTextStructured";
};
