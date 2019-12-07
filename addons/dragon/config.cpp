#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_hot","ace_csw"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Brandon (TCVM)"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_GuidanceConfig.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgAmmo.hpp"
#include "CfgVehicles.hpp"

class GVAR(serviceExplosion) {
    class Light1 {
        simulation = "light";
        type = "GrenadeExploLight";
        position[] = {0,0,0};
        intensity = 0.005;
        interval = 1;
        lifeTime = 0.5;
    };
    class GrenadeSmoke1 {
        simulation = "particles";
        type = "ImpactSmoke2";
        position[] = {0,0,0};
        intensity = 0.15;
        interval = 0.1;
        lifeTime = 0.5;
    };
};

