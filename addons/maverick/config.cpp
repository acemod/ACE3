#include "script_component.hpp"

class CfgPatches {
 	class ADDON {
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common","ace_missileguidance"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"xrufix"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
		ammo[] = {
			"ace_missile_AGM_02_Laser"
		};
		magazines[] = {
			"ace_magazine_missile_agm_02_laser_x1",
			"ace_pylonmissile_missile_agm_02_Laser_x1",
			"ace_pylonmissile_missile_agm_02_Laser_x2",
			"ace_PylonRack_1Rnd_Missile_AGM_02_Laser",
			"ace_PylonRack_3Rnd_Missile_AGM_02_Laser",
			"ace_PylonRack_Missile_AGM_02_Laser_x1",
			"ace_PylonRack_Missile_AGM_02_Laser_x2"
		};
		weapons[] = {
		    "ace_Weapon_AGM_65Launcher_Laser",
			"ace_Missile_AGM_02_Plane_CAS_01_Laser"
		};
		units[] = {};
 	};
};


class SensorTemplateLaser;

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"