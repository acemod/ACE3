class CfgVehicles {
	class ThingX;
	class Item_Base_F;
	class NonStrategic;
	
	class ACE_M1A2_AimingPost_Item_F: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "M1A2 Aiming Posts";
		author = ECSTRING(common,ACETeam);
        vehicleClass = "Items";
		
		model="a3\structures_f_heli\Items\Luggage\PlasticCase_01_small_F.p3d";
		icon=PATHTOF(m1a2_aimingpost\data\ui\map_aimingpost_ca.paa);
		picture=PATHTOF(m1a2_aimingpost\data\ui\aimingpost_equip_ca.paa);
		
        class TransportItems {
            MACRO_ADDITEM(ACE_M1A2_AimingPost,1);
        };
    };
	
	class ACE_M1A2_AimingPost_F: NonStrategic {   
		scope = 2;
        scopeCurator = 2;
		displayName = "M1A2 Aiming Posts";
		author = ECSTRING(common,ACETeam);
		vehicleClass = "Static";
		
		model=PATHTOF(m1a2_aimingpost\m1a2_aimingpost_F.p3d);
		icon=PATHTOF(m1a2_aimingpost\data\ui\map_aimingpost_ca.paa);
		picture=PATHTOF(m1a2_aimingpost\data\ui\aimingpost_equip_ca.paa);
		
		class AnimationSources
		{
			class move_post_light {
				source="user";
				animPeriod = 0.01;
				initPhase = 0;
			};
			class show_post_light {
				source="user";	
				animPeriod = 0.01;
				initPhase = 1;
			};
			class illuminate_green {
				source="user";
				animPeriod = 0.01;
				initPhase = 0;
			};
			class illuminate_red {
				source="user";
				animPeriod = 0.01;
				initPhase = 0;
			};
		};
	};
	
	
    class ACE_M1A1_Collimator_Item_F: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "M1A1 Aiming Collimator";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(m1a1_collimator\M1A1_Collimator_Equip_F.p3d);
		icon=PATHTOF(m1a1_collimator\data\ui\map_collimator_ca.paa);
		picture=PATHTOF(m1a1_collimator\data\ui\collimator_equip_ca.paa);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_M1A1_Collimator,1);
        };
    };
	
	class ACE_M1A1_Collimator_F: ThingX {   
		scope = 2;
        scopeCurator = 2;
		displayName = "M1A1 Aiming Collimator (Deployed)";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(m1a1_collimator\M1A1_Collimator_F.p3d);
		icon=PATHTOF(m1a1_collimator\data\ui\map_collimator_ca.paa);
		picture=PATHTOF(m1a1_collimator\data\ui\collimator_equip_ca.paa);
		vehicleClass = "Static";

		// At Night Time Change The Collimator Reticle Texture, and apply the illuminated rvmat.
		// "collimator_pattern_grn_co.paa"
		hiddenSelections[] = {"collimator_reticle"};
		hiddenSelectionsTextures[]={"z\ace\addons\artillery\m1a1_collimator\data\collimator_pattern_co.paa"};
		hiddenSelectionsMaterials[]={""};
		
		class AnimationSources {
			class collimator_illuminate {
				// 0 = Lighting Off, 1 = Lighting On
				displayName = "Collimator Back-light";
				source = "user";
				animPeriod = 0.01;
				initPhase = 0;
			};
			class collimator_rotation {
				// Animation phase loops through rad -360/+360
				displayName = "Collimator Rotation";
				source = "user";
				animPeriod = 0.01;
				initPhase = 0;
				minValue = "-6400";
				maxValue = "6400";
			};
			class collimator_elevation {
				// Animation phase 0-1 Loops through rad -90/+30
				displayName = "Collimator Elevation";
				source = "user";
				animPeriod = 0.01;
				initPhase = 0;
				minValue = "-1593";
				maxValue = "531";
			};
			class collimator_offset {
				displayName = "Collimator Offset";
				source="user";
				animPeriod=0.01;
				initPhase = 0;
				minValue = -1;
				maxValue = 1;
			};
			// The below animations expand the collimator reticle by individually moving the 4 edges of a plane (Top, Bottom, Left, Right)
			// The Scale can be adjusted, it was initially for testing purposes, not accuracy.
			class expand_up {
				source = "user";
				animPeriod = 1.0;
				initPhase = 0;
			};
			class expand_down {
				source = "user";
				animPeriod = 1.0;
				initPhase = 0;
			};
			class expand_left {
				source = "user";
				animPeriod = 1.0;
				initPhase = 0;
			};
			class expand_right {
				source = "user";
				animPeriod = 1.0;
				initPhase = 0;
			};
			// End Collimator Reticle Animation
			class fold_legs {
				displayName = "Fold Collimator Legs";
				source = "user";
				animPeriod = 1;
				initPhase = 0;
			};
			class foot_01 {
				displayName = "Extend Collimator Leg 1";
				source = "user";
				animPeriod = 0;
				initPhase = 0;
			};
			class foot_02: foot_01 {
				displayName = "Extend Collimator Leg 2";
			};
			class foot_03: foot_01 {
				displayName = "Extend Collimator Leg 3";
			};
		};	
	};
	class ACE_155_LoadingTray_F: ThingX {   
		scope = 2;
        scopeCurator = 2;
		displayName = "Loading Tray (155mm Howitzer)";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(m198_loading_tray\Loading_Tray_F.p3d);
		icon=PATHTOF(m198_loading_tray\data\ui\map_loadingtray_ca.paa);
		picture=PATHTOF(m198_loading_tray\data\ui\loadingtray_equip_ca.paa);
		vehicleClass = "Static";
	};
	class ACE_155_PushRod_F: ThingX {   
		scope = 2;
        scopeCurator = 2;
		displayName = "Loading Push-rod (155mm Howitzer)";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(m198_loading_tray\Push_Rod_F.p3d);
		icon=PATHTOF(m198_loading_tray\data\ui\map_pushrod_ca.paa);
		picture=PATHTOF(m198_loading_tray\data\ui\pushrod_equip_ca.paa);
		vehicleClass = "Static";
	};
};
