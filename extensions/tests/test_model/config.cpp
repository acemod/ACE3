//config.cpp

class CfgPatches
{
	class nou_sys_snow
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Data_F"};
	};
};

class CfgVehicles {
	class House;
	class nou_test_model: House
	{
		author = "Nou";
		_generalMacro = "nou_snow_2x2";
		scope = 2;
		model = "\x\nou\addons\test_model\test.p3d";
		vehicleClass = "Structures";
		cost = 50000;
		replaceDamagedLimit = 0.99999;
		class AnimationSources {
			class box1																																					
			{
				source = "user";
				animPeriod = 0.0001; 
				initPhase = 0;
				minValue = 0;
				maxValue = 3;
			};
			class box2																																					
			{
				source = "user";
				animPeriod = 0.0001; 
				initPhase = 0;
				minValue = -1;
				maxValue = 1;
			};
			class box3_translate																																					
			{
				source = "user";
				animPeriod = 0.0001; 
				initPhase = 0;
				minValue = -10;
				maxValue = 10;
			};
			class box3_rotate																																					
			{
				source = "user";
				animPeriod = 0.0001; 
				initPhase = 0;
				minValue = 0;
				maxValue = 1;
			};
		};
	};

};