#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_ConcertinaWire", "ACE_ConcertinaWireNoGeo", "ACE_ConcertinaWireCoil"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_apl", "ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Rocko", "Ruthberg"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
