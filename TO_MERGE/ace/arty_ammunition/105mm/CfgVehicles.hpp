class ace_arty_m1_cartridge : ACE_Arty_ShellHolder {
	scope = 1;
	icon = "iconThing";
	mapSize = 0;			 // iconsize on map... small object such as a tree is 0.7
	
	displayName = "M1 HE Cartridge";
	
	vehicleClass = "Objects";
	nameSound = "obj_object";

	picture = "pictureThing";
	class Library {libTextDesc = "";};
	descriptionShort = "";

	destrType = "DestructTree";
	weight = 1000;
	simulation = "house";
	type = 1;
	
	model = "\x\ace\addons\sys_arty_ammunition\105mm\ace_arty_m1_cartridge.p3d";
	animated = false;
	reversed = false;
	class EventHandlers {
		killed = "_this call ace_sys_arty_ammunition_fnc_onShellDestroyed";
	};
	
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_105mm_m1";
};

class ace_arty_m84a1_cartridge: ace_arty_m1_cartridge {
	displayName = "M84A1 Smoke Cartridge";
	model = "\x\ace\addons\sys_arty_ammunition\105mm\ace_arty_m84a1_cartridge.p3d";
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_105mm_m84a1";
};

class ace_arty_m314a3_cartridge : ace_arty_m1_cartridge {
	displayName = "M314A3 Illum Cartridge";
	model = "\x\ace\addons\sys_arty_ammunition\105mm\ace_arty_m314a3_cartridge.p3d";
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_105mm_m314a3";
};

class ace_arty_m916_cartridge : ace_arty_m1_cartridge {
	displayName = "M916 DPICM Cartridge";
	model = "\x\ace\addons\sys_arty_ammunition\105mm\ace_arty_m916_cartridge.p3d";
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_105mm_m916";
};

class ace_arty_m60a2_cartridge : ace_arty_m1_cartridge {
	displayName = "M602A2 WP Cartridge";
	model = "\x\ace\addons\sys_arty_ammunition\105mm\ace_arty_m60a2_cartridge.p3d";
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_105mm_m60a2";
};
class ACE_UsedTubes;
class ace_arty_m14_casing : ACE_UsedTubes {
	model = "\x\ace\addons\sys_arty_ammunition\105mm\ace_arty_m14_casing.p3d";
};

class ace_arty_105mm_m314a3_m782_parachute : ACE_HuntIR {
	class EventHandlers {
		EXTENDED_EVENTHANDLERS
	};
	SLX_XEH_DISABLED = 0;
}; // Defined in 60mm
