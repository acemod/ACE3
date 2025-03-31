#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class acex_fortify
	{
		units[]={};
		weapons[]=
		{
			"ACE_Fortication_Material",
			"ACE_ConstructionTool"
		};
		requiredVersion=1.84;
		requiredAddons[]=
		{
			"ace_main",
			"ace_interaction"
		};
		author="$STR_ace_common_ACETeam";
		authors[]=
		{
			"Kingsley"
		};
		url="$STR_ace_main_URL";
		version="3.4.2.13";
		versionStr="3.4.2.13";
		versionAr[]={3,4,2,13};
	};
};
class CfgEditorSubcategories
{
	class EdSubcat_SR_Construction
	{
		displayName="7R Construction";
	};
};
class Extended_PreStart_EventHandlers
{
	class ace_fortify
	{
		init="call compile preprocessFileLineNumbers '\z\ace\addons\fortify\XEH_preStart.sqf'";
	};
};
class Extended_PreInit_EventHandlers
{
	class ace_fortify
	{
		init="call compile preprocessFileLineNumbers '\z\ace\addons\fortify\XEH_preInit.sqf'";
	};
};
class Extended_PostInit_EventHandlers
{
	class ace_fortify
	{
		init="call compile preprocessFileLineNumbers '\z\ace\addons\fortify\XEH_postInit.sqf'";
	};
};
class Extended_DisplayLoad_EventHandlers
{
	class RscDisplayMission
	{
		ace_fortify="_this call compile preprocessFileLineNumbers '\z\ace\addons\fortify\XEH_missionDisplayLoad.sqf'";
	};
};
class CBA_Extended_EventHandlers;
class CfgVehicles
{
	class Land_PowerGenerator_F;
	class ACE_Construction_Base: Land_PowerGenerator_F
	{
		displayName="Construction Base";
		scopeCurator=2;
		side=3;
		editorCategory="SR_Objects_Cat";
		editorSubcategory="EdSubcat_SR_Construction";
	};
	class MASH;
	class ACE_MedicalTent: MASH
	{
		displayName="Medical Tent";
		scopeCurator=2;
		side=3;
		editorCategory="SR_Objects_Cat";
		editorSubcategory="EdSubcat_SR_Construction";
	};
	/*class DeconShower_01_F;
	class ACE_DeconStation: DeconShower_01_F
	{
		displayName="Decon Station";
		scopeCurator=2;
		side=3;
		editorCategory="SR_Objects_Cat";
		editorSubcategory="EdSubcat_SR_Construction";
		class UserActions
		{
		};
		class EventHandlers
		{
			class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers
			{
			};
		};
		class ACE_Actions
		{
			class ACE_MainActions
			{
				displayName="Decon Station";
				selection="";
				distance=1.7;
				condition=1;
				class turn_on
				{
					displayName="Turn On";
					condition="alive this AND {!(this getVariable ['bin_deconshower_disableAction',false])} AND {this animationSourcePhase 'valve_source' isEqualTo 0}";
					statement="_player playActionNow 'PutDown';[this,1.5,9] spawn bin_fnc_deconShowerAnim";
					icon="";
					exceptions[]={};
					selection="";
				};
				class turn_off
				{
					displayName="Turn Off";
					condition="alive this AND {!(this getVariable ['bin_deconshower_disableAction',false])} AND {this animationSourcePhase 'valve_source' > 0}";
					statement="_player playActionNow 'PutDown';[this] call bin_fnc_deconShowerAnimStop";
					icon="";
					exceptions[]={};
					selection="";
				};
			};
		};
	};
	*/
	class CargoNet_01_barrels_F;
	class ACE_Construction_Supplies: CargoNet_01_barrels_F
	{
		displayName="Construction Supply Box";
		scopeCurator=2;
		editorCategory="SR_Objects_Cat";
		editorSubcategory="EdSubcat_SR_Construction";
		class EventHandlers
		{
			class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers
			{
			};
		};
		class ACE_Actions
		{
			class ACE_MainActions
			{
				displayName="Resources";
				selection="";
				distance=4;
				condition=1;
				class Resources
				{
					displayName="Claim Resources";
					condition="true";
					statement="[_target,_player] call ace_fortify_fnc_claimResources";
					icon="";
					exceptions[]={};
					selection="";
				};
			};
		};
	};
	// Regular Service Point
	class USMC_WarfareBVehicleServicePoint; 
	class ACE_Construction_ServicePoint: USMC_WarfareBVehicleServicePoint
	{
		displayName="Vehicle Service Point";
		scopeCurator=2;
		side=3;
		editorCategory="SR_Objects_Cat";
		editorSubcategory="EdSubcat_SR_Construction";
		ace_cargo_canLoad=0;
		ace_cargo_size=0;
		ace_repair_canRepair=1;
		transportRepair=0;
		ace_dragging_canDrag=0;
		ace_dragging_canCarry=0;
		ace_refuel_fuelCargo=8000;
		ace_refuel_hooks[]=
		{
			{-0.80000001,-2,0}
		};
		ace_rearm_defaultSupply=5000;
		class EventHandlers
		{
			class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers
			{
			};
		};
		class ACE_Actions
		{
			class ACE_MainActions
			{
				displayName="Service Point";
				selection="";
				distance=4;
				condition=1;
				class Spare
				{
					displayName="Spare Parts";
					selection="";
					condition="true";
					class SpareWheels
					{
						displayName="Get Spare Wheel";
						condition="true";
						statement="[_target,_player,'ACE_Wheel','Get Spare Wheel'] call ace_fortify_fnc_getSpareParts";
						icon="";
						exceptions[]={};
						selection="";
					};
					class SpareTrack
					{
						displayName="Get Spare Track";
						condition="true";
						statement="[_target,_player,'ACE_Track','Get Spare Track'] call ace_fortify_fnc_getSpareParts";
						icon="";
						exceptions[]={};
						selection="";
					};
				};
				class fuel
				{
					displayName="Get Fuel Can";
					selection="";
					condition="true";
					statement="[_target,_player,'Land_CanisterFuel_F','Get Fuel Can'] call ace_fortify_fnc_getSpareParts";
				};
			};
		};
	};
	// 3CB Service Point
	class NATO_Box_Base;
	class UK3CB_BAF_Vehicles_Servicing_Point_Base: NATO_Box_Base {};
	class UK3CB_BAF_Vehicles_Servicing_Ground_Point: UK3CB_BAF_Vehicles_Servicing_Point_Base {};
	class ACE_Construction_ServicePoint_BAF: UK3CB_BAF_Vehicles_Servicing_Ground_Point
	{
		displayName="Vehicle Service Point (BAF)";
		scopeCurator=2;
		side=3;
		editorCategory="SR_Objects_Cat";
		editorSubcategory="EdSubcat_SR_Construction";
		model = "\CA\Misc3\WF\WF_Vehicle_Service_Point_west.p3d";
		ace_cargo_canLoad=0;
		ace_cargo_size=0;
		ace_repair_canRepair=1;
		transportRepair=0;
		ace_dragging_canDrag=0;
		ace_dragging_canCarry=0;
		ace_refuel_fuelCargo=8000;
		ace_refuel_hooks[]=
		{
			{-0.80000001,-2,0}
		};
		ace_rearm_defaultSupply=5000;
		class EventHandlers
		{
			class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers
			{
			};
		};
		class ACE_Actions
		{
			class ACE_MainActions
			{
				displayName="Service Point";
				selection="";
				distance=4;
				condition=1;
				class Spare
				{
					displayName="Spare Parts";
					selection="";
					condition="true";
					class SpareWheels
					{
						displayName="Get Spare Wheel";
						condition="true";
						statement="[_target,_player,'ACE_Wheel','Get Spare Wheel'] call ace_fortify_fnc_getSpareParts";
						icon="";
						exceptions[]={};
						selection="";
					};
					class SpareTrack
					{
						displayName="Get Spare Track";
						condition="true";
						statement="[_target,_player,'ACE_Track','Get Spare Track'] call ace_fortify_fnc_getSpareParts";
						icon="";
						exceptions[]={};
						selection="";
					};
				};
				class fuel
				{
					displayName="Get Fuel Can";
					selection="";
					condition="true";
					statement="[_target,_player,'Land_CanisterFuel_F','Get Fuel Can'] call ace_fortify_fnc_getSpareParts";
				};
			};
		};
	};
	class Land_PlasticCase_01_medium_F;
	class ACE_Sandbag_Supplies: Land_PlasticCase_01_medium_F
	{
		displayName="Sandbag Supply Box";
		scopeCurator=2;
		side=3;
		editorCategory="SR_Objects_Cat";
		editorSubcategory="EdSubcat_SR_Construction";
		class TransportItems
		{
			class _xx_ACE_Fortication_Material
			{
				name="ACE_Fortication_Material";
				count=20;
			};
		};
	};
	class Land_Antenna;
	class ACE_FOB: Land_Antenna
	{
		displayName="Forward Operating Base";
		scopeCurator=2;
		editorCategory="SR_Objects_Cat";
		editorSubcategory="EdSubcat_SR_Construction";
		class EventHandlers
		{
			Init="[_this select 0] spawn ace_fortify_fnc_initFob";
			Deleted="[_this select 0] spawn ace_fortify_fnc_removeFob";
		};
	};
	class Misc_Backpackheap;
	class ACE_RallyPoint: Misc_Backpackheap {
		displayName="Rally Point";
		scopeCurator=2;
		editorCategory="SR_Objects_Cat";
		editorSubcategory="EdSubcat_SR_Construction";
		class EventHandlers
		{
			Init="[_this select 0] spawn ace_fortify_fnc_initRally";
			Deleted="[_this select 0] spawn ace_fortify_fnc_removeRally";
		};
	};
	class Land_InfoStand_V2_F;
	class ACE_FOB_Terminal: Land_InfoStand_V2_F
	{
		displayName="Forward Operating Base Terminal";
		scopeCurator=2;
		editorCategory="SR_Objects_Cat";
		editorSubcategory="EdSubcat_SR_Construction";
		hiddenSelectionsTextures[]=
		{
			"a3\ui_f\data\Map\Markers\Military\flag_CA.paa"
		};
		class EventHandlers
		{
			class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers
			{
			};
		};
		class ACE_Actions
		{
			class ACE_MainActions
			{
				displayName="Teleport";
				selection="";
				distance=2;
				condition=1;
				insertChildren="[_target, _player, []] call ace_fortify_fnc_teleport";
			};
		};
	};
	class Land_JumpTarget_F;
	class ACE_DropZone: Land_JumpTarget_F
	{
		displayName="Drop Zone";
		scopeCurator=2;
		side=3;
		editorCategory="SR_Objects_Cat";
		editorSubcategory="EdSubcat_SR_Construction";
		class EventHandlers
		{
			Init="[_this select 0] spawn ace_fortify_fnc_initDZ";
			Deleted="[_this select 0] spawn ace_fortify_fnc_removeDZ";
		};
	};
	class Man;
	class CAManBase: Man
	{
		class ACE_SelfActions
		{
			// Fortify menu category
			class ACE_SR_Fortify
			{
				displayName = "Fortify";
				condition = "([_player,-1] call ace_fortify_fnc_canFortify || [_player,0,2,'','weapons_f_vietnam'] call ace_fortify_fnc_canFortify || [_player] call ace_fortify_fnc_canBuildRally) && canStand _player";
				statement = "[] spawn ace_fortify_fnc_resourceInfo";
				modifierFunction = "call ace_fortify_fnc_modifyAction";
				exceptions[] = {"isNotSwimming"};
				icon = "\a3\ui_f\data\igui\cfg\simpletasks\types\use_ca.paa";
				showDisabled = 0;
				// Rally point
				class ace_rally
				{
					displayName="Deploy Rally Point [-50]";
					condition="[_player] call ace_fortify_fnc_canBuildRally";
					statement="[_player] call ace_fortify_fnc_buildRally";
					icon ="\a3\ui_f\data\igui\cfg\simpletasks\types\meet_ca.paa";
					exceptions[]={};
					showDisabled=0;
					priority=1;
				};
				// Sand bags (item required)
				class ace_sandbagHeader
				{
					displayName="Deploy Sandbags";
					condition="[_player,-1] call ace_fortify_fnc_canFortify";
					statement="";
					exceptions[]={};
					showDisabled=0;
					priority=1;
					class ace_sandbagRound
					{
						displayName="Sandbag Round";
						condition="[_player,-1] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_BagFenceRound',-1,5,[0,0,0],-1] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_sandbagLong
					{
						displayName="Sandbag Long";
						condition="[_player,-1] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_BagFenceLong',-1,5,[0,0,0],-1] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_sandbagShort
					{
						displayName="Sandbag Short";
						condition="[_player,-1] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_BagFenceShort',-1,5,[0,0,0],0] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_plank
					{
						displayName="Plank";
						condition="[_player,-1] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_Plank_01_4m_F',-1,5,[0,0,90],-1] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
				};
				class ace_barricades
				{
					displayName="Barricades";
					condition="[_player,0,2] call ace_fortify_fnc_canFortify";
					statement="[] spawn ace_fortify_fnc_resourceInfo";
					icon ="\a3\ui_f\data\igui\cfg\simpletasks\types\danger_ca.paa";
					exceptions[]={};
					showDisabled=0;
					priority=1;
						class ace_rw
					{
						displayName="Razorwire [-5]";
						condition="[_player,5,2] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_Razorwire_F',5,10,[0,0,0],-3] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_hh
					{
						displayName="Tank Trap [-10]";
						condition="[_player,10,2] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_CzechHedgehog_01_F',10,15,[0,0,0],1.5] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
				};
				class ace_cover_walls
				{
					displayName="Cover / Walls";
					condition="[_player,0,2,'','weapons_f_vietnam'] call ace_fortify_fnc_canFortify";
					statement="[] spawn ace_fortify_fnc_resourceInfo";
					exceptions[]={};
					icon = "a3\ui_f\data\IGUI\Cfg\simpleTasks\types\defend_ca.paa";
					showDisabled=0;
					priority=1;
					class ace_sbs
					{
						displayName="Sandbag Supplies [-10]";
						icon="a3\ui_f\data\IGUI\Cfg\simpleTasks\types\box_ca.paa";
						condition="[_player,10,2] call ace_fortify_fnc_canFortify";
						statement="[_player,'ACE_Sandbag_Supplies',10,5,[0,0,0],1] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_hw
					{
						displayName="Sandbag Halfwall [-2]";
						condition="[_player,2,2] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_SandbagBarricade_01_half_F',2,5] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_sw
					{
						displayName="Sandbag Wall [-5]";
						condition="[_player,5,2] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_SandbagBarricade_01_F',5,7.5] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_swh
					{
						displayName="Sandbag Wall Hole [-10]";
						condition="[_player,10,2] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_SandbagBarricade_01_hole_F',10,10] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
	
					class ace_hb1
					{
						displayName="H-Barrier Single [-2]";
						condition="[_player,3,3] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_HBarrier_1_F',3,5,[0,0,0],2] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_hb2
					{
						displayName="H-Barrier 3 Blocks [-5]";
						condition="[_player,9,3] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_HBarrier_3_F',5,10,[0,0,0],-1] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_hb3
					{
						displayName="H-Barrier 5 Blocks [-10]";
						condition="[_player,15,3] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_HBarrier_5_F',10,15,[0,0,0],-2] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_bnk1
					{
						displayName="Bunker Small [-25]";
						condition="[_player,25,3] call ace_fortify_fnc_canFortify && [_player] call ace_fortify_fnc_constructionArea";
						statement="[_player,'Land_BagBunker_Small_F',25,15,[0,0,0],-2] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_bnk2
					{
						displayName="Bunker Large [-50]";
						condition="[_player,50,3] call ace_fortify_fnc_canFortify && [_player] call ace_fortify_fnc_constructionArea";
						statement="[_player,'Land_BagBunker_Large_F',50,30,[0,0,0],-3] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
				};
				class ace_fortification_infrastructure
				{
					displayName="Infrastructure";
					condition="[_player,0,2,'','weapons_f_vietnam'] call ace_fortify_fnc_canFortify";
					statement="[] spawn ace_fortify_fnc_resourceInfo";
					exceptions[]={};
					icon = "a3\ui_f\data\IGUI\Cfg\simpleTasks\types\container_ca.paa";
					showDisabled=0;
					priority=1;/*
					class ace_lightS
					{
						displayName="Portable Light Small [2]";
						condition="[_player,5,3] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_PortableLight_02_single_olive_F',2,10,[0,0,0],2] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_lightL
					{
						displayName="Portable Light Large [5]";
						condition="[_player,10,3] call ace_fortify_fnc_canFortify";
						statement="[_player,'Land_PortableLight_02_quad_olive_F',5,15,[0,0,0],2] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};*/
					class ace_fortBase
					{
						displayName="Fortification Base [-25]";
						icon="a3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa";
						condition="[_player,25] call ace_fortify_fnc_canFortify && !(count (_player nearObjects ['ACE_Construction_Base',ace_fortify_fortBaseRange]) > 0)";
						statement="[_player,'ACE_Construction_Base',25,30,[0,0,90],0] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_foba
					{
						displayName="Forward Operating Base [-75]";
						icon="a3\ui_f\data\Map\Markers\Military\flag_CA.paa";
						condition="[_player,75,3] call ace_fortify_fnc_canFortify && [_player] call ace_fortify_fnc_constructionArea";
						statement="[_player,'ACE_FOB',75,36,[0,0,0],0] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_dz
					{
						displayName="Drop Zone [-25]";
						icon="a3\ui_f\data\Map\Markers\Military\end_CA.paa";
						condition="[_player,25,2] call ace_fortify_fnc_canFortify";
						statement="[_player,'ACE_DropZone',25,20,[0,0,0],-8] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_medic
					{
						displayName="Medical Tent [-50]";
						icon="a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heal_ca.paa";
						condition="[_player,50,2] call ace_fortify_fnc_canFortify";
						statement="[_player,'ACE_MedicalTent',50,36,[0,0,0],-2] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_vsp
					{
						displayName="Vehicle Service Point [-75]";
						icon="a3\ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa";
						condition="[_player,75,3,'UK3CB_BAF_Vehicles'] call ace_fortify_fnc_canFortify";
						statement="[_player,'ACE_Construction_ServicePoint_BAF',75,36,[0,0,90],-3] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_vsp_no_baf
					{
						displayName="Vehicle Service Point [-75]";
						icon="a3\ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa";
						condition="[_player,75,3,'','UK3CB_BAF_Vehicles'] call ace_fortify_fnc_canFortify";
						statement="[_player,'ACE_Construction_ServicePoint',75,36,[0,0,90],-3] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
					class ace_bridge
					{
						displayName="Bridge [-100]";
						condition="[_player,100,2] call ace_fortify_fnc_canFortify";
						statement="[_player,'CUP_A2_Road_Bridge_wood_25',100,120,[0,0,90],-10] call ace_fortify_fnc_deployObject";
						exceptions[]={};
					};
				};
			};
		};
	};
};
class CfgWeapons
{
	class ACE_ItemCore;
	class ACE_Sandbag_empty;
	class CBA_MiscItem_ItemInfo;
	class ACE_Fortication_Material: ACE_Sandbag_empty
	{
		author="ECSTRING(common,ACETeam)";
		scope=2;
		displayName="Fortication Material";
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass=4;
		};
	};
	class ACE_ConstructionTool: ACE_ItemCore
	{
		author="ECSTRING(common,ACETeam)";
		displayName="Construction Tool";
		descriptionShort="Required to construct fortifications";
		model="\A3\Structures_F\Items\Tools\Hammer_F.p3d";
		picture="\z\ace\addons\fortify\ui\hammer_ca";
		scope=2;
		class ItemInfo: CBA_MiscItem_ItemInfo
		{
			mass=60;
		};
	};
};
