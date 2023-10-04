#define SUBCOMPONENT sub
#include "..\script_component.hpp"

class CfgPatches {
    class SUBADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_huntir"};
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        addonRootClass = QUOTE(ADDON);
    };
};

class CfgWeapons {
    class UGL_F;
    class Rifle_Base_F;
    class arifle_MX_Base_F: Rifle_Base_F {
        class GL_3GL_F: UGL_F {
            magazines[] += {"ACE_HuntIR_M203"};
        };
    };
};
