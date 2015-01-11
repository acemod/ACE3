/*
 No info found about russian mortar shells.
 Names seem to be no existant
 
 Bulgarian and Romanian manufacturer page have various images for numerous 82mm shells.
 Most useful information from bulgarian manufacturer with muzzlevelocities
 
 M74 - 82mm HE  4.15kg; MC: 0 - MC: 6; (70, 121, 164, 200, 230, 259, 284); Range: 6200m; Fuze: AF66, AF62 (L:0.490 )
 //82mm HE FRAG 3.1kg; MC: 0 - MC: 3; (75,132,175,211); Range: 3130m / Long Distance Charge: 255 (4200m); Fuze: AF67,A61 (L: 345)
 82mm WP -> 82mm HE FRAG model
 82mm ILLUM: 3.5 kg; MC: 1 - MC:3 ; (125,165,199); Range: 2670m, Burst height: 350m, Fuze: FTSQ or T-1 (L: 0.495 )
 
 ALL Fuzes are PD or TIME
*/

class ace_arty_82mm_he_cartridge : ACE_Arty_ShellHolder {
	scope = 1;
	icon = "iconThing";
	mapSize = 0;			 // iconsize on map... small object such as a tree is 0.7
	displayName = "82mm HE Cartridge";
	vehicleClass = "Objects";
	nameSound = "obj_object";
	picture = "pictureThing";
	class Library {libTextDesc = "";};
	descriptionShort = "";
	destrType = "DestructTree";
	weight = 1000;
	simulation = "house";
	type = 1;
	model = "\x\ace\addons\sys_arty_ammunition\82mm\ace_arty_82mm_he_cartridge.p3d";
	animated = 1;
	reversed = 0;
	class EventHandlers {
		killed = "_this call ace_sys_arty_ammunition_fnc_onShellDestroyed";
	};
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_82mm_he";
	ACE_ARTY_SHELL_PREP[] = {"ace_arty_82mm_he_pd_chg0",{0},"fnord",0,"pd"};
	ACE_Weight = 4.15;
	class AnimationSources {
		class hide_inc1 {
			source = "user";
			initPhase = 1;
			animPeriod = 0.1;
		};
		class hide_inc2: hide_inc1 {};
		class hide_inc3: hide_inc1 {};
		class hide_inc4: hide_inc1 {};
		class hide_inc5: hide_inc1 {};
		class hide_inc6: hide_inc1 {};
		class hide_inc7: hide_inc1 {};
		class hide_inc8: hide_inc1 {};
		class hide_inc9: hide_inc1 {};
		class hide_inc10: hide_inc1 {};
	};	
};

class ace_arty_82mm_illum_cartridge : ace_arty_82mm_he_cartridge {
	displayName = "82mm Illum Cartridge";
	model = "\x\ace\addons\sys_arty_ammunition\82mm\ace_arty_82mm_illum_cartridge.p3d";
	//model = "\x\ace\addons\sys_arty_ammunition\60mm\default_60mm_crtg";
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_82mm_illum";
	ACE_ARTY_SHELL_PREP[] = {"ace_arty_82mm_illum_time_chg1",{10},"fnord",1,"time"};
	ACE_Weight = 3.5;
};

class ace_arty_82mm_smoke_cartridge : ace_arty_82mm_he_cartridge {
	displayName = "82mm WP Cartridge";
	model = "\x\ace\addons\sys_arty_ammunition\82mm\ace_arty_82mm_smoke_cartridge.p3d";
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_82mm_wp";
	ACE_ARTY_SHELL_PREP[] = {"ace_arty_82mm_wp_pd_chg0",{0},"fnord",0,"pd"};
	ACE_Weight = 4.15;
};

class ace_arty_82mm_illum_ftsq_parachute : ace_arty_60mm_m721_m766_parachute {
	//class EventHandlers {
	//	EXTENDED_EVENTHANDLERS
	//};
	//SLX_XEH_DISABLED = 0;
};
