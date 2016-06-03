#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interact_menu"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2", "KoffeinFlummi", "esteldunedain", "bux578", "dixon13"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "RscTitles.hpp"
#include "ACE_Settings.hpp"
#include "ACE_ZeusActions.hpp"

class ACE_newEvents {
    getDown = QGVAR(getDown);
    pardon = QGVAR(pardon);
    tapShoulder = QGVAR(tapShoulder);
    sendAway = QGVAR(sendAway);
    setVelocity = "ace_setVelocity";
    displayTextStructured = "ace_displayTextStructured";
    CBA_teamColorChanged = "ace_CBA_teamColorChanged";
    selectLeader = "ace_selectLeader";
    lampTurnOff = QGVAR(lampTurnOff);
    lampTurnOn = QGVAR(lampTurnOn);
};
