#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interact_menu"};
        author[] = {"commy2", "KoffeinFlummi", "esteldunedain", "bux578", "dixon13"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "RscTitles.hpp"
#include "ACE_Settings.hpp"
#include "ACE_ZeusActions.hpp"

class ACE_newEvents {
    getDown = "ace_getDown";
    pardon = "ace_pardon";
    tapShoulder = "ace_tapShoulder";
    sendAway = "ace_sendAway";
    setVelocity = "ace_setVelocity";
    displayTextStructured = "ace_displayTextStructured";
    CBA_teamColorChanged = "ace_CBA_teamColorChanged";
    selectLeader = "ace_selectLeader";
};
