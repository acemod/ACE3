class CfgVehicles {
	// TODO: add more cases ?
	class All;
	class Land;
	class Man: Land { ACE_NOCARGOLOAD; };
	class LandVehicle: Land { ACE_LOAD_ONLY; };
	class Tank: LandVehicle { ACE_GEAR_ONLY; }; // Tank must be also ACE_LOAD_ONLY, because some obvious APCs like Bradley are inherited from class Tank instead of Tracked_APC
	// TODO: Add exceptions for real class Tank !!
	//class T72_Base: Tank
	//class ZSU_Base: Tank
	//class M1A1: Tank
	//class T34: Tank
	//class MLRS: Tank
	//class 2S6M_Tunguska: Tank
	//class M113_Base: Tank { ACE_LOAD_ONLY; };
	//class M2A2_Base: Tank { ACE_LOAD_ONLY; };
	//class T55_Base: Tank
	//class BAF_FV510_D: Tank { ACE_LOAD_ONLY; };

	class Tracked_APC: Tank { ACE_LOAD_ONLY;	};
	class Car: LandVehicle { ACE_LOAD_ONLY; };
	//class BIS_alice_emptydoor: Car { ACE_NOCARGOLOAD; }; // FU DOOR
	class PaperCar: Car { ACE_NOCARGOLOAD; };
	class Wheeled_APC: Car {	ACE_LOAD_ONLY; };
	class Motorcycle: Landvehicle {	ACE_CARGO_ONLY;	};
	class StaticWeapon: LandVehicle { ACE_CARGO_ONLY; };
	//class StaticCanon: StaticWeapon { ACE_NOCARGOLOAD; };
	class Air;
	class Helicopter: Air {	ACE_LOAD_ONLY; };
	class ParachuteBase: Helicopter { ACE_NOCARGOLOAD; };
	class Plane: Air { ACE_LOAD_ONLY; };
	class Ship;
	class SmallShip: Ship {	ACE_LOAD_ONLY; };
	class BigShip: Ship { ACE_LOAD_ONLY; };
	class Ship_F;
	class Boat_F: Ship_F { ACE_LOAD_ONLY; };
	
	class Rubber_duck_base_F: Boat_F {
		ACE_CARGO_ONLY;
		ACE_Weight = 260;
	};
	class Boat_Armed_01_base_F: Boat_F {	ACE_LOAD_ONLY; };
	class Static: All { ACE_NOCARGOLOAD; };
	class Strategic;
	class ReammoBox: Strategic { ACE_CARGO_ONLY; };
	class Library_WeaponHolder: Strategic {	ACE_NOCARGOLOAD; };
	class WeaponHolder: ReammoBox {	ACE_NOCARGOLOAD; };
	class Thing: All { ACE_NOCARGOLOAD; }; 
	class Wreck: Thing { ACE_NOCARGOLOAD; };
	class ACE_Object: Thing { ACE_NOCARGOLOAD; };

	// TODO: Move to another hpp file
	class thingX: Thing { ACE_NOCARGOLOAD; }; 
	class RoadCone_F: thingX  { ACE_CARGO_ONLY; ACE_Weight = 1; };
	class FloatingStructure_F;
	class RoadCone_L_F: FloatingStructure_F { ACE_CARGO_ONLY; ACE_Weight = 1; };
	
	
	
	class ReammoBox_F: thingX { ACE_CARGO_ONLY; };
	/*class FoldChair: Thing { 
		ACE_CARGO_ONLY; 
		ACE_Weight = 1;
		class Useractions {
			class Sit {
				displayname = "Sit";
				radius = 2;
				position = "Component1";
				onlyforPlayer = 1;
				condition = "alive this";
				statement= "player setPosASL getPosASL this; player setDir ((getDir this)+90); player switchMove 'ACE_CoolSit'; player call ace_sys_cargo_fnc_standup";
			};
		};
	};*/
	
	// TODO: Add more stuff, like RoadCones, BarbedWire, Other small items to be carried
	// Stuff that is to be CARRIED:
	/*
		- Arty Shells - done
		- Fuel Can - done 
		- RoadCone -done
		- Signs (TODO: Need to specify which ones)
		- Barbed wire (TODO: Need rolled model to be unrolles for sys_razorwire or so)
		- Sparewheel for small cars
		- Suitcase
		- 
		- Anything that comes to mind then
	*/
};
