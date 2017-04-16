#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = { "ace_main", "ace_common", "ace_missileguidance" };
        VERSION_CONFIG;
    };
};

#include "CfgEventhandlers.hpp"
//#include "RscInGameUI.hpp"
//#include "CfgSounds.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"

class ace_m47_serviceExplosion
{
	class Light1
	{
		simulation = "light";
		type = "GrenadeExploLight";
		position[] = {0,0,0};
		intensity = 0.005;
		interval = 1;
		lifeTime = 0.5;
	};
	class GrenadeSmoke1
	{
		simulation = "particles";
		type = "ImpactSmoke2";
		position[] = {0,0,0};
		intensity = 0.15;
		interval = 0.1;
		lifeTime = 0.5;
	};
};