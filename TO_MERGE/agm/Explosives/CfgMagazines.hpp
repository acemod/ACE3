class CfgMagazines {
	class CA_Magazine;
	class ATMine_Range_Mag:CA_Magazine{
		AGM_Placeable = 1;
		useAction = 0;
		AGM_SetupObject = "AGM_Explosives_Place_ATMine"; // CfgVehicle class for setup object.
		AGM_DelayTime = 2.5;
		class AGM_Triggers {
			AGM_Triggers[] = {"PressurePlate"};
			class PressurePlate {
				digDistance = 0.1;
			};
		};
	};
	class APERSBoundingMine_Range_Mag:ATMine_Range_Mag{
		AGM_SetupObject = "AGM_Explosives_Place_APERSBoundingMine";
		class AGM_Triggers {
			AGM_Triggers[] = {"PressurePlate"};
			class PressurePlate {
				digDistance = 0.075;
			};
		};
	};
	class APERSMine_Range_Mag:ATMine_Range_Mag{
		AGM_SetupObject = "AGM_Explosives_Place_APERSMine";
		class AGM_Triggers {
			AGM_Triggers[] = {"PressurePlate"};
			class PressurePlate {
				digDistance = 0.05;
			};
		};
	};
	class APERSTripMine_Wire_Mag:ATMine_Range_Mag{
		AGM_SetupObject = "AGM_Explosives_Place_APERSTripwireMine";
		class AGM_Triggers {
			AGM_Triggers[] = {"Tripwire"};
			class Tripwire;
		};
	};
	
	class ClaymoreDirectionalMine_Remote_Mag:CA_Magazine{
		AGM_Placeable = 1;
		useAction = 0;
		AGM_SetupObject = "AGM_Explosives_Place_Claymore"; // CfgVehicle class for setup object.
		AGM_DelayTime = 1.5;
		class AGM_Triggers {
			AGM_Triggers[] = {"Command"};
			class Command {
				FuseTime = 0.5;
			};
		};
	};
	
	class SatchelCharge_Remote_Mag:CA_Magazine{
		AGM_Placeable = 1;
		useAction = 0;
		AGM_SetupObject = "AGM_Explosives_Place_SatchelCharge"; // CfgVehicle class for setup object.
		AGM_DelayTime = 1;
		class AGM_Triggers {
			AGM_Triggers[] = {"Timer","Command", "MK16_Transmitter", "DeadmanSwitch"};
			class Timer {
				FuseTime = 0.5;
			};
			class Command {
				FuseTime = 0.5;
			};
			class MK16_Transmitter:Command{};
			class DeadmanSwitch:Command{};
		};
	};
	class DemoCharge_Remote_Mag:SatchelCharge_Remote_Mag{
		AGM_SetupObject = "AGM_Explosives_Place_DemoCharge"; // CfgVehicle class for setup object.
		model = "\A3\Weapons_F\explosives\c4_charge_small_d";
	};
	
	class SLAMDirectionalMine_Wire_Mag: ATMine_Range_Mag{
		AGM_SetupObject = "AGM_Explosives_Place_SLAM";
		class AGM_Triggers {
			AGM_Triggers[] = {"IRSensor","PressurePlate","Timer","Command"};
			class PressurePlate{
				displayName = $STR_AGM_Explosives_SLAME_Magnetic;
				digDistance = 0;
				ammo = "SLAMDirectionalMine_Magnetic_Ammo";
				pitch = 90;
			};
			class IRSensor{
				displayName = $STR_AGM_Explosives_SLAME_IRSensor;
			};
			class Timer {
				ammo = "SLAMDirectionalMine_Timer_Ammo";
			};
			class Command {
				ammo = "SLAMDirectionalMine_Command_Ammo";
				fuseTime = 0.5;
			};
		};
	};
};

class CfgAGM_Triggers {
/* onPlace parameters:
	0: OBJECT - unit placing
	1: OBJECT - Placed explosive
	2: STRING - Magazine classname
	3: ARRAY - vars
		Last Index: CfgAGM_Triggers config of trigger type.
  onSetup parameters:
	0: STRING - Magazine Classname
*/
	class Command {
		displayName = $STR_AGM_Explosives_clacker_displayName;
		picture = "\AGM_Explosives\Data\UI\Clacker.paa";
		onPlace = "_this call AGM_Explosives_fnc_AddClacker;false";
		requires[] = {"AGM_Clacker"};
	};
	class MK16_Transmitter:Command {
		displayName = $STR_AGM_Explosives_MK16_displayName;
		picture = "\AGM_Explosives\Data\UI\MK16_Reciever_ca.paa";
		requires[] = {"AGM_M26_Clacker"};
	};
	class DeadManSwitch:Command {
		displayName = $STR_AGM_Explosives_DeadManSwitch_displayName;
		picture = "\AGM_Explosives\Data\UI\DeadmanSwitch.paa";
		requires[] = {"AGM_DeadManSwitch"};
	};
	class PressurePlate {
		displayName = $STR_AGM_Explosives_PressurePlate;
		picture = "AGM_Explosives\data\UI\Pressure_plate.paa";
		onPlace = "_dist=GetNumber(ConfigFile >> 'CfgMagazines' >> (_this select 2) >> 'AGM_Triggers' >> 'PressurePlate' >> 'digDistance');_ex=_this select 1;_ex setPosATL ((getPosATL _ex) vectorDiff ((VectorUp _ex) vectorCrossProduct [0,0,_dist]));false";
	};
	class IRSensor {
		displayName = $STR_AGM_Explosives_IRSensor;
		picture = "AGM_Explosives\data\UI\Pressure_plate.paa";
		onPlace = "false";
	};
	class Timer {
		displayName = $STR_AGM_Explosives_timerName;
		picture = "AGM_Explosives\data\UI\Timer.paa";
		onPlace = "[_this select 1, (_this select 3) select 0] call AGM_Explosives_fnc_startTimer;false";
		onSetup = "_this call AGM_Explosives_fnc_openTimerSetUI;true";
	};
	class Tripwire {
		displayName = $STR_AGM_Explosives_TripWire;
		picture = "AGM_Explosives\data\UI\Tripwire.paa";
		onPlace = "false";
	};
};

class CfgMineTriggers {
	class RangeTrigger;
	class MagneticTrigger: RangeTrigger {
		mineMagnetic = 1;
		mineTriggerRange = 1;
	};
};
