#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {"ACE_Flashlight_MX991", "ACE_Flashlight_KSF1", "ACE_Flashlight_XL50"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"voiper"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

class CfgACEArsenalStats {
    class statBase;
    class flashlightColor: statBase {
        scope = 2;
        priority = 1;
        stats[]= {"ACE_Flashlight_Colour"};
        displayName= CSTRING(statMapLightColor);
        showText= 1;
        textStatement = QUOTE(getText (_this select 1 >> 'itemInfo' >> 'FlashLight' >> (_this select 0) select 0));
        condition =  QUOTE(getText (_this select 1 >> 'itemInfo' >> 'FlashLight' >> (_this select 0) select 0) != '');
        tabs[]= {{}, {1,7}};
    };
};
