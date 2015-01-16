class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
		};
	};
	class cse_sys_cc: Module_F
	{
		scope = 2; 
		displayName = "Command and Control [CSE]";
		icon = "\cse\cse_main\data\cse_cc_module.paa";
		category = "cseCCModule";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		author = "Combat Space Enhancement";
		class Arguments {
			class allowFeeds {
				displayName = "Enable Live Feeds";
				description = "Enable Live Feeds & UAV control"; 
				typeName = "BOOL";
				defaultValue = true;
			};			
			class showUAV {
				displayName = "UAVs on BFT";
				description = "Automatically show UAVs on the BFT Map"; 
				typeName = "BOOL";
				defaultValue = true;
			};
			class uavRestriction {
				displayName = "Restrict UAV Feeds";
				description = "Should UAV Feeds be restricted"; 
				typeName = "BOOL";
				defaultValue = false;
			};
			class allowVehicleDisplays {
				displayName = "Vehicle Display";
				description = "Allow Vehicle Displays"; 
				typeName = "BOOL";
				defaultValue = false;
			};
			class autoAssignCallSigns {
				displayName = "Auto Assign Callsigns";
				description = "Automatically assign callsigns for units"; 
				typeName = "NUMBER";
				defaultValue = -1;
				class values {
					class disabled {name="Disabled"; value=-1; default=1; };
					class all {name="All"; value = 0; };
					class vehicles {name="Vehicles only"; value = 1; };
					class groups {name="Groups Only"; value = 2; };
				};
			};
			class allowDisplayOnMainMap {
				displayName = "Allow Main Map";
				description = "Allow CC to be used on the main map"; 
				typeName = "BOOL";
				defaultValue = false;
			};
		};
	};

	class cse_assignTrackerInfo_CC: Module_F
	{
		scope = 2; 
		displayName = "Assign BFT Information [CSE]";
		icon = "\cse\cse_main\data\cse_cc_module.paa";
		category = "cseCCModule";
		function = "cse_fnc_assignTrackerInfo_CC";
		functionPriority = 1;
		isGlobal = 2;
		isTriggerActivated = 0;
		isDisposable = 0;
		author = "Combat Space Enhancement";
		class Arguments
		{
			class EnableList {
				displayName = "List";
				description = "List of unit names that will be used for assigning the BFT information, separated by commas.";
				defaultValue = "";
			};

			class type
  			{
				displayName = "Type of Icon";
				description = "What icon is being displayed on BFT"; 
				typeName = "STRING";
				class values {
					class Infantry {name="Infantry"; value="Infantry"; default=1; };
					class Motorized {name="Motorized"; value="Motorized";};
					class Plane {name="Plane"; value="Plane";};
					class Helicopter {name="Helicopter"; value="Helicopter";};
					class Armor {name="Armor"; value="Armor";};
					class Naval {name="Naval"; value="Naval";};
					class HQ {name="HQ"; value="HQ";};
					class Medical {name="Medical"; value="Medical";};
					class Maintanance {name="Maintanance"; value="Maintanance";};
					class Artillery {name="Artillery"; value="Artillery";};
					class Mortar {name="Mortar"; value="Mortar";};
					class Service {name="Service"; value="Service";};
					class Recon {name="Recon"; value="Recon";};
					class Mechanized {name="Mechanized"; value="Mechanized";};
					class uav {name="uav"; value="uav";};
				};
			};
			class callSign
  			{
				displayName = "Call Sign";
				description = "The Call Sign being displayed on BFT"; 
				typeName = "STRING";
				defaultValue = "";
			};
		};
		class ModuleDescription {
			description = "Sync this module to objects to assign tracker information. <br /> Please be aware that synchronizing this to JIP players does not work currently. <br />Visit our wiki (wiki.csemod.com) for more information."; 
			sync[] = {"Car","Air", "Amoured"};
		};			
	};
	class cse_placeIntelMarker_CC: Module_F
	{
		scope = 2;
		displayName = "Place SALUTE Report[CSE]"; 
		icon = "\cse\cse_main\data\cse_cc_module.paa";
		category = "cseCCModule";
		function = "cse_fnc_modulePlaceIntelMarker_CC";
		functionPriority = 1;
		isGlobal = 0;
		isTriggerActivated = 0;
		author = "Combat Space Enhancement";
		class Arguments
		{
			class Type
  			{
				displayName = "Type of Icon";
				description = "What icon is being displayed on BFT"; 
				typeName = "STRING";
				class values {
					class Infantry {name="Infantry"; value="Infantry"; default=1; };
					class Motorized {name="Motorized"; value="Motorized";};
					class Plane {name="Plane"; value="Plane";};
					class Helicopter {name="Helicopter"; value="Helicopter";};
					class Armor {name="Armor"; value="Armor";};
					class Naval {name="Naval"; value="Naval";};
					class HQ {name="HQ"; value="HQ";};
					class Medical {name="Medical"; value="Medical";};
					class Maintanance {name="Maintanance"; value="Maintanance";};
					class Artillery {name="Artillery"; value="Artillery";};
					class Mortar {name="Mortar"; value="Mortar";};
					class Service {name="Service"; value="Service";};
					class Recon {name="Recon"; value="Recon";};
					class Mechanized {name="Mechanized"; value="Mechanized";};
					class uav {name="uav"; value="uav";};
				};
			};
			class Side
			{
				displayName = "Side";
				description = "Side of the marker icon (Visual)";
				typeName = "STRING";
				class values {
					class BLUFOR {name="BLUFOR"; value="BLUFOR"; default=1;};
					class OPFOR {name="OPFOR"; value="OPFOR";};
					class GREENFOR {name="GREENFOR"; value="GREENFOR";};
					class UNKNOWN {name="UNKNOWN"; value="UNKNOWN";};
				};
			};
			class Direction 
			{
				displayName = "Direction";
				description = "Which direction is the moment";
				typeName = "STRING";
				class values {
					class Static {name="Static"; value="Static"; default=1;};
					class North {name="North"; value="North";};
					class NorthEast {name="North East"; value="North East";};
					class East {name="East"; value="East";};
					class SouthEast {name="South East"; value="South East";};
					class South {name="South"; value="South";};
					class SouthWest {name="South West"; value="South West";};
					class West {name="West"; value="West";};
					class NorthWest {name="North West"; value="North West";};
				};
			};
			class Size
			{
				displayName = "Size";
				description = "What is the amount of Units spotted";
				typeName = "STRING";
				class values {
					class Building {name="Building"; value="Building"; default=1;};
					class Fortication {name="Fortication"; value="Fortication";};
					class Pax {name="Pax"; value="Pax";};
					class FireTeam {name="Fire Team"; value="Fire Team";};
					class Section {name="Section"; value="Section";};
					class Platoon {name="Platoon"; value="Platoon";};
					class Company {name="Company"; value="Company";};
					class Battalion {name="Battalion"; value="Battalion";};
					class Regiment {name="Regiment"; value="Regiment";};
					class Brigade {name="Brigade"; value="Brigade";};					
				};
			};
			class Number
			{
				displayName = "Number";
				description = "What is the amount of Units spotted";
				typeName = "STRING";
				class values {
					class One {name="1x"; value="1x"; default=1;};
					class Two {name="2x"; value="2x";};			
					class Three {name="3x"; value="3x";};	
					class Four {name="4x"; value="4x";};	
					class Five {name="5x"; value="5x";};	
					class Six {name="6x"; value="6x";};		
					class Seven {name="7x"; value="7x";};		
				};
			};
			class Note
  			{
				displayName = "Note";
				description = "Note for Salute Report"; 
				typeName = "STRING";
				defaultValue = "";
			};
			class PlacementSide
			{
				displayName = "Placement Side";
				description = "Side for which the marker will be placed.";
				typeName = "STRING";
				class values {
					class BLUFOR {name="BLUFOR"; value="west"; default=1;};
					class OPFOR {name="OPFOR"; value="east";};
					class GREENFOR {name="Independent"; value="independent";};
				};
			};

		};
	};	


	class Item_Base_F;
	class cse_m_tabletItem: Item_Base_F
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "Military Tablet (NATO)";
		author = "Combat Space Enhancement";
		vehicleClass = "Items";
		class TransportItems
		{
			class cse_m_tablet
			{
				name = "cse_m_tablet";
				count = 1;
			};
		};
	};
	class cse_m_pdaItem: Item_Base_F
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "Military PDA (NATO)";
		author = "Combat Space Enhancement";
		vehicleClass = "Items";
		class TransportItems
		{
			class cse_m_pda
			{
				name = "cse_m_pda";
				count = 1;
			};
		};
	};
	class cse_m_tablet_uk_Item: Item_Base_F
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "Military Tablet (UK)";
		author = "Combat Space Enhancement";
		vehicleClass = "Items";
		class TransportItems
		{
			class cse_m_tablet_uk
			{
				name = "cse_m_tablet_uk";
				count = 1;
			};
		};
	};
	class cse_m_tablet_o_Item: Item_Base_F
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "Military Tablet (OPFOR)";
		author = "Combat Space Enhancement";
		vehicleClass = "Items";
		class TransportItems
		{
			class cse_m_tablet_o
			{
				name = "cse_m_tablet_o";
				count = 1;
			};
		};
	};
	class cse_m_pda_o_Item: Item_Base_F
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "Military PDA (OPFOR)";
		author = "Combat Space Enhancement";
		vehicleClass = "Items";
		class TransportItems
		{
			class cse_m_pda_o
			{
				name = "cse_m_pda_o";
				count = 1;
			};
		};
	};

	class NATO_Box_Base;
	class cse_ccItems_W : NATO_Box_Base {
		scope = 2;
		accuracy = 1000;
		displayName = "CC Devices [NATO] (CSE)";
		model = "\A3\weapons_F\AmmoBoxes\AmmoBox_F";
		author = "Combat Space Enhancement";
		class TransportItems {
			class cse_m_tablet {
				name = "cse_m_tablet";
				count = 5;
			};
			class cse_m_pda {
				name = "cse_m_pda";
				count = 5;
			};
		};
	};	
	class cse_ccItems_O: cse_ccItems_W {
		displayName = "CC Devices [OPFOR] (CSE)";
		class TransportItems {
			class cse_m_tablet_o {
				name = "cse_m_tablet_o";
				count = 5;
			};
			class cse_m_pda_o {
				name = "cse_m_pda_o";
				count = 5;
			};
		};
	};	
	class cse_ccItems_G: cse_ccItems_W {
		displayName = "CC Devices [IND] (CSE)";
		class TransportItems {
			class cse_m_tablet_g {
				name = "cse_m_tablet_g";
				count = 5;
			};
			class cse_m_pda_g {
				name = "cse_m_pda_g";
				count = 5;
			};
		};
	};	
};
