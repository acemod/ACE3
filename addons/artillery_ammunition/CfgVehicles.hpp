class CfgVehicles {
	class ThingX;
	class Item_Base_F;
	class NonStrategic;
	class ReammoBox_F;
	class LandVehicle;
	class ACE_RepairItem_Base;
	
	class ACE_155_M982_Pallet_F: ThingX {
		XEH_ENABLED;
        EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition[]) = {0,1,0};
        EGVAR(dragging,dragDirection) = 0;
		
		EGVAR(roundCount) = 3;	
		
		scope = 2;
		scopeCurator = 2;
		displayName = "M982 Excalibur Pallet";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(M982_Pallet_F.p3d);
		icon=PATHTOF(m198_howitzer\data\ui\map_pushrod_ca.paa);
		picture=PATHTOF(m198_howitzer\data\ui\pushrod_equip_ca.paa);
		vehicleClass = "Static";
		
		slingLoadCargoMemoryPoints[] = {"slingload_point_01","slingload_point_02","slingload_point_03","slingload_point_04"};		
		
		class AnimationSources
		{
			class hide_packaging {
				source="user";
				animPeriod = 1;
				initPhase = 0;
			};
			class hide_01: hide_packaging {};
			class hide_02: hide_packaging {};
			class hide_03: hide_packaging {};
		};
		class ACE_Actions {
			class ACE_MainActions {
				displayName = CSTRING(MainAction);
                distance = 4;
                condition = QUOTE(true);
                statement = "";
				class ACE_Unpack_Pallet {
					displayName = "Unpack Pallet";
					// selection = "aimpoint";
					distance = 2;
					condition = "_target animationPhase 'hide_packaging' <= 0";
					statement = "_target animate ['hide_packaging',1]";
					showDisabled = 0;
				};
			};
			class ACE_Unpack_01 {
				displayName = "Get Round";
				selection = "c_01";
				distance = 1.25;
				condition = "(_target animationPhase 'hide_01' <= 0) AND (_target animationPhase 'hide_packaging' == 1)";
				statement = "_target animate ['hide_01',1]";
				showDisabled = 0;
			};
			class ACE_Unpack_02 {
				displayName = "Get Round";
				selection = "c_02";
				distance = 1.25;
				condition = "(_target animationPhase 'hide_02' <= 0) AND (_target animationPhase 'hide_packaging' == 1)";
				statement = "_target animate ['hide_02',1]";
				showDisabled = 0;
			};
			class ACE_Unpack_03 {
				displayName = "Get Round";
				selection = "c_03";
				distance = 1.25;
				condition = "(_target animationPhase 'hide_03' <= 0) AND (_target animationPhase 'hide_packaging' == 1)";
				statement = "_target animate ['hide_03',1]";
				showDisabled = 0;
			};
		};
	};
	
	class ACE_155_M982_F: ThingX {
		XEH_ENABLED;
        EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition[]) = {0,1,0};
        EGVAR(dragging,dragDirection) = 0;
		
		EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition[]) = {0,1.2,0};
        EGVAR(dragging,carryDirection) = 0;
		
		scope = 2;
		scopeCurator = 2;
		displayName = "M982 Excalibur";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(M982_Excalibur_F.p3d);
		icon=PATHTOF(m198_howitzer\data\ui\map_pushrod_ca.paa);
		picture=PATHTOF(m198_howitzer\data\ui\pushrod_equip_ca.paa);
		vehicleClass = "Static";
		
		class AnimationSources
		{
			class hide_band {
				source="user";
				animPeriod = 1;
				initPhase = 0;
			};
		};
		
		class ACE_Actions {
			class ACE_MainActions {
				displayName = CSTRING(MainAction);
                distance = 4;
                condition = QUOTE(true);
                statement = "";
				class ACE_Remove_Band {
					displayName = "Remove Retaining Band";
					selection = "pos_band";
					distance = 2;
					condition = "_target animationPhase 'hide_band' <= 0";
					statement = "_target animate ['hide_band',1]";
					showDisabled = 0;
				};
			};
		};
	};
};
