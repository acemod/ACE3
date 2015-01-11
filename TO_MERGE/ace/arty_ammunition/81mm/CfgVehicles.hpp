/*
"81mm M821A2 HE"; 4.5kg; M734A1 multioption ; MC: 0 - MC: 4; Range: 5790 
"81mm M853A1 ILLUM"; 4.1kg; M772 MTSQ fuze ; MinCharge: 1 - MaxCharge: 4; Range 4900
"81mm M375A3 WP"; 4.24kg; M524-series PD fuze; 4 Inc (215,438,608,750,879); Range: 4595 
"81mm M819 RP"; M772 PD MTSQ fuze; MC: 0 - MC: 4; Range 4950

multioption type (PRX/NSB/IMP/DLY) 
PRX PROXIMITY BURST
NSB NEAR SURFACE BURST
IMP IMPACT BURST
DLY DELAY BURST (1/2 sec)

*/

class ace_arty_m821a2_cartridge: ACE_Arty_ShellHolder { // HE
	scope = 1;
	icon = "iconThing";
	mapSize = 0;			 // iconsize on map... small object such as a tree is 0.7
	displayName = "M821A2 HE Cartridge";
	vehicleClass = "Objects";
	nameSound = "obj_object";
	picture = "pictureThing";
	class Library {libTextDesc = "";};
	descriptionShort = "";
	destrType = "DestructTree";
	weight = 1000;
	simulation = "house";
	type = 1;
	model = "\x\ace\addons\sys_arty_ammunition\81mm\ace_arty_m821a2_cartridge.p3d";
	animated = 0;
	reversed = 0;
	class EventHandlers {
		killed = "_this call ace_sys_arty_ammunition_fnc_onShellDestroyed";
	};
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_81mm_m821a2";
	ACE_ARTY_SHELL_PREP[] = {"ace_arty_81mm_m821a2_m734_pd_chg0",{0},"fnord",0,"pd"};
	ACE_Weight = 4.5;
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

class ace_arty_m853a1_cartridge : ace_arty_m821a2_cartridge { // ILLUM
	displayName = "M853A1 Illum Cartridge";
	model = "\x\ace\addons\sys_arty_ammunition\81mm\ace_arty_m853a1_cartridge.p3d";
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_81mm_m853a1";
	ACE_ARTY_SHELL_PREP[] = {"ace_arty_81mm_m853a1_m772_time_chg1",{10},"fnord",1,"time"};
	ACE_Weight = 4.1;
};

class ace_arty_m375a3_cartridge : ace_arty_m821a2_cartridge { // SMOKE (WP)
	displayName = "M375A3 WP Cartridge";
	model = "\x\ace\addons\sys_arty_ammunition\81mm\ace_arty_m375a3_cartridge.p3d";
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_81mm_m375a3";
	ACE_ARTY_SHELL_PREP[] = {"ace_arty_81mm_m375a3_m524_pd_chg0",{0},"fnord",0,"pd"};
	ACE_Weight = 4.24;
};

class ace_arty_81mm_m853a1_m772_parachute : ACE_HuntIR {
	class EventHandlers {
		EXTENDED_EVENTHANDLERS
	};
	SLX_XEH_DISABLED = 0;
};
