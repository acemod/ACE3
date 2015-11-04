class CfgVehicles {
	class ThingX;
	class Item_Base_F;
	class NonStrategic;
	class ReammoBox_F;
	class LandVehicle;
	
	class ACE_MACS_Sleeve_F: ThingX {   
		scope = 2;
        scopeCurator = 2;
		displayName = "MACS Charge Loading Sleeve";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(macs_charge_sleeve_F.p3d);
		icon=PATHTOF(m198_howitzer\data\ui\map_pushrod_ca.paa);
		picture=PATHTOF(m198_howitzer\data\ui\pushrod_equip_ca.paa);
		vehicleClass = "Static";
	};
	class ACE_MACS_M231_Pallet_F: ThingX {   
		scope = 2;
        scopeCurator = 2;
		displayName = "MACS M231 Supply Pallet";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(macs_pallet_m231_F.p3d);
		icon=PATHTOF(m198_howitzer\data\ui\map_pushrod_ca.paa);
		picture=PATHTOF(m198_howitzer\data\ui\pushrod_equip_ca.paa);
		vehicleClass = "Static";
			
		slingLoadCargoMemoryPoints[] = {"slingload_point_01","slingload_point_02","slingload_point_03","slingload_point_04"};
	};
	class ACE_MACS_M232_Pallet_F: ACE_MACS_M231_Pallet_F {   
		scope = 2;
        scopeCurator = 2;
		displayName = "MACS M232 Supply Pallet";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(macs_pallet_m232_F.p3d);
		icon=PATHTOF(m198_howitzer\data\ui\map_pushrod_ca.paa);
		picture=PATHTOF(m198_howitzer\data\ui\pushrod_equip_ca.paa);
		vehicleClass = "Static";
	};
	class ACE_MACS_M231_Bundle_F: ThingX {   
		scope = 2;
        scopeCurator = 2;
		displayName = "MACS M231 Artillery Charges (Bundle)";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(macs_bundle_m231_F.p3d);
		icon=PATHTOF(m198_howitzer\data\ui\map_pushrod_ca.paa);
		picture=PATHTOF(m198_howitzer\data\ui\pushrod_equip_ca.paa);
		vehicleClass = "Static";
	};
	class ACE_MACS_M232_Bundle_F: ThingX {   
		scope = 2;
        scopeCurator = 2;
		displayName = "MACS M232 Artillery Charges (Bundle)";
		author = ECSTRING(common,ACETeam);
		model=PATHTOF(macs_bundle_m232_F.p3d);
		icon=PATHTOF(m198_howitzer\data\ui\map_pushrod_ca.paa);
		picture=PATHTOF(m198_howitzer\data\ui\pushrod_equip_ca.paa);
		vehicleClass = "Static";
	};	
};
