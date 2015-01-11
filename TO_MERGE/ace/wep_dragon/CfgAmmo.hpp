class CfgAmmo {
	class MissileBase;
	class ShellBase;
	
	class ace_m47_dragon_serviceCharge : ShellBase {
		hit = 1;
		indirectHit = 2;
		indirectHitRange = 1;
		typicalSpeed = 100;
		explosive = 1;
		cost = 300;
		model = "\ca\weapons\empty";
		airFriction = 0;
		timeToLive = 1;
		explosionTime = 0.001;
		soundFly[] = {"",1,1};
		soundEngine[] = {"",1,4};
		CraterEffects = "";
		explosionEffects = "ace_m47_serviceExplosion";
		hitarmor[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitbuilding[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitconcrete[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitdefault[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitfoliage[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitglass[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitglassarmored[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitgroundhard[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitgroundsoft[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitiron[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitman[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitmetal[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitmetalplate[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitplastic[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitrubber[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		hitwood[] = {"soundDefault1", 0.33, "soundDefault2", 0.33, "soundDefault3", 0.33};
		sounddefault1[] = {"\x\ace\addons\sys_arty_ammunition\Sounds\base_eject", 56.2341, 1, 1800};
		sounddefault2[] = {"\x\ace\addons\sys_arty_ammunition\Sounds\base_eject", 56.2341, 1, 1800};
		sounddefault3[] = {"\x\ace\addons\sys_arty_ammunition\Sounds\base_eject", 56.2341, 1, 1800};
		soundHit[] = {"\x\ace\addons\sys_arty_ammunition\Sounds\base_eject",56.23413,1,1800};
	};
	
	class M_47_AT_EP1: MissileBase {
		ace_towsmoke = 0;	// no trail
		six_tracerenable = 0;	// can't find it?
		ace_guidance_type = "dragon";
		soundFly[] = {"",0,1,0};
		soundEngine[] = {"",0,1,0};
	};
	
	class ace_missile_dragon : M_47_AT_EP1 {
		model = PATHTOF(models\dragon.p3d);
		maxSpeed = 120;
		thrust = 0;
		initTime = 0;
		thrustTime = 0;
		sideAirFriction = 0.025;
		explosionEffects = "";
		CraterEffects = "";
		hitarmor[] = {"soundhit", 1};
		hitbuilding[] = {"soundhit", 1};
		hitconcrete[] = {"soundhit", 1};
		hitdefault[] = {"soundhit", 1};
		hitfoliage[] = {"soundhit", 1};
		hitglass[] = {"soundhit", 1};
		hitglassarmored[] = {"soundhit", 1};
		hitgroundhard[] = {"soundhit", 1};
		hitgroundsoft[] = {"soundhit", 1};
		hitiron[] = {"soundhit", 1};
		hitman[] = {"soundhit", 1};
		hitmetal[] = {"soundhit", 1};
		hitmetalplate[] = {"soundhit", 1};
		hitplastic[] = {"soundhit", 1};
		hitrubber[] = {"soundhit", 1};
		hitwood[] = {"soundhit", 1};
		soundhit[] = {"", 0, 1};
	};
};