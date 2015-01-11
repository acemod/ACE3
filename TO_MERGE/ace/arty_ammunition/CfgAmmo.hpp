//cfgAmmo.hpp

class CfgAmmo {
	class ShellBase;
	class ace_arty_howitzer_base: ShellBase {
		whistleOnFire = 200;
		artilleryLock = 0;
	};
	
	class ace_arty_baseEject : ShellBase {
		hit = 20;
		indirectHit = 20;
		indirectHitRange = 10;
		typicalSpeed = 100;
		explosive = 1;
		cost = 300;
		model = "\ca\weapons\empty";
		airFriction = 0;
		timeToLive = 1;
		explosionTime = 0.001;
		soundFly[] = {"",1,1};
		soundEngine[] = {"",1,4};
		CraterEffects = "GrenadeCrater";
		explosionEffects = "GrenadeExplosion";
		muzzleEffect = "BIS_Effects_Rifle";
		soundHit[] = {"\x\ace\addons\sys_arty_ammunition\Sounds\base_eject",56.23413,1,1800};
		soundDefault1[] = {"\x\ace\addons\sys_arty_ammunition\Sounds\base_eject",56.2341,1,1800};
		soundDefault2[] = {"\x\ace\addons\sys_arty_ammunition\Sounds\base_eject",56.2341,1,1800};
		soundDefault3[] = {"\x\ace\addons\sys_arty_ammunition\Sounds\base_eject",56.2341,1,1800};
		hitGroundSoft[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitGroundHard[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitMan[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitArmor[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitIron[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitBuilding[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitFoliage[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitWood[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitGlass[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitGlassArmored[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitConcrete[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitRubber[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitPlastic[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitDefault[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitMetal[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
		hitMetalplate[] = {"soundDefault1",0.33,"soundDefault2",0.33,"soundDefault3",0.33};
	};
	#include "60mm\CfgAmmo.hpp"
	#include "81mm\CfgAmmo.hpp"
	#include "82mm\CfgAmmo.hpp"
	#include "105mm\CfgAmmo.hpp"
	#include "120mm\CfgAmmo.hpp"	
	#include "155mm\CfgAmmo.hpp"
};
