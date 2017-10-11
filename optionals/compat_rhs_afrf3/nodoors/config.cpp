#include "\z\ace\addons\compat_rhs_afrf3\script_component.hpp"
#undef COMPONENT
#define COMPONENT compat_rhs_afrf3_nodoors

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_compat_rhs_afrf3"};
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
