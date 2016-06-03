#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_refuel_fuelNozzle"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"GitHawk"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"

class ACE_newEvents {
    medical_onUnconscious = QEGVAR(medical,unconscious);
    setFuel = "ace_setFuel";
    setVectorDirAndUp = "ace_setVectorDirAndUp";
    displayTextStructured = "ace_displayTextStructured";
};
