#define FUSEE_TIME_TO_LIVE 	600
#define FUSEE_FLARE_SIZE 	2
#define FUSEE_INTENSITY		3000

#define FLARE_TIME_TO_LIVE	60
#define FLARE_SIZE 			10
#define FLARE_INTENSITY		4000

class cfgAmmo {
	class F_20mm_White;
	class F_20mm_Red: F_20mm_White {};
	class F_20mm_Yellow: F_20mm_White {};
	class F_20mm_Green: F_20mm_White {};

	class CSE_FuseeWhite: F_20mm_White {
		intensity = FUSEE_INTENSITY;
		flareSize = FUSEE_FLARE_SIZE;
		timeToLive = FUSEE_TIME_TO_LIVE;
		airFriction = -0.0005;
		thrust = 210;
		thrustTime = 1.5;
	};
	class CSE_FuseeRed: F_20mm_Red {
		intensity = FUSEE_INTENSITY;
		flareSize = FUSEE_FLARE_SIZE;
		timeToLive = FUSEE_TIME_TO_LIVE;
		airFriction = -0.0005;
		thrust = 210;
		thrustTime = 1.5;
	};
	class CSE_FuseeYellow: F_20mm_Yellow {
		intensity = FUSEE_INTENSITY;
		flareSize = FUSEE_FLARE_SIZE;
		timeToLive = FUSEE_TIME_TO_LIVE;
		airFriction = -0.0005;
		thrust = 210;
		thrustTime = 1.5;
	};
	class CSE_FuseeGreen: F_20mm_Green {
		intensity = FUSEE_INTENSITY;
		flareSize = FUSEE_FLARE_SIZE;
		timeToLive = FUSEE_TIME_TO_LIVE;
		airFriction = -0.0005;
		thrust = 210;
		thrustTime = 1.5;
	};


	class CSE_FlareWhite: F_20mm_White {
		intensity = FLARE_INTENSITY;
		flareSize = FLARE_SIZE;
		timeToLive = FLARE_TIME_TO_LIVE;
		airFriction = -0.0005;
		thrust = 210;
		thrustTime = 1.5;
	};
	class CSE_FlareRed: F_20mm_Red {
		intensity = FLARE_INTENSITY;
		flareSize = FLARE_SIZE;
		timeToLive = FLARE_TIME_TO_LIVE;
		airFriction = -0.0005;
		thrust = 210;
		thrustTime = 1.5;
	};
	class CSE_FlareYellow: F_20mm_Yellow {
		intensity = FLARE_INTENSITY;
		flareSize = FLARE_SIZE;
		timeToLive = FLARE_TIME_TO_LIVE;
		airFriction = -0.0005;
		thrust = 210;
		thrustTime = 1.5;
	};	
	class CSE_FlareGreen: F_20mm_Green {
		intensity = FLARE_INTENSITY;
		flareSize = FLARE_SIZE;
		timeToLive = FLARE_TIME_TO_LIVE;
		airFriction = -0.0005;
		thrust = 210;
		thrustTime = 1.5;
	};
};


class CfgMagazines {
	class HandGrenade;
	class CSE_Flare_Base: HandGrenade {
		value = 2;
		nameSoundWeapon = "smokeshell";
		nameSound = "smokeshell";
		mass = 4;
		initSpeed = 22;
	};
	class CSE_FlareWhite: CSE_Flare_Base {
		ammo = "CSE_FlareWhite";
		displayname = $STR_CSE_FLARE_WHITE;
		descriptionshort = $STR_CSE_FLARE_WHITE;
		displayNameShort = $STR_CSE_FLARE_WHITE;
		model = "\A3\weapons_f\ammo\flare_white";
		picture = "\A3\Weapons_F\Data\UI\gear_flare_white_ca.paa";
	};
	class CSE_FlareRed: CSE_Flare_Base {
		ammo = "CSE_FlareRed";
		displayname = $STR_CSE_FLARE_RED;
		descriptionshort = $STR_CSE_FLARE_RED;
		displayNameShort = $STR_CSE_FLARE_RED;
		model = "\A3\weapons_f\ammo\flare_red";
		picture = "\A3\Weapons_F\Data\UI\gear_flare_red_ca.paa";
	};
	class CSE_FlareYellow: CSE_Flare_Base {
		ammo = "CSE_FlareYellow";
		displayname = $STR_CSE_FLARE_YELLOW;
		descriptionshort = $STR_CSE_FLARE_YELLOW;
		displayNameShort = $STR_CSE_FLARE_YELLOW;
		model = "\A3\weapons_f\ammo\flare_yellow";
		picture = "\A3\Weapons_F\Data\UI\gear_flare_yellow_ca.paa";
	};
	class CSE_FlareGreen: CSE_Flare_Base {
		ammo = "CSE_FlareGreen";
		displayname = $STR_CSE_FLARE_GREEN;
		descriptionshort = $STR_CSE_FLARE_GREEN;
		displayNameShort = $STR_CSE_FLARE_GREEN;
		model = "\A3\weapons_f\ammo\flare_green";
		picture = "\A3\Weapons_F\Data\UI\gear_flare_green_ca.paa";
	};


	class CSE_RoadFlareWhite: CSE_Flare_Base {
		ammo = "CSE_FuseeWhite";
		displayname = $STR_CSE_ROAD_FLARE_WHITE;
		descriptionshort = $STR_CSE_ROAD_FLARE_WHITE;
		displayNameShort = $STR_CSE_ROAD_FLARE_WHITE;
		model = "\A3\weapons_f\ammo\flare_white";
		picture = "\A3\Weapons_F\Data\UI\gear_flare_white_ca.paa";
	};
	class CSE_RoadFlareRed: CSE_Flare_Base {
		ammo = "CSE_FuseeRed";
		displayname = $STR_CSE_ROAD_FLARE_RED;
		descriptionshort = $STR_CSE_ROAD_FLARE_RED;
		displayNameShort = $STR_CSE_ROAD_FLARE_RED;
		model = "\A3\weapons_f\ammo\flare_red";
		picture = "\A3\Weapons_F\Data\UI\gear_flare_red_ca.paa";
	};
	class CSE_RoadFlareYellow: CSE_Flare_Base {
		ammo = "CSE_FuseeYellow";
		displayname = $STR_CSE_ROAD_FLARE_YELLOW;
		descriptionshort = $STR_CSE_ROAD_FLARE_YELLOW;
		displayNameShort = $STR_CSE_ROAD_FLARE_YELLOW;
		model = "\A3\weapons_f\ammo\flare_yellow";
		picture = "\A3\Weapons_F\Data\UI\gear_flare_yellow_ca.paa";
	};	
	class CSE_RoadFlareGreen: CSE_Flare_Base {
		ammo = "CSE_FuseeGreen";
		displayname = $STR_CSE_ROAD_FLARE_GREEN;
		descriptionshort = $STR_CSE_ROAD_FLARE_GREEN;
		displayNameShort = $STR_CSE_ROAD_FLARE_GREEN;
		model = "\A3\weapons_f\ammo\flare_green";
		picture = "\A3\Weapons_F\Data\UI\gear_flare_green_ca.paa";
	};
};