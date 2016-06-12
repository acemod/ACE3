#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {CLASSNAME, DOUBLES(CLASSNAME,Tan)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction", "ace_movement"};
        author[] = {"Ir0n1E"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
