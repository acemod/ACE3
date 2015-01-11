class ace_arty_howitzer_82mm_base : ace_arty_howitzer_base {
	whistleDist = 1500;
};

class ace_arty_82mm_he_pd: ace_arty_howitzer_82mm_base {
	hit = 110;
	indirecthit = 31;
	indirecthitrange = 15;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 1;
	cost = 300;
	model = "\x\ace\addons\sys_arty_ammunition\82mm\ace_arty_82mm_he_shell.p3d";
	//model = "\x\ace\addons\sys_arty_ammunition\60mm\default_60mm_shell";
	airFriction = -0.0000758;
	CraterEffects = "ArtyShellCrater";
	ExplosionEffects = "ArtyShellExplosion";
	muzzleEffect = "BIS_Effects_HeavyCaliber";
	caliber = 6;
};

class ace_arty_82mm_he_explosion: ace_arty_howitzer_82mm_base {
	hit = 110;
	indirecthit = 31;
	indirecthitrange = 15;
	explosionTime = 0.0001;
	model = "\x\ace\addons\sys_arty_ammunition\82mm\ace_arty_82mm_he_shell.p3d"; // Add model or : No shape for ammo type ace_arty_105mm_m1_explosion
	//model = "\x\ace\addons\sys_arty_ammunition\60mm\default_60mm_shell";
	CraterEffects = "ArtyShellCrater";
	ExplosionEffects = "ArtyShellExplosion";
	muzzleEffect = "BIS_Effects_HeavyCaliber";	
};

class ace_arty_82mm_illum_time: ace_arty_howitzer_82mm_base {
	hit = 0;
	indirecthit = 0;
	indirecthitrange = 0;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 0.01;
	cost = 300;
	model = "\x\ace\addons\sys_arty_ammunition\82mm\ace_arty_82mm_illum_shell.p3d";
	//model = "\x\ace\addons\sys_arty_ammunition\60mm\default_60mm_shell";
	airFriction = -0.0000758;
	CraterEffects = "";
	ExplosionEffects = "GrenadeExplosion";
	caliber = 6;
	ACE_ARTY_ISBASEEJECTING = 1;
	ACE_ARTY_BASEEJECT_HOB = 500;
	ACE_ARTY_BASEEJECT_COMPENSATE = 0; // calculate the trajectory for this round's submunitions 1 true, 0 false
	ACE_ARTY_BASEEJECT_POWER = 0.25; // the percent speed at which the base ejection charges will enter the airstream.
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\time\fuze_time.sqf";
	ACE_ARTY_BASE_EJECT_HANDLER = "\x\ace\addons\sys_arty_ammunition\82mm\eject_illum.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_baseEject";
};

class ace_arty_82mm_wp_pd : ace_arty_howitzer_82mm_base {
	hit = 110;
	indirecthit = 25;
	indirecthitrange = 7;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 1;
	cost = 300;
	model = "\x\ace\addons\sys_arty_ammunition\82mm\ace_arty_82mm_smoke_shell.p3d";
	//model = "\x\ace\addons\sys_arty_ammunition\60mm\default_60mm_shell";	
	airFriction = -0.0000758;
	CraterEffects = "";
	ExplosionEffects = "ace_arty_WPExplosion";
	caliber = 6;
};

class ace_arty_82mm_illum_flare :FlareBase {
	model="\ca\Weapons\granat";
	lightColor[] = {0.8, 0.8, 0.8, 0};
	deflecting=65;
};
