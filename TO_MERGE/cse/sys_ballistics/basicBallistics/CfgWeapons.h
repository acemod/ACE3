class CfgWeapons {
	class Default;
	class cse_weather_meter: Default {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Weather Meter";
		picture = "\cse\cse_sys_ballistics\basicBallistics\data\weatherMeter.paa";
		descriptionShort = "Provides information about weather and wind";
		descriptionUse = "Provides information about humidity, wind speed, direction and strenght.";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		simulation = "Weapon";
		class ItemInfo
		{
			mass = 10;
		};
	};

};