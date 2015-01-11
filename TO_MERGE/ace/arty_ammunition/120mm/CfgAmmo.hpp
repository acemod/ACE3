class ace_arty_howitzer_120mm_base : ace_arty_howitzer_base {
	whistleDist = 1500;
};
// DM11A5 Spreng Aufschlagzünder DM111A1 
class ace_arty_120mm_dm11a5_dm111a1_pd: ace_arty_howitzer_120mm_base {
	hit = 290;
	indirectHit = 50;
	indirectHitRange = 20;
	typicalSpeed = 800;
	timeToLive = 500;
	explosive = 0.8;
	cost = 200;
	model = QPATHTO_M(120mm\ace_arty_dm11_shell);	
	airFriction = -0.0000758;
	CraterEffects = "ArtyShellCrater";
	ExplosionEffects = "ArtyShellExplosion";
	muzzleEffect = "BIS_Effects_Cannon";
	caliber = 6;
};
//DM61 Spreng Annäherungszünder PPD324-B3
class ace_arty_120mm_dm61_ppd_prox: ace_arty_120mm_dm11a5_dm111a1_pd {
	CraterEffects = "";
	ExplosionEffects = "";
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m734\fuze_prox.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_120mm_dm11dm61_explosion";
};

class ace_arty_120mm_dm11dm61_explosion : ace_arty_howitzer_120mm_base {
	hit = 290;
	indirectHit = 50;
	indirectHitRange = 20;
	explosionTime = 0.0001;
	model = QPATHTO_M(120mm\ace_arty_dm11_shell);
	CraterEffects = "ArtyShellCrater";
	ExplosionEffects = "ArtyShellExplosion";	
};

class ace_arty_120mm_dm26_dm93_time: ace_arty_howitzer_120mm_base {
	hit = 5;
	indirecthit = 0;
	indirecthitrange = 0;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 0.01;
	cost = 300;
	model = QPATHTO_M(120mm\ace_arty_dm26_shell.p3d);
	airFriction = -0.0000758;
	CraterEffects = "";
	ExplosionEffects = "GrenadeExplosion";
	caliber = 6;
	ACE_ARTY_ISBASEEJECTING = 1;
	ACE_ARTY_BASEEJECT_HOB = 500;
	ACE_ARTY_BASEEJECT_COMPENSATE = 0; // calculate the trajectory for this round's submunitions 1 true, 0 false
	ACE_ARTY_BASEEJECT_POWER = 0.25; // the percent speed at which the base ejection charges will enter the airstream.
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m772\fuze_time.sqf";
	ACE_ARTY_BASE_EJECT_HANDLER = "\x\ace\addons\sys_arty_ammunition\120mm\eject_illum.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_baseEject";
};
class ace_arty_120mm_dm35_dm93_time : ace_arty_howitzer_120mm_base {
	hit = 0;
	indirecthit = 0;
	indirecthitrange = 0;
	typicalSpeed = 300;
	timeToLive = 500;
	explosive = 1;
	cost = 300;
	model = QPATHTO_M(120mm\ace_arty_dm35_shell.p3d);	
	airFriction = -0.0000758;
	CraterEffects = "";
	ExplosionEffects = "WPExplosion";
	caliber = 6;
	ACE_ARTY_FIRE_HANDLER = "\x\ace\addons\sys_arty_ammunition\fuzes\m782\fuze_time.sqf";
	ACE_ARTY_ISBASEEJECTING = 1;
	ACE_ARTY_BASEEJECT_HOB = 150;
	ACE_ARTY_BASEEJECT_COMPENSATE = 1; // calculate the trajectory for this round's submunitions 1 true, 0 false
	ACE_ARTY_BASEEJECT_POWER = 0.125; // the percent speed at which the base ejection charges will enter the airstream.
	ACE_ARTY_BASE_EJECT_HANDLER = "\x\ace\addons\sys_arty_ammunition\120mm\eject_smoke_m84.sqf";
	ACE_ARTY_EXPLOSION = "ace_arty_baseEject";	
};

class ace_arty_120mm_dm26_dm93_flare: FlareBase {
	model="\ca\Weapons\granat";
	lightColor[] = {0.8, 0.8, 0.8, 0};
	deflecting=65;
};
