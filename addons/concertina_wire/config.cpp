#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_ConcertinaWire", "ACE_ConcertinaWireNoGeo", "ACE_ConcertinaWireCoil"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_apl", "ace_interaction"};
        author[] = {"Rocko", "Ruthberg"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"