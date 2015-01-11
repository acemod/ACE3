//class thingX;
class Items_base_F;
class AGM_Explosives_Place: Items_base_F {
	author = "AGM";
	_generalMacro = "AGM_Explosives_Place";
	displayName = "Multi-meter";
	mapSize = 0.2;
	icon = "iconObject_1x2";
	model = "\A3\Structures_F\Items\Tools\MultiMeter_F.p3d";
	scope = 2;
	scopeCurator = 1;
	vehicleClass = "Cargo";
	AGM_offset[] = {0,0,0};
};

class AGM_Explosives_Place_DemoCharge:AGM_Explosives_Place {
	displayName = "Demo Charge";
	model = "\A3\Weapons_F\explosives\c4_charge_small_d";
};
class AGM_Explosives_Place_APERSBoundingMine:AGM_Explosives_Place {
	displayName = "APERS Bounding Mine";
	model = "\A3\Weapons_F\explosives\mine_AP_bouncing";
};
class AGM_Explosives_Place_APERSMine:AGM_Explosives_Place {
	displayName = "APERS Mine";
	model = "\A3\Weapons_F\explosives\mine_ap";
};
class AGM_Explosives_Place_APERSTripwireMine:AGM_Explosives_Place {
	displayName = "APERS Tripwire Mine";
	model = "\A3\Weapons_F\explosives\mine_AP_tripwire";
	AGM_offset[] = {1,0,0};
};

class AGM_Explosives_Place_ATMine:AGM_Explosives_Place {
	displayName = "AT Mine";
	model = "\A3\Weapons_f\Explosives\mine_at";
};

class AGM_Explosives_Place_Claymore:AGM_Explosives_Place {
	displayName = "Claymore";
	model = "\A3\Weapons_F\explosives\mine_AP_miniclaymore";
};

class AGM_Explosives_Place_SatchelCharge:AGM_Explosives_Place {
	displayName = "Satchel Charge";
	model = "\A3\Weapons_F\Explosives\satchel";
};

class AGM_Explosives_Place_SLAM:AGM_Explosives_Place {
	displayName = "SLAM";
	model = "\A3\Weapons_F\Explosives\mine_SLAM_directional";
};
/*
class AGM_Explosives_Place_NavalMine:AGM_Explosives_Place {
	displayName = "Naval Mine";
	model = "\A3\Weapons_F\explosives\mine_naval";
};
class AGM_Explosives_Place_NavalABMine:AGM_Explosives_Place {
	displayName = "Naval Mine";
	model = "\A3\Weapons_F\explosives\mine_naval2";
};
class AGM_Explosives_Place_NavalPDMMine:AGM_Explosives_Place {
	displayName = "Naval Mine";
	model = "\A3\Weapons_F\explosives\mine_naval3";
};*/
