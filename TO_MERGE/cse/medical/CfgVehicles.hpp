class CfgVehicles
{
	class Logic;
	class Module_F: Logic {
		class ArgumentsBaseUnits {
		};
	};
	class ACE_moduleCombatMedicalSystem: Module_F	{
		scope = 2;
		displayName = "Combat Medical System [CSE]";
		icon = "\cse\cse_main\data\cse_medical_module.paa";
		category = "cse_medical";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		author = $STR_ACE_Core_ACETeam;
		class Arguments	{
			class openingOfWounds {
				displayName = "Advanced Wounds";
				description = "When set to true, bandaged wounds could on occasion re-open, resulting in new open wounds that need to be bandaged.";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class medicSetting {
				displayName = "Advanced Medic roles";
				description = "Medics only are able to view the detailed information";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class difficultySetting {
				displayName = "Survival Difficulty";
				description = "Select the aggressiveness of the medical simulation";
				typeName = "NUMBER";
				class values {
					class recruit {
						name = "Recruit";
						value = 0.5;
					};
					class regular {
						name = "Regular";
						value = 1;
						default = 1;
					};
					class veteran {
						name = "Veteran";
						value = 1.2;
					};
					class expert  {
						name = "Expert";
						value = 1.5;
					};
				};
			};
			class enableFor {
				displayName = "Enabled for";
				description = "Select what units CMS will be enabled for";
				typeName = "NUMBER";
				class  values {
					class playableUnits {
						name = "Players only";
						value = 0;
						default = 1;
					};
					class playableUnitsAndAI {
						name = "Players and AI";
						value = 1;
					};
				};
			};
			class enableAirway {
				displayName = "Enable Airway";
				description = "Should CMS Airway system be enabled?";
				typeName = "NUMBER";
				class values {
					class enable {
						name = "Yes";
						value = 1;
					};
					class disable {
						name = "No";
						value = 0;
						default = 1;
					};
				};
			};
			class vehCrashes {
				displayName = "Vehicle Crashes";
				description = "Enable injuries on vehicle crashes";
				typeName = "BOOL";
				defaultValue = 1;
			};

			class aidKitUponUsage {
				displayName = "Disposable Aid kit";
				description = "Is a personal aid kit disposable?";
				typeName = "BOOL";
				defaultValue = false;
			};
			class aidKitMedicsOnly {
				displayName = "Medics only";
				description = "Are aid kits restricted to medics only?";
				typeName = "BOOL";
				defaultValue = false;
			};
			class aidKitRestrictions {
				displayName = "Aid kit";
				description = "When can an Aid kit be used?";
				typeName = "NUMBER";
				class  values {
					class medFacility {
						name = "Medical Facility";
						value = 0;
						default = 1;
					};
					class medFAcilityNoBleeding {
						name = "Medical Facility & No bleeding";
						value = 1;
					};
					class Everywhere {
						name = "Everywhere";
						value = 2;
					};
					class EverywhereNoBleeding {
						name = "Everywhere & No Bleeding";
						value = 3;
					};
				};
			};
			class bandageTime {
				displayName = "Bandage Time";
				description = "Time it takes for a bandage action to be completed";
				typeName = "NUMBER";
				defaultValue = 5;
			};
			class stitchingAllow {
				displayName = "Can Stitch";
				description = "What units can use stitching?";
				typeName = "NUMBER";
				defaultValue = 0;
				class values {
					class medicsOnly {
						name = "Medics Only";
						value = 0;
						default = 1;
					};
					class everyone {
						name = "Everyone";
						value = 1;
					};
					class noOne {
						name = "No units";
						value = -1;
					};
				};
			};

		};
		class ModuleDescription {
			description = "Provides a more realistic medical system for both players and AI."; // Short description, will be formatted as structured text
			sync[] = {};
		};
	};
	class ACE_assignMedicRoles_CMS: Module_F {
		scope = 2;
		displayName = "Set Medic Class [CSE]";
		icon = "\cse\cse_main\data\cse_medical_module.paa";
		category = "cse_medical";
		function = "FUNC(assignMedicRoles_CMS)";
		functionPriority = 10;
		isGlobal = 2;
		isTriggerActivated = 0;
		isDisposable = 0;
		author = $STR_ACE_Core_ACETeam;
		class Arguments	{
			class EnableList {
				displayName = "List";
				description = "List of unit names that will be classified as medic, separated by commas.";
				defaultValue = "";
			};
			class class {
				displayName = "Is Medic";
				description = "Medics allow for more advanced treatment in case of Advanced Medic roles enabled";
				typeName = "BOOL";
				defaultValue = true;
			};
		};
		class ModuleDescription {
			description = "Assigns the CSE medic class to a unit"; // Short description, will be formatted as structured text
			sync[] = {};
		};
	};

	class ACE_assignMedicalVehicle_CMS: Module_F {
		scope = 2;
		displayName = "set Medical Vehicle [CSE]";
		icon = "\cse\cse_main\data\cse_medical_module.paa";
		category = "cse_medical";
		function = "FUNC(assignMedicalVehicle_CMS)";
		functionPriority = 10;
		isGlobal = 2;
		isTriggerActivated = 0;
		isDisposable = 0;
		author = $STR_ACE_Core_ACETeam;
		class Arguments	{
			class EnableList {
				displayName = "List";
				description = "List of object names that will be classified as medical vehicle, separated by commas.";
				defaultValue = "";
			};
			class enabled {
				displayName = "Is Medical Vehicle";
				description = "Whatever or not the objects in the list will be a medical vehicle.";
				typeName = "BOOL";
				defaultValue = true;
			};
		};
		class ModuleDescription {
			description = "Assigns the CSE medical vehicle class to a vehicle.";
			sync[] = {};
		};
	};

	class ACE_assignMedicalFacility_CMS: Module_F {
		scope = 2;
		displayName = "Set Medical Facility [CSE]";
		icon = "\cse\cse_main\data\cse_medical_module.paa";
		category = "cse_medical";
		function = "FUNC(assignMedicalFacility_CMS)";
		functionPriority = 10;
		isGlobal = 2;
		isTriggerActivated = 0;
		isDisposable = 0;
		author = $STR_ACE_Core_ACETeam;
		class Arguments	{
			class class {
				displayName = "Is Medical Facility";
				description = "Registers an object as a medical facility for CMS";
				typeName = "BOOL";
			};
		};
		class ModuleDescription {
			description = "Defines an object as a medical facility for CMS. This allows for more advanced treatments. Can be used on buildings and vehicles. ";
			sync[] = {};
		};
	};
	class ACE_assignMedicalEquipment_CMS: Module_F {
		scope = 2;
		displayName = "Assign Medical Equipment [CSE]";
		icon = "\cse\cse_main\data\cse_medical_module.paa";
		category = "cse_medical";
		function = "FUNC(assignMedicalEquipment_CMS)";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		author = $STR_ACE_Core_ACETeam;
		class Arguments	{
			class equipment {
				displayName = "Assign Equipment";
				description = "Assign Medical equipment to all players";
				typeName = "NUMBER";
				defaultValue = 0;
				class values {
					class AllPlayers {
						name = "All Players";
						value = 0;
						default = 1;
					};
					class MedicsOnly {
						name = "Medics only";
						value = 1;
					};
				};
			};
		};
		class ModuleDescription {
			description = "Assigns medical equipment to units";
			sync[] = {};
		};
	};


	class MapBoard_altis_F;
	class ACE_bodyBag: MapBoard_altis_F {
		scope = 1;
		side = -1;
		model = "\cse\cse_sys_medical\equipment\bodybag.p3d";
		icon = "";
		displayName = $STR_ACE_MAG_BODYBAG_DISPLAY;
	};


	class Item_Base_F;
	class ACE_bandage_basicItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_BANDAGE_BASIC_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_bandage_basic
			{
				name = "cse_bandage_basic";
				count = 1;
			};
		};
	};
	class ACE_packing_bandageItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_PACKING_BANDAGE_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_packing_bandage
			{
				name = "cse_packing_bandage";
				count = 1;
			};
		};
	};
	class ACE_bandageElasticItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_BANDAGE_ELASTIC_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_bandageElastic
			{
				name = "cse_bandageElastic";
				count = 1;
			};
		};
	};
	class ACE_tourniquetItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_TOURNIQUET_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_tourniquet
			{
				name = "cse_tourniquet";
				count = 1;
			};
		};
	};
	class ACE_splintItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_SPLINT_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_splint
			{
				name = "cse_splint";
				count = 1;
			};
		};
	};
	class ACE_morphineItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_MORPHINE_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_morphine
			{
				name = "cse_morphine";
				count = 1;
			};
		};
	};
	class ACE_atropineItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_ATROPINE_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_atropine
			{
				name = "cse_atropine";
				count = 1;
			};
		};
	};
	class ACE_epinephrineItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_EPINEPHRINE_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_epinephrine
			{
				name = "cse_epinephrine";
				count = 1;
			};
		};
	};
	class ACE_plasma_ivItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_PLASMA_IV;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_plasma_iv
			{
				name = "cse_plasma_iv";
				count = 1;
			};
		};
	};
	class ACE_plasma_iv_500Item: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_PLASMA_IV_500;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_plasma_iv_500
			{
				name = "cse_plasma_iv_500";
				count = 1;
			};
		};
	};
	class ACE_plasma_iv_250Item: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_PLASMA_IV_250;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_plasma_iv_250
			{
				name = "cse_plasma_iv_250";
				count = 1;
			};
		};
	};
	class ACE_blood_ivItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_BLOOD_IV;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_blood_iv
			{
				name = "cse_blood_iv";
				count = 1;
			};
		};
	};
	class ACE_blood_iv_500Item: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_BLOOD_IV_500;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_blood_iv_500
			{
				name = "cse_blood_iv_500";
				count = 1;
			};
		};
	};
	class ACE_blood_iv_250Item: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_BLOOD_IV_250;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_blood_iv_250
			{
				name = "cse_blood_iv_250";
				count = 1;
			};
		};
	};
	class ACE_saline_ivItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_SALINE_IV;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_saline_iv
			{
				name = "cse_saline_iv";
				count = 1;
			};
		};
	};
	class ACE_saline_iv_500Item: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_SALINE_IV_500;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_saline_iv_500
			{
				name = "cse_saline_iv_500";
				count = 1;
			};
		};
	};
	class ACE_saline_iv_250Item: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_SALINE_IV_250;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_saline_iv_250
			{
				name = "cse_saline_iv_250";
				count = 1;
			};
		};
	};
	class ACE_quikclotItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_QUIKCLOT_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_quikclot
			{
				name = "cse_quikclot";
				count = 1;
			};
		};
	};
	class ACE_nasopharyngeal_tubeItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_NPA_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_nasopharyngeal_tube
			{
				name = "cse_nasopharyngeal_tube";
				count = 1;
			};
		};
	};
	class ACE_opaItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_OPA_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_opa
			{
				name = "cse_opa";
				count = 1;
			};
		};
	};
	class ACE_liquidSkinItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_LIQUID_SKIN_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_liquidSkin
			{
				name = "cse_liquidSkin";
				count = 1;
			};
		};
	};
	class ACE_chestsealItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_CHEST_SEAL_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_chestseal
			{
				name = "cse_chestseal";
				count = 1;
			};
		};
	};
	class ACE_personal_aid_kitItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_AID_KIT_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_personal_aid_kit
			{
				name = "cse_personal_aid_kit";
				count = 1;
			};
		};
	};
	class ACE_bodyBagItem: Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = $STR_ACE_MAG_BODYBAG_DISPLAY;
		author = $STR_ACE_Core_ACETeam;
		vehicleClass = "Items";
		class TransportItems
		{
			class ACE_itemBodyBag
			{
				name = "cse_itemBodyBag";
				count = 1;
			};
		};
	};


	class NATO_Box_Base;
	class ACE_medical_supply_crate_cms : NATO_Box_Base {
		scope = 2;
		accuracy = 1000;
		displayName = "Medical Supply Crate (CSE)";
		model = "\A3\weapons_F\AmmoBoxes\AmmoBox_F";
		author = $STR_ACE_Core_ACETeam;
		class TransportItems {
			class ACE_bandage_basic {
				name = "cse_bandage_basic";
				count = 25;
			};
			class ACE_packing_bandage {
				name = "cse_packing_bandage";
				count = 25;
			};
			class ACE_tourniquet {
				name = "cse_tourniquet";
				count = 25;
			};
			class ACE_splint {
				name = "cse_splint";
				count = 25;
			};
			class ACE_plasma_iv {
				name = "cse_plasma_iv";
				count = 25;
			};
			class ACE_plasma_iv_500 {
				name = "cse_plasma_iv_500";
				count = 25;
			};
			class ACE_plasma_iv_250 {
				name = "cse_plasma_iv_250";
				count = 25;
			};
			class ACE_blood_iv {
				name = "cse_blood_iv";
				count = 25;
			};
			class ACE_blood_iv_500 {
				name = "cse_blood_iv_500";
				count = 25;
			};
			class ACE_blood_iv_250 {
				name = "cse_blood_iv_250";
				count = 25;
			};
			class ACE_saline_iv {
				name = "cse_saline_iv";
				count = 25;
			};
			class ACE_saline_iv_500 {
				name = "cse_saline_iv_500";
				count = 25;
			};
			class ACE_saline_iv_250 {
				name = "cse_saline_iv_250";
				count = 25;
			};
			class ACE_morphine {
				name = "cse_morphine";
				count = 25;
			};
			class ACE_epinephrine {
				name = "cse_epinephrine";
				count = 25;
			};
			class ACE_atropine {
				name = "cse_atropine";
				count = 25;
			};
			class ACE_quikclot {
				name = "cse_quikclot";
				count = 25;
			};
			class ACE_nasopharyngeal_tube {
				name = "cse_nasopharyngeal_tube";
				count = 25;
			};
			class ACE_bandageElastic {
				name = "cse_bandageElastic";
				count = 25;
			};
			class ACE_liquidSkin {
				name = "cse_liquidSkin";
				count = 25;
			};
			class ACE_chestseal {
				name = "cse_chestseal";
				count = 25;
			};
			class ACE_personal_aid_kit {
				name = "cse_personal_aid_kit";
				count = 25;
			};
			class ACE_surgical_kit {
				name = "cse_surgical_kit";
				count = 25;
			};
			class ACE_itemBodyBag {
				name = "cse_itemBodyBag";
				count = 5;
			};
		};
	};
};
