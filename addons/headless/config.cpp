#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[]= {"Jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };

    class XADDON: ADDON {};
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgEden.hpp"

class ACE_newEvents {
    ACE_HeadlessClientJoined = QXGVAR(headlessClientJoined);
};
