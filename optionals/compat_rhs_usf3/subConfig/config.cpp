#include "\z\ace\addons\compat_rhs_usf3\script_component.hpp"
#undef COMPONENT
#define COMPONENT compat_rhs_usf3_sub

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_compat_rhs_usf3"};
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class CfgWeapons {
    class arifle_MX_Base_F;
    class rhs_weap_m4_Base: arifle_MX_Base_F {
        class M203_GL;
        class M320_GL: M203_GL {
            magazines[] += {"ACE_HuntIR_M203"};
        };
    };
};
