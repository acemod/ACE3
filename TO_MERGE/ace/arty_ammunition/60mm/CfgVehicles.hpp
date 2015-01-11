/*
"60mm M720a1 HE"; 1.66kg M734A1 Multi-option fuze
"60mm M721 ILLUM"; 1.71kg M776 MTSQ Fuze  8mechanical time superquick9
"60mm M722a1 WP"; 1.68kg  M745 point detonating fuze

multioption type (PRX/NSB/IMP/DLY) 
PRX PROXIMITY BURST - 1 - 4 meter // random in CfgEffect 
NSB NEAR SURFACE BURST - 1 meter 
IMP IMPACT BURST
DLY DELAY BURST (1/2 sec)

*/

class ace_arty_m720a1_cartridge : ACE_Arty_ShellHolder {
	scope = 1;
	icon = "iconThing";
	mapSize = 0;			 // iconsize on map... small object such as a tree is 0.7
	displayName = "M720A1 HE Cartridge";
	vehicleClass = "Objects";
	nameSound = "obj_object";
	picture = "pictureThing";
	class Library {libTextDesc = "";};
	descriptionShort = "";
	destrType = "DestructTree";
	weight = 1000;
	simulation = "house";
	type = 1;
	model = "\x\ace\addons\sys_arty_ammunition\60mm\ace_arty_m720a1_cartridge.p3d";
	animated = 1;
	reversed = 0;
	class EventHandlers {
		killed = "_this call ace_sys_arty_ammunition_fnc_onShellDestroyed";
	};
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_60mm_m720a1";
	ACE_ARTY_SHELL_PREP[] = {"ace_arty_60mm_m720a1_m734_pd_chg0",{0},"fnord",0,"pd"};
	ACE_Weight = 1.66;
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

class ace_arty_m721_cartridge : ace_arty_m720a1_cartridge {
	displayName = "M721 Illum Cartridge";
	model = "\x\ace\addons\sys_arty_ammunition\60mm\ace_arty_m721_cartridge.p3d";
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_60mm_m721";
	ACE_ARTY_SHELL_PREP[] = {"ace_arty_60mm_m721_m776_time_chg1",{10},"fnord",1,"time"};
	ACE_Weight = 1.71;
};

class ace_arty_m722a1_cartridge : ace_arty_m720a1_cartridge {
	displayName = "M722A1 WP Cartridge";
	model = "\x\ace\addons\sys_arty_ammunition\60mm\ace_arty_m722a1_cartridge.p3d";
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_60mm_m722a1";
	ACE_ARTY_SHELL_PREP[] = {"ace_arty_60mm_m722a1_m745_pd_chg0",{0},"fnord",0,"pd"};
	ACE_Weight = 1.68;
};

class ACE_HuntIR;
class ace_arty_60mm_m721_m766_parachute : ACE_HuntIR {
	class EventHandlers {
		EXTENDED_EVENTHANDLERS
	};
	SLX_XEH_DISABLED = 0;
};
