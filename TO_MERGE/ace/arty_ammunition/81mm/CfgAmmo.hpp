class ace_arty_howitzer_81mm_base : ace_arty_howitzer_base {
	whistleDist = 1500;
};

class ace_arty_81mm_m821a2_m734_pd: ace_arty_howitzer_81mm_base {
	hit = 160;
	indirectHit = 30;
	indirectHitRange = 15; // ~34m lethal diameter
	typicalSpeed = 800;
	timeToLive = 500;
	explosive = 1;
	cost = 200;
	//model = "\x\ace\addons\sys_arty_ammunition\81mm\ace_arty_m821a2_shell.p3d";
	model = "\x\ace\addons\sys_arty_ammunition\60mm\default_60mm_shell";	
	airFriction = -0.0000758;
	CraterEffects = "ArtyShellCrater";
	ExplosionEffects = "ArtyShellExplosion";
	muzzleEffect = "BIS_Effects_HeavyCaliber";
	caliber = 6;
};

class ace_arty_81mm_m821a2_m734_prox: ace_arty_81mm_m821a2_m734_pd {
	CraterEffects = "";
	ExplosionEffects = "";
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m734\fuze_prox.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_81mm_m821a2_explosion";
};
class ace_arty_81mm_m821a2_m734_nsb: ace_arty_81mm_m821a2_m734_prox {
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m734\fuze_nsb.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_81mm_m821a2_explosion";
};

class ace_arty_81mm_m821a2_m734_delay: ace_arty_81mm_m821a2_m734_prox {
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m734\fuze_delay.sqf";
	soundHit[] = {"",0,1,0};
	ACE_FRAG_SKIP = 1;
};
class ace_arty_81mm_m821a2_explosion : ace_arty_howitzer_81mm_base {
	hit = 160;
	indirectHit = 30;
	indirectHitRange = 15; // Lethal bursting area ~17m radius (Arma=radius)

	explosionTime = 0.0001;
	//model = "\x\ace\addons\sys_arty_ammunition\60mm\ace_arty_m821a2_shell.p3d"; // Add model or : No shape for ammo type ace_arty_105mm_m1_explosion
	model = "\x\ace\addons\sys_arty_ammunition\60mm\default_60mm_shell";
	CraterEffects = "ArtyShellCrater";
	ExplosionEffects = "ArtyShellExplosion";	
};

class ace_arty_81mm_m821a2_delay_action: ace_arty_81mm_m821a2_m734_pd {
	explosionTime = 0.05;
	deflecting=65;
};
class ace_arty_81mm_m853a1_m772_time: ace_arty_howitzer_81mm_base {
	hit = 5;
	indirecthit = 0;
	indirecthitrange = 0;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 0.01;
	cost = 300;
	//model = "\x\ace\addons\sys_arty_ammunition\81mm\ace_arty_m853a1_shell.p3d";
	model = "\x\ace\addons\sys_arty_ammunition\60mm\default_60mm_shell";	
	airFriction = -0.0000758;
	CraterEffects = "";
	ExplosionEffects = "GrenadeExplosion";
	caliber = 6;
	ACE_ARTY_ISBASEEJECTING = 1;
	ACE_ARTY_BASEEJECT_HOB = 500;
	ACE_ARTY_BASEEJECT_COMPENSATE = 0; // calculate the trajectory for this round's submunitions 1 true, 0 false
	ACE_ARTY_BASEEJECT_POWER = 0.25; // the percent speed at which the base ejection charges will enter the airstream.
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m772\fuze_time.sqf";
	ACE_ARTY_BASE_EJECT_HANDLER = "\x\ace\addons\sys_arty_ammunition\81mm\eject_illum.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_baseEject";
};
class ace_arty_81mm_m375a3_m524_pd : ace_arty_howitzer_81mm_base {
	hit = 110;
	indirecthit = 25;
	indirecthitrange = 7;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 1;
	cost = 300;
	//model = "\x\ace\addons\sys_arty_ammunition\81mm\ace_arty_m375a3_shell.p3d";
	model = "\x\ace\addons\sys_arty_ammunition\60mm\default_60mm_shell";	
	airFriction = -0.0000758;
	CraterEffects = "";
	ExplosionEffects = "ace_arty_WPExplosion";
	caliber = 6;
};

class ace_arty_81mm_m853a1_m772_flare :FlareBase {
	model="\ca\Weapons\granat";
	lightColor[] = {0.8, 0.8, 0.8, 0};
	deflecting=65;
};
