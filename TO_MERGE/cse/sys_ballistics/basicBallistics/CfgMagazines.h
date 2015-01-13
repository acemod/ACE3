class CfgMagazines {
	class Default;
	class CA_magazine: Default{};
	class cse_weather_meter: CA_magazine {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		displayName = "Weather Meter (GREEN)";
		picture = "\cse\cse_sys_ballistics\basicBallistics\data\pocket_weather_meter_day_green.paa";
		descriptionShort = "Provides information about weather and wind";
		descriptionUse = "Provides information about humidity, wind speed, direction and strenght.";
		mass = 5;
	};
};