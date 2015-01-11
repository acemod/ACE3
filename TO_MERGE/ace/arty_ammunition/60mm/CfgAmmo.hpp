class GrenadeBase;
class ace_arty_howitzer_60mm_base: GrenadeBase {
	whistleDist = 1500;
	deflecting = 0;
};

class ace_arty_60mm_m720a1_m734_pd: ace_arty_howitzer_60mm_base {
	hit = 110;
	indirecthit = 20;
	indirecthitrange = 9;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 1;
	cost = 300;
	model = "\x\ace\addons\sys_arty_ammunition\60mm\ace_arty_m720a1_shell.p3d";
	airFriction = -0.0000758;
	CraterEffects = "GrenadeCrater";
	ExplosionEffects = "GrenadeExplosion";
	caliber = 6;
};

class ace_arty_60mm_m720a1_m734_prox: ace_arty_60mm_m720a1_m734_pd {
	CraterEffects = "";
	ExplosionEffects = "";
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m734\fuze_prox.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_60mm_m720a1_explosion";
};

class ace_arty_60mm_m720a1_m734_delay: ace_arty_60mm_m720a1_m734_prox {
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m734\fuze_delay.sqf";
	soundHit[] = {"",0,1,0};
	ACE_FRAG_SKIP = 1;
};
class ace_arty_60mm_m720a1_m734_nsb: ace_arty_60mm_m720a1_m734_prox {
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m734\fuze_nsb.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_60mm_m720a1_explosion";
};

class ace_arty_60mm_m720a1_explosion : ace_arty_howitzer_60mm_base {
	hit = 110;
	indirecthit = 20;
	indirecthitrange = 9;
	explosionTime = 0.0001;
	model = "\x\ace\addons\sys_arty_ammunition\60mm\ace_arty_m720a1_shell.p3d"; // Add model or : No shape for ammo type ace_arty_105mm_m1_explosion
	CraterEffects = "GrenadeCrater";
	ExplosionEffects = "GrenadeExplosion";	
};

class ace_arty_60mm_m720a1_delay_action: ace_arty_60mm_m720a1_m734_pd {
	explosionTime = 0.05;
	deflecting=65;
};

class ace_arty_60mm_m721_m776_time: ace_arty_howitzer_60mm_base {
	hit = 0;
	indirecthit = 0;
	indirecthitrange = 0;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 0.01;
	cost = 300;
	model = "\x\ace\addons\sys_arty_ammunition\60mm\ace_arty_m721_shell.p3d";
	airFriction = -0.0000758;
	CraterEffects = "";
	ExplosionEffects = "GrenadeExplosion";
	caliber = 6;
	ACE_ARTY_ISBASEEJECTING = 1;
	ACE_ARTY_BASEEJECT_HOB = 500;
	ACE_ARTY_BASEEJECT_COMPENSATE = 0; // calculate the trajectory for this round's submunitions 1 true, 0 false
	ACE_ARTY_BASEEJECT_POWER = 0.25; // the percent speed at which the base ejection charges will enter the airstream.
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m776\fuze_time.sqf";
	ACE_ARTY_BASE_EJECT_HANDLER = "\x\ace\addons\sys_arty_ammunition\60mm\eject_illum.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_baseEject";
};
//TODO: Adjust WP effect, currently its the same for all smoke shells
class ace_arty_60mm_m722a1_m745_pd : ace_arty_howitzer_60mm_base {
	hit = 110;
	indirecthit = 15;
	indirecthitrange = 5;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 1;
	cost = 300;
	model = "\x\ace\addons\sys_arty_ammunition\60mm\ace_arty_m722a1_shell.p3d";
	airFriction = -0.0000758;
	CraterEffects = "";
	ExplosionEffects = "ace_arty_WPExplosion";
	caliber = 6;
};

class FlareBase;
class ace_arty_60mm_m721_m766_flare :FlareBase {
	model="\ca\Weapons\granat";
	lightColor[] = {0.8, 0.8, 0.8, 0};
	deflecting=65;
};
