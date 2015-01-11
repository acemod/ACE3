class CfgVehicles {
	class AllVehicles;
	
	class Air: AllVehicles {
		class Turrets;
	};
	class Helicopter: Air
	{
		class Turrets: Turrets {
			class MainTurret;
		};
		commanderCanSee = 2+32;
		gunnerCanSee = 2+32;
		driverCanSee = 2+32;

	};
	class Helicopter_Base_F: Helicopter {
		class Turrets: Turrets {
			class MainTurret: MainTurret {};
		};
	};
	class Heli_Attack_01_base_F: Helicopter_Base_F {
		class Turrets: Turrets {
			class MainTurret: MainTurret {};
		};
	};
	class B_Heli_Attack_01_F: Heli_Attack_01_base_F {
		driverCanEject = 1;
		class Turrets: Turrets {
			class MainTurret: MainTurret {
				stabilizedInAxes = 4;
			};
		};
	};
};