class CfgWeapons {
	class GrenadeLauncher;
	class Throw: GrenadeLauncher {
		muzzles[] += {"CSE_FlareWhiteMuzzle", "CSE_FlareRedMuzzle", "CSE_FlareGreenMuzzle", "CSE_FlareYellowMuzzle", "CSE_RoadFlareWhiteMuzzle", "CSE_RoadFlareRedMuzzle", "CSE_RoadFlareGreenMuzzle", "CSE_RoadFlareYellowMuzzle"};
		class ThrowMuzzle;
		class CSE_FlareWhiteMuzzle: ThrowMuzzle {
			magazines[] = {"CSE_FlareWhite"};
		};
		class CSE_FlareRedMuzzle: ThrowMuzzle {
			magazines[] = {"CSE_FlareRed"};
		};
		class CSE_FlareGreenMuzzle: ThrowMuzzle {
			magazines[] = {"CSE_FlareGreen"};
		};
		class CSE_FlareYellowMuzzle: ThrowMuzzle {
			magazines[] = {"CSE_FlareYellow"};
		};

		class CSE_RoadFlareWhiteMuzzle: ThrowMuzzle {
			magazines[] = {"CSE_RoadFlareWhite"};
		};
		class CSE_RoadFlareRedMuzzle: ThrowMuzzle {
			magazines[] = {"CSE_RoadFlareRed"};
		};
		class CSE_RoadFlareGreenMuzzle: ThrowMuzzle {
			magazines[] = {"CSE_RoadFlareGreen"};
		};
		class CSE_RoadFlareYellowMuzzle: ThrowMuzzle {
			magazines[] = {"CSE_RoadFlareYellow"};
		};
	};
	
	class Rifle_Base_F;
	class Rifle_Long_Base_F;
	class arifle_MX_Base_F;
	class arifle_MX_SW_F: arifle_MX_Base_F
	{
		cse_bipod = 1;
	};
	class LMG_Mk200_F: Rifle_Base_F
	{
		cse_bipod = 1;
	};
	class LMG_Zafir_F: Rifle_Base_F
	{
		cse_bipod = 1;
	};
	class LRR_base_F: Rifle_Long_Base_F
	{
		cse_bipod = 1;
	};
	class GM6_base_F: Rifle_Long_Base_F
	{
		cse_bipod = 1;
	};	
};