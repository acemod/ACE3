#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_medical"};
        author[] = {$STR_ACE_Common_ACETeam, "Glowbal"};
        authorUrl = "http://ace3mod.com";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "ui\menu.hpp"
#include "ACE_Settings.hpp"
#include "CfgVehicles.hpp"

class ACE_newEvents {
    medical_treatmentSuccess = "ace_medical_treatmentSuccess";
    Medical_onMenuOpen = "ace_medical_onMenuOpen";
    displayTextStructured = "ace_displayTextStructured";
};
