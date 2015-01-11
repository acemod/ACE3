/*
#define __MV_C0 initSpeed = 102
#define __MV_C1 initSpeed = 168
#define __MV_C2 initSpeed = 224
#define __MV_C3 initSpeed = 274
#define __MV_C4 initSpeed = 322
*/
#define __MV_C0 initSpeed = 102
#define __MV_C1 initSpeed = 168
#define __MV_C2 initSpeed = 224
#define __MV_C3 initSpeed = 274
#define __MV_C4 initSpeed = 346

class ace_arty_120mm_default : ace_arty_howitzer_default {
	ACE_ARTY_BTABS = "\x\ace\addons\sys_arty_ammunition\120mm\tables\ace_arty_120mm_genericBtab_%1_chg%2.sqf"; // 1 = angle (LA/HA) 2 = chg#
	ACE_ARTY_BTABS_KEY = "ace_arty_120mm_genericBtab_%1_chg%2";
	scope = 2;
	ACE_Weight = 14.15;
};

// DM11A5 Spreng Aufschlagzünder DM111A1
class ace_arty_120mm_dm11a5: ace_arty_120mm_default {
	scope = 1;
	type = 0;
	displayName = "120mm DM 11A5 HE";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_120mm_dm11a5_dm111a1_%1_chg%2";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "";
	ACE_ARTY_SHELL_IMAGE = "";	
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_dm11_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"pd"};
	ACE_ARTY_FUZE_DESC[] = {"Impact Burst"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_120mm_dm11a5_dm111a1_pd"};
	ACE_ARTY_MINCHARGE = 0;
	ACE_ARTY_MAXCHARGE = 4;
	ACE_ARTY_INEFFECT = "HE";
	ACE_Weight = 14.15;
};
//IMP DM11A5 Spreng Aufschlagzünder DM111A1
class ace_arty_120mm_dm11a5_dm111a1_pd_chg0: ace_arty_howitzer_mag {
	displayName = "120mm DM11A5 IMP 0";
	ammo = "ace_arty_120mm_dm11a5_dm111a1_pd";
	__MV_C0;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_120mm_dm11a5";
	ACE_Weight = 14.15;
};
class ace_arty_120mm_dm11a5_dm111a1_pd_chg1: ace_arty_120mm_dm11a5_dm111a1_pd_chg0  { __MV_C1; displayName = "120mm DM11A5 IMP +1"; };
class ace_arty_120mm_dm11a5_dm111a1_pd_chg2: ace_arty_120mm_dm11a5_dm111a1_pd_chg0 { __MV_C2; displayName = "120mm DM11A5 IMP +2"; };
class ace_arty_120mm_dm11a5_dm111a1_pd_chg3: ace_arty_120mm_dm11a5_dm111a1_pd_chg0 { __MV_C3; displayName = "120mm DM11A5 IMP +3"; };
class ace_arty_120mm_dm11a5_dm111a1_pd_chg4: ace_arty_120mm_dm11a5_dm111a1_pd_chg0 { __MV_C4; displayName = "120mm DM11A5 IMP +4"; };

//DM61 Spreng Annäherungszünder PPD324-B3
class ace_arty_120mm_dm61: ace_arty_120mm_default {
	scope = 1;
	type = 0;
	displayName = "120mm DM61 HE";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_120mm_dm61_ppd_%1_chg%2";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "";
	ACE_ARTY_SHELL_IMAGE = "";	
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_dm61_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"prox"};
	ACE_ARTY_FUZE_DESC[] = {"Proximity Burst"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_120mm_dm61_ppd_prox"};
	ACE_ARTY_MINCHARGE = 0;
	ACE_ARTY_MAXCHARGE = 4;
	ACE_ARTY_INEFFECT = "HE";
	ACE_Weight = 14.15;
};

