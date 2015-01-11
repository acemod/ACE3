
// class name structure
// prefix_caliber_shell_fuze_setting
class ace_arty_howitzer_105mm_base : ace_arty_howitzer_base {
	whistleDist = 1500;
	//soundFly[] = {"\x\ace\addons\sys_arty_ammunition\Sounds\arty_flightsound",10,1.2,600};
};

class ace_arty_105mm_m1_m782_pd: ace_arty_howitzer_105mm_base {
	hit = 110;
	indirecthit = 50;
	indirecthitrange = 11.52;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 1;
	cost = 300;
	model = "\x\ace\addons\sys_arty_ammunition\105mm\ace_arty_m1_shell.p3d";
	airFriction = -0.0000758;
	CraterEffects = "ArtyShellCrater";
	ExplosionEffects = "ArtyShellExplosion";
	caliber = 6;
};

class ace_arty_105mm_m1_m782_time: ace_arty_105mm_m1_m782_pd {
	hit = 0;
	indirecthit = 0;
	indirecthitrange = 0;
	CraterEffects = "";
	ExplosionEffects = "";
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m782\fuze_time.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_105mm_m1_explosion";
};

class ace_arty_105mm_m1_m782_prox: ace_arty_105mm_m1_m782_time {
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m782\fuze_prox.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_105mm_m1_explosion";
};

class ace_arty_105mm_m1_m782_delay: ace_arty_105mm_m1_m782_prox {
	ACE_FRAG_SKIP = 1;
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m782\fuze_delay.sqf";
	soundHit[] = {"",0,1,0};
};

class ace_arty_105mm_m1_explosion : ace_arty_howitzer_105mm_base {
	hit = 110;
	indirecthit = 50;
	indirecthitrange = 11.52;
	explosionTime = 0.0001;
	model = "\x\ace\addons\sys_arty_ammunition\105mm\ace_arty_m1_shell.p3d"; // Add model or : No shape for ammo type ace_arty_105mm_m1_explosion
};

class ace_arty_105mm_m1_delay_action: ace_arty_105mm_m1_m782_pd {
	explosionTime = 0.05;
	deflecting=65;
};


class ace_arty_105mm_m314a3_m782 : ace_arty_howitzer_105mm_base {
	hit = 0;
	indirecthit = 0;
	indirecthitrange = 0;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 0.01;
	cost = 300;
	model = "\x\ace\addons\sys_arty_ammunition\105mm\ace_arty_m314a3_shell.p3d";
	airFriction = -0.0000758;
	CraterEffects = "";
	ExplosionEffects = "GrenadeExplosion";
	caliber = 6;
	ACE_ARTY_ISBASEEJECTING = 1;
	ACE_ARTY_BASEEJECT_HOB = 500;
	ACE_ARTY_BASEEJECT_COMPENSATE = 0; // calculate the trajectory for this round's submunitions 1 true, 0 false
	ACE_ARTY_BASEEJECT_POWER = 0.25; // the percent speed at which the base ejection charges will enter the airstream.
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m782\fuze_time.sqf";
	ACE_ARTY_BASE_EJECT_HANDLER = "\x\ace\addons\sys_arty_ammunition\105mm\eject_illum.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_baseEject";
};

class ace_arty_105mm_m84a1_m782 : ace_arty_howitzer_105mm_base {
	hit = 0;
	indirecthit = 0;
	indirecthitrange = 0;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 0.01;
	cost = 300;
	model = "\x\ace\addons\sys_arty_ammunition\105mm\ace_arty_m84a1_shell.p3d";
	airFriction = -0.0000758;
	CraterEffects = "";
	ExplosionEffects = "WPExplosion";
	caliber = 6;
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m782\fuze_time.sqf";
	ACE_ARTY_ISBASEEJECTING = 1;
	ACE_ARTY_BASEEJECT_HOB = 150;
	ACE_ARTY_BASEEJECT_COMPENSATE = 1; // calculate the trajectory for this round's submunitions 1 true, 0 false
	ACE_ARTY_BASEEJECT_POWER = 0.125; // the percent speed at which the base ejection charges will enter the airstream.
	ACE_ARTY_BASE_EJECT_HANDLER = "\x\ace\addons\sys_arty_ammunition\105mm\eject_smoke_m84.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_baseEject";
};

class ace_arty_105mm_m916_m782 : ace_arty_howitzer_105mm_base {
	hit = 0;
	indirecthit = 0;
	indirecthitrange = 5;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 0.01;
	cost = 300;
	model = "\x\ace\addons\sys_arty_ammunition\105mm\ace_arty_m916_shell.p3d";
	airFriction = -0.0000758;
	CraterEffects = "";
	ExplosionEffects = "";
	caliber = 6;
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m782\fuze_time.sqf";
	ACE_ARTY_ISBASEEJECTING = 1;
	ACE_ARTY_BASEEJECT_HOB = 50;
	ACE_ARTY_BASEEJECT_COMPENSATE = 1; // calculate the trajectory for this round's submunitions 1 true, 0 false
	ACE_ARTY_BASEEJECT_POWER = 0.25; // the percent speed at which the base ejection charges will enter the airstream.
	ACE_ARTY_BASE_EJECT_HANDLER = "\x\ace\addons\sys_arty_ammunition\105mm\eject_dpicm.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_baseEject";
};


class ace_arty_105mm_m60a2_m782_pd: ace_arty_howitzer_105mm_base {
	hit = 110;
	indirecthit = 50;
	indirecthitrange = 11.52;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 1;
	cost = 300;
	model = "\x\ace\addons\sys_arty_ammunition\105mm\ace_arty_m60a2_shell.p3d";
	airFriction = -0.0000758;
	CraterEffects = "";
	ExplosionEffects = "ace_arty_WPExplosion";
	caliber = 6;
};

class ARTY_SmokeShellWhite;
class ace_arty_105mm_m84a1_m782_smokeCanisterHC : ARTY_SmokeShellWhite {
	explosionTime = 6;
	timeToLive = 120;
	smokeColor[] = {1, 1, 1, 1};
	effectsSmoke = "ace_arty_105mm_m84a1_m782_smokeCanisterHC_effect";
	model = "\ca\Weapons\granat";
};

class ace_arty_105mm_m314a3_m782_flare :FlareBase {
	model="\ca\Weapons\granat";
	lightColor[] = {0.8, 0.8, 0.8, 0};
	deflecting=65;
};

class G_40mm_HE;
class ace_arty_dpicm_m80 : G_40mm_HE {
	hit = 100;
	ace_hit = 100;
	ace_heat = 1;
	indirectHit = 24;
	indirectHitRange = 5;
	model = "\x\ace\addons\sys_arty_ammunition\105mm\ace_arty_m80_bomblet.p3d";
	ExplosionEffects = "ace_arty_dpicmEffects";
};
