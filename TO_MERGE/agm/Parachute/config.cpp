class CfgPatches {
	class AGM_Parachute {
		units[] = {"AGM_NonSteerableParachute"};
		weapons[] = {"AGM_Altimeter"};
		requiredVersion = 0.60;
		requiredAddons[] = {AGM_Core};
		version = "0.95";
		versionStr = "0.95";
		versionAr[] = {0,95,0};
		author[] = {"Garth 'LH' de Wet"};
	};
};

class CfgFunctions {	
	class AGM_Parachute {
		class AGM_Parachute {
			file = "\AGM_Parachute\functions";
			class onEachFrame;
			class doLanding;
			class hideAltimeter;
			class showAltimeter;
		};
	};
};

class Extended_PostInit_EventHandlers {
  class AGM_Parachute {
    clientInit = "call compile preprocessFileLineNumbers '\AGM_Parachute\clientInit.sqf';";
  };
};

class AGM_Core_Default_Keys {
	class showAltimeterNew {
		displayName = "$STR_AGM_Parachute_showAltimeter";
		condition = "'AGM_Altimeter' in assignedItems _player";
		statement = "if (isNull (missionNamespace getVariable ['AGM_Parachute_AltimeterFnc', scriptNull])) then {[_player] call AGM_Parachute_fnc_showAltimeter} else {call AGM_Parachute_fnc_hideAltimeter}";
		exceptions[] = {"AGM_Drag_isNotDragging", "AGM_Medical_canTreat", "AGM_Interaction_isNotEscorting"};
		key = 24;
		shift = 0;
		control = 0;
		alt = 0;
	};
};

#include "RscTitles.hpp"

class CfgWeapons {
	class ItemWatch;
	class AGM_Altimeter:ItemWatch {
		author = "$STR_AGM_Core_AGMTeam";
		descriptionShort = "$STR_AGM_Parachute_AltimeterDescription";
		displayName = "$STR_AGM_Parachute_AltimeterDisplayName";
		picture = "\AGM_Parachute\UI\watch_altimeter.paa";
	};
};

class CfgVehicles {
	class Box_NATO_Support_F;
	class AGM_Box_Misc: Box_NATO_Support_F {
		class TransportItems {
			class _xx_AGM_Altimeter {
				name = "AGM_Altimeter";
				count = 6;
			};
		};
		class TransportBackpacks {
			class _xx_AGM_NonSteerableParachute {
				backpack = "AGM_NonSteerableParachute";
				count = 4;
			};
		};
	};

	class B_Parachute;
	class AGM_NonSteerableParachute: B_Parachute {
		author = "$STR_AGM_Core_AGMTeam";
		scope = 2;
		displayName = "$STR_AGM_Parachute_NonSteerableParachute";
		//picture = "\A3\Characters_F\data\ui\icon_b_parachute_ca.paa";	// @todo
		//model = "\A3\Weapons_F\Ammoboxes\Bags\Backpack_Parachute";	// @todo
		backpackSimulation = "ParachuteNonSteerable";	//ParachuteSteerable
		ParachuteClass = "NonSteerable_Parachute_F";
		maximumLoad = 0;
		mass = 100;
	};

	class B_Soldier_05_f; class B_Pilot_F: B_Soldier_05_f {backpack = "AGM_NonSteerableParachute";};
	class I_Soldier_04_F; class I_pilot_F: I_Soldier_04_F {backpack = "AGM_NonSteerableParachute";};
	class O_helipilot_F; class O_Pilot_F: O_helipilot_F {backpack = "AGM_NonSteerableParachute";};
};
