#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = { "ACE_Map_Tools" };
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"A3_UI_F", "ace_common", "ace_sys_interaction"};
		version = VERSION;
		author[] = {"Noubernou"};
		class ACE_Options { 						// ACE Options
			group = "ITEMS";
			title = $STR_ACE_MAPTOOLS_NAME; 							// Empty (WITH A SPACE IN BETWEEN!!!!!) if no CAPTION TEXT is wanted
			class place_ruler {						// Points to CBA Events, e.g for the keypress registered within CBA
				title = $STR_ACE_MAPTOOLS_PLACERULER;
			};
			class align_ruler {
				title = $STR_ACE_MAPTOOLS_ALIGNRULER;
			};
			class start_drawing {
				title = $STR_ACE_MAPTOOLS_STARTDRAWING;
			};
			class end_straight_line {
				title = $STR_ACE_MAPTOOLS_ENDSTRAIGHTLINE;
			};
			class delete_line {
				title = $STR_ACE_MAPTOOLS_DELETELINE;
			};
		};
	};
};

PRELOAD_ADDONS;

class CfgMarkers {
	class Empty;
	class FlatCompass: Empty {
		name="Flat Compass";
		icon=QUOTE(PATHTOF(data\rsc\flat_compass.paa));
		color[]={1,1,1,1.000000};
		size=32;
		shadow = true;
	};
	class FlatCompass50: FlatCompass {
		name="Flat Compass 50%";
		icon=QUOTE(PATHTOF(data\rsc\flat_compass_50.paa));
		color[]={1,1,1,1.000000};
		size=32;
        shadow = true;
	};
	class FlatCompass25: FlatCompass {
		name="Flat Compass 25%";
		icon=QUOTE(PATHTOF(data\rsc\flat_compass_25.paa));
		color[]={1,1,1,1.000000};
		size=32;
        shadow = true;
	};
	class FlatCompass12: FlatCompass {
		name="Flat Compass 12.5%";
		icon=QUOTE(PATHTOF(data\rsc\flat_compass_12.paa));
		color[]={1,1,1,1.000000};
		size=32;
        shadow = true;
	};
    class FlatCompassRose: Empty {
		name="Flat Compass Rose";
		icon=QUOTE(PATHTOF(data\rsc\flat_compass_rose.paa));
		color[]={1,1,1,1.000000};
		size=32;
        shadow = false;
	};
	class FlatCompassRose50: FlatCompassRose {
		name="Flat Compass Rose 50%";
		icon=QUOTE(PATHTOF(data\rsc\flat_compass_rose_50.paa));
		color[]={1,1,1,1.000000};
		size=32;
        shadow = false;
	};
	class FlatCompassRose25: FlatCompassRose {
		name="Flat Compass Rose 25%";
		icon=QUOTE(PATHTOF(data\rsc\flat_compass_rose_25.paa));
		color[]={1,1,1,1.000000};
		size=32;
        shadow = false;
	};
	class FlatCompassRose12: FlatCompassRose {
		name="Flat Compass Rose 12.5";
		icon=QUOTE(PATHTOF(data\rsc\flat_compass_rose_12.paa));
		color[]={1,1,1,1.000000};
		size=32;
        shadow = false;
	};
};

class CfgWeapons {
    class ItemCore;
    class ACE_Map_Tools: ItemCore {
		scope = 2;
		displayName = "$STR_ACE_MAPTOOLS_NAME";
		class ItemInfo {
			mass = 1;
			type = 401;
		};
		model = QPATHTO_M(ace_maptools.p3d);
		picture = QPATHTO_T(data\equip\w_maptools_ca.paa);
		descriptionShort = "$STR_ACE_MAPTOOLS_NAME";
		ACE_NOARMORY;	
	};
};

#include "CfgEventhandlers.hpp"