//PRX DM61 Spreng Annäherungszünder PPD324-B3
class ace_arty_120mm_dm61_ppd_prox_chg0: ace_arty_howitzer_mag {
	displayName = "120mm DM61 PRX 0";
	ammo = "ace_arty_120mm_dm61_ppd_prox";
	__MV_C0;
	ACE_Weight = 14.15;
};
class ace_arty_120mm_dm61_ppd_prox_chg1: ace_arty_120mm_dm61_ppd_prox_chg0 { __MV_C1; displayName = "120mm DM61 PRX +1"; };
class ace_arty_120mm_dm61_ppd_prox_chg2: ace_arty_120mm_dm61_ppd_prox_chg0 { __MV_C2; displayName = "120mm DM61 PRX +2"; };
class ace_arty_120mm_dm61_ppd_prox_chg3: ace_arty_120mm_dm61_ppd_prox_chg0 { __MV_C3; displayName = "120mm DM61 PRX +3"; };
class ace_arty_120mm_dm61_ppd_prox_chg4: ace_arty_120mm_dm61_ppd_prox_chg0 { __MV_C4; displayName = "120mm DM61 PRX +4"; };

//DM26 Leucht PT Doppelzünder DM93 (DM93 == M776)
class ace_arty_120mm_dm26: ace_arty_120mm_default {
	scope = 1;
	type = 0;
	displayName = "120mm DM26 Illumination";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_120mm_dm26_dm93_%1_chg%2";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "";
	ACE_ARTY_SHELL_IMAGE = "";	
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_dm26_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"time"};
	ACE_ARTY_FUZE_DESC[] = {"Time"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_120mm_dm26_dm93_time"};
	ACE_ARTY_MINCHARGE = 1;
	ACE_ARTY_MAXCHARGE = 4;
	ACE_ARTY_INEFFECT = "ILLUM";
	ACE_Weight = 14.15;
};

class ace_arty_120mm_dm26_dm93_time_chg0: ace_arty_howitzer_mag {
	displayName = "120mm DM26 DM93 TIME 0";
	ammo = "ace_arty_120mm_dm26_dm93_time";
	__MV_C0;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_120mm_m853a1";
	ACE_Weight = 14.15;
};
class ace_arty_120mm_dm26_dm93_time_chg1: ace_arty_120mm_dm26_dm93_time_chg0 { __MV_C1; displayName = "120mm DM26 TIME +1"; };
class ace_arty_120mm_dm26_dm93_time_chg2: ace_arty_120mm_dm26_dm93_time_chg0 { __MV_C2; displayName = "120mm DM26 TIME +2"; };
class ace_arty_120mm_dm26_dm93_time_chg3: ace_arty_120mm_dm26_dm93_time_chg0 { __MV_C3; displayName = "120mm DM26 TIME +3"; };
class ace_arty_120mm_dm26_dm93_time_chg4: ace_arty_120mm_dm26_dm93_time_chg0 { __MV_C4; displayName = "120mm DM26 TIME +4"; };

// DM35 Nebel HC Doppelzünder DM93
class ace_arty_120mm_dm35: ace_arty_120mm_default {
	scope = 1;
	type = 0;
	displayName = "120mm DM35 HC";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_120mm_dm35_dm93_%1_chg%2";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "";
	ACE_ARTY_SHELL_IMAGE = "";	
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_dm35_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"time"};
	ACE_ARTY_FUZE_DESC[] = {"Time"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_120mm_dm35_dm93_time"};
	ACE_ARTY_MINCHARGE = 0;
	ACE_ARTY_MAXCHARGE = 4;
	ACE_ARTY_INEFFECT = "SMOKE";
	ACE_Weight = 14.15;
};

class ace_arty_120mm_dm35_dm93_time_chg0: ace_arty_howitzer_mag {
	displayName = "120mm DM35 DM93 TIME 0";
	ammo = "ace_arty_120mm_dm35_dm93_time";
	__MV_C0;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_120mm_dm35";
	ACE_Weight = 14.15;
};
class ace_arty_120mm_dm35_dm93_time_chg1: ace_arty_120mm_dm35_dm93_time_chg0 { __MV_C1; displayName = "120mm DM35 TIME +1"; };
class ace_arty_120mm_dm35_dm93_time_chg2: ace_arty_120mm_dm35_dm93_time_chg0 { __MV_C2; displayName = "120mm DM35 TIME +2"; };
class ace_arty_120mm_dm35_dm93_time_chg3: ace_arty_120mm_dm35_dm93_time_chg0 { __MV_C3; displayName = "120mm DM35 TIME +3"; };
class ace_arty_120mm_dm35_dm93_time_chg4: ace_arty_120mm_dm35_dm93_time_chg0 { __MV_C4; displayName = "120mm DM35 TIME +4"; };
