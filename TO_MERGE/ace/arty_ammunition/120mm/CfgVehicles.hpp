/*
DM11 Spreng Aufschlagzünder DM111
DM11A1 Spreng Aufschlagzünder DM111A1
DM11A2 Spreng Aufschlagzünder DM111A1
DM11A3 Spreng Aufschlagzünder DM111A1
DM11A4 Spreng Aufschlagzünder DM111A1 oder DM111A2
*DM11A5 Spreng Aufschlagzünder DM111A1 oder DM111A2
DM51 Spreng Annäherungszünder NVT224A1
DM51A1 Spreng Annäherungszünder NVT224A1
DM61 Spreng Annäherungszünder PPD324-B3
DM81 Spreng Aufschlagzünder DM111A5
DM25A1 Nebel Aufschlagzünder DM111A1 oder DM111A2
DM25A2 Nebel Aufschlagzünder DM111A3
DM35 Nebel HC Doppelzünder DM93
DM16 Leucht PT Doppelzünder DM93
DM26 Leucht PT Doppelzünder DM93
DM18 Übung Doppelzünder DM111
DM18A1 Übung Doppelzünder DM111A1
DM18A2 Übung Doppelzünder DM111A1
DM18A3 Übung Doppelzünder DM111A1
DM18A4 Übung Doppelzünder DM111A1 oder DM111A2
DM28 Übung Doppelzünder DM111A1 oder DM111A3
DM18 Übung Doppelzünder DM93


M929 120mm Smoke WP
0: 101 m/s (102)
1: 165 m/s (168)
2: 220 m/s (224)
3: 270 m/s (274)
4: 318 m/s (322)

multioption type (PRX/NSB/IMP/DLY) 
PRX PROXIMITY BURST
NSB NEAR SURFACE BURST
IMP IMPACT BURST
DLY DELAY BURST (1/2 sec)

*/
// DM11A5 Spreng Aufschlagzünder DM111A1
class ace_arty_dm11_cartridge: ACE_Arty_ShellHolder { // HE
	scope = 1;
	icon = QPATHTO_C(120mm\data\icon_120mm_ca.paa);
	mapSize = 0;			 // iconsize on map... small object such as a tree is 0.7
	displayName = "DM 11A5 HE Cartridge";
	vehicleClass = "Objects";
	nameSound = "obj_object";
	picture = "pictureThing";
	class Library {libTextDesc = "";};
	descriptionShort = "";
	destrType = "DestructTree";
	weight = 1000;
	simulation = "house";
	type = 1;
	model = QPATHTO_M(120mm\ace_arty_dm11_cartridge.p3d);
	animated = 1;
	reversed = 0;
	class EventHandlers {
		killed = "_this call ace_sys_arty_ammunition_fnc_onShellDestroyed";
	};
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_120mm_dm11a5";
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

//DM61 Spreng Annäherungszünder PPD324-B3
class ace_arty_dm61_cartridge : ace_arty_dm11_cartridge { // ILLUM
	displayName = "DM 61 HE Cartridge";
	model = QPATHTO_M(120mm\ace_arty_dm61_cartridge.p3d);
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_120mm_dm61";
	ACE_Weight = 4.1;
};

//DM26 Leucht PT Doppelzünder DM93
class ace_arty_dm26_cartridge : ace_arty_dm11_cartridge { // ILLUM
	displayName = "DM 26 Illum Cartridge";
	model = QPATHTO_M(120mm\ace_arty_dm26_cartridge.p3d);
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_120mm_dm26";
	ACE_Weight = 4.1;
};

// DM35 Nebel HC Doppelzünder DM93
class ace_arty_dm35_cartridge : ace_arty_dm11_cartridge { // SMOKE (WP)
	displayName = "DM 35 Smoke Cartridge";
	model = QPATHTO_M(120mm\ace_arty_dm35_cartridge.p3d);
	ACE_ARTY_MAGAZINE_CLASS = "ace_arty_120mm_dm35";
	ACE_Weight = 4.24;
};

class ace_arty_120mm_dm26_dm93_parachute : ACE_HuntIR {
	class EventHandlers {
		EXTENDED_EVENTHANDLERS
	};
	SLX_XEH_DISABLED = 0;
};
