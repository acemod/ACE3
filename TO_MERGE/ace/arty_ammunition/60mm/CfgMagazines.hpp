class ace_arty_60mm_default: ace_arty_howitzer_default {
	ACE_ARTY_BTABS = "\x\ace\addons\sys_arty_ammunition\60mm\tables\ace_arty_60mm_genericBtab_%1_chg%2.sqf"; // 1 = angle (LA/HA) 2 = chg#
	ACE_ARTY_BTABS_KEY = "ace_arty_60mm_genericBtab_%1_chg%2";
	scope = 2;
	ACE_Weight = 1.66;
};

class ace_arty_60mm_m720a1: ace_arty_60mm_default {
	scope = 1;
	type = 0;
	displayName = "60mm M720A1 HE";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_60mm_m720a1_m734_%1_chg%2";
	//ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\60mm\data\images\m720_chg%1.paa";
	//ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\60mm\data\images\m720.paa";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "";
	ACE_ARTY_SHELL_IMAGE = "";
	
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_m720a1_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"pd", "prox", "nsb", "delay"};
	ACE_ARTY_FUZE_DESC[] = {"Impact Burst", "Proximity Burst", "Near-Surface Burst", "Delay"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_60mm_m720a1_m734_pd", "ace_arty_60mm_m720a1_m734_prox", "ace_arty_60mm_m720a1_m734_nsb", "ace_arty_60mm_m720a1_m734_delay"};
	ACE_ARTY_MINCHARGE = 0;
	ACE_ARTY_MAXCHARGE = 4;
	ACE_ARTY_INEFFECT = "HE";
	ACE_Weight = 1.66;
};
//IMP
class ace_arty_60mm_m720a1_m734_pd_chg0: ace_arty_howitzer_mag {
	displayName = "60mm M720A1 IMP Chg. 0";
	ammo = "ace_arty_60mm_m720a1_m734_pd";
	initSpeed = 64;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_60mm_m720a1";
	ACE_Weight = 1.66;
};

/*
0- 64
1- 126.492
2- 170.688
3- 207.264
4- 246.888
*/
class ace_arty_60mm_m720a1_m734_pd_chg1: ace_arty_60mm_m720a1_m734_pd_chg0  { initSpeed = 124; displayName = "60mm M720A1 IMP Chg. 1"; };
class ace_arty_60mm_m720a1_m734_pd_chg2: ace_arty_60mm_m720a1_m734_pd_chg0 { initSpeed = 160.16; displayName = "60mm M720A1 IMP Chg. 2"; };
class ace_arty_60mm_m720a1_m734_pd_chg3: ace_arty_60mm_m720a1_m734_pd_chg0 { initSpeed = 180.92; displayName = "60mm M720A1 IMP Chg. 3"; };
class ace_arty_60mm_m720a1_m734_pd_chg4: ace_arty_60mm_m720a1_m734_pd_chg0 { initSpeed = 207.264; displayName = "60mm M720A1 IMP Chg. 4"; };
//PRX (3 - 13 feet / 1 - 4 m)
class ace_arty_60mm_m720a1_m734_prox_chg0: ace_arty_howitzer_mag {
	displayName = "60mm M720A1 PRX Chg. 0";
	ammo = "ace_arty_60mm_m720a1_m734_prox";
	initSpeed = 64;
	ACE_Weight = 1.66;
};
class ace_arty_60mm_m720a1_m734_prox_chg1: ace_arty_60mm_m720a1_m734_prox_chg0 { initSpeed = 124; displayName = "60mm M720A1 PRX Chg. 1"; };
class ace_arty_60mm_m720a1_m734_prox_chg2: ace_arty_60mm_m720a1_m734_prox_chg0 { initSpeed = 160.16; displayName = "60mm M720A1 PRX Chg. 2"; };
class ace_arty_60mm_m720a1_m734_prox_chg3: ace_arty_60mm_m720a1_m734_prox_chg0 { initSpeed = 180.92; displayName = "60mm M720A1 PRX Chg. 3"; };
class ace_arty_60mm_m720a1_m734_prox_chg4: ace_arty_60mm_m720a1_m734_prox_chg0 { initSpeed = 207.264; displayName = "60mm M720A1 PRX Chg. 4"; };
// DLY
class ace_arty_60mm_m720a1_m734_delay_chg0: ace_arty_howitzer_mag {
	displayName = "60mm M720A1 DLY Chg. 0";
	ammo = "ace_arty_60mm_m720a1_m734_delay";
	initSpeed = 64;
	ACE_Weight = 1.66;
};
class ace_arty_60mm_m720a1_m734_delay_chg1: ace_arty_60mm_m720a1_m734_delay_chg0 { initSpeed = 124; displayName = "60mm M720A1 DLY Chg. 1"; };
class ace_arty_60mm_m720a1_m734_delay_chg2: ace_arty_60mm_m720a1_m734_delay_chg0 { initSpeed = 160.16; displayName = "60mm M720A1 DLY Chg. 2"; };
class ace_arty_60mm_m720a1_m734_delay_chg3: ace_arty_60mm_m720a1_m734_delay_chg0 { initSpeed = 180.92; displayName = "60mm M720A1 DLY Chg. 3"; };
class ace_arty_60mm_m720a1_m734_delay_chg4: ace_arty_60mm_m720a1_m734_delay_chg0 { initSpeed = 207.264; displayName = "60mm M720A1 DLY Chg. 4"; };
// NSB (0-3 feet / 0 - 1 m)
class ace_arty_60mm_m720a1_m734_nsb_chg0: ace_arty_howitzer_mag {
	displayName = "60mm M720A1 NSB Chg. 0";
	ammo = "ace_arty_60mm_m720a1_m734_nsb";
	initSpeed = 64;
	ACE_Weight = 1.66;
};
class ace_arty_60mm_m720a1_m734_nsb_chg1: ace_arty_60mm_m720a1_m734_nsb_chg0 { initSpeed = 124; displayName = "60mm M720A1 NSB Chg. 1"; };
class ace_arty_60mm_m720a1_m734_nsb_chg2: ace_arty_60mm_m720a1_m734_nsb_chg0 { initSpeed = 160.16; displayName = "60mm M720A1 NSB Chg. 2"; };
class ace_arty_60mm_m720a1_m734_nsb_chg3: ace_arty_60mm_m720a1_m734_nsb_chg0 { initSpeed = 180.92; displayName = "60mm M720A1 NSB Chg. 3"; };
class ace_arty_60mm_m720a1_m734_nsb_chg4: ace_arty_60mm_m720a1_m734_nsb_chg0 { initSpeed = 207.264; displayName = "60mm M720A1 NSB Chg. 4"; };

// ILLUM
class ace_arty_60mm_m721: ace_arty_60mm_default {
	scope = 1;
	type = 0;
	displayName = "60mm M721 Illumination";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_60mm_m721_m776_%1_chg%2";
	//ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\60mm\data\images\m14_chg%1.paa";
	//ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\60mm\data\images\M721.paa";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "";
	ACE_ARTY_SHELL_IMAGE = "";
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_m721_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"time"};
	ACE_ARTY_FUZE_DESC[] = {"Time"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_60mm_m721_m776_time"};
	ACE_ARTY_MINCHARGE = 1;
	ACE_ARTY_MAXCHARGE = 4;
	ACE_ARTY_INEFFECT = "ILLUM";
	ACE_Weight = 1.71;
};

class ace_arty_60mm_m721_m776_time_chg0: ace_arty_howitzer_mag {
	displayName = "60mm M721 M776 TIME Chg. 0";
	ammo = "ace_arty_60mm_m721_m776_time";
	initSpeed = 64;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_60mm_m721";
	ACE_Weight = 1.71;
};
class ace_arty_60mm_m721_m776_time_chg1: ace_arty_60mm_m721_m776_time_chg0 { initSpeed = 124; displayName = "60mm M721 M776 TIME Chg. 1"; };
class ace_arty_60mm_m721_m776_time_chg2: ace_arty_60mm_m721_m776_time_chg0 { initSpeed = 160.16; displayName = "60mm M721 M776 TIME Chg. 2"; };
class ace_arty_60mm_m721_m776_time_chg3: ace_arty_60mm_m721_m776_time_chg0 { initSpeed = 180.92; displayName = "60mm M721 M776 TIME Chg. 3"; };
class ace_arty_60mm_m721_m776_time_chg4: ace_arty_60mm_m721_m776_time_chg0 { initSpeed = 207.264; displayName = "60mm M721 M776 TIME Chg. 4"; };

// WP
class ace_arty_60mm_m722a1: ace_arty_60mm_default {
	scope = 1;
	type = 0;
	displayName = "60mm M722A1 WP";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_60mm_m722a1_m745_%1_chg%2";
	//ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\60mm\data\images\m14_chg%1.paa";
	//ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\60mm\data\images\M722A1.paa";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "";
	ACE_ARTY_SHELL_IMAGE = "";
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_m722a1_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"pd"};
	ACE_ARTY_FUZE_DESC[] = {"Point Detonate"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_60mm_m722a1_m745_pd"};
	ACE_ARTY_MINCHARGE = 0;
	ACE_ARTY_MAXCHARGE = 4;
	ACE_ARTY_INEFFECT = "WP";
	ACE_Weight = 1.68;
};

class ace_arty_60mm_m722a1_m745_pd_chg0: ace_arty_howitzer_mag {
	displayName = "60mm M722A1 M745 PD Chg. 0";
	ammo = "ace_arty_60mm_m722a1_m745_pd";
	initSpeed = 64;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_60mm_m722a1_m745";
	ACE_Weight = 1.68;
};
class ace_arty_60mm_m722a1_m745_pd_chg1: ace_arty_60mm_m722a1_m745_pd_chg0 { initSpeed = 124; displayName = "60mm M722A1 M745 PD Chg. 1"; };
class ace_arty_60mm_m722a1_m745_pd_chg2: ace_arty_60mm_m722a1_m745_pd_chg0 { initSpeed = 160.16; displayName = "60mm M722A1 M745 PD Chg. 2"; };
class ace_arty_60mm_m722a1_m745_pd_chg3: ace_arty_60mm_m722a1_m745_pd_chg0 { initSpeed = 180.92; displayName = "60mm M722A1 M745 PD Chg. 3"; };
class ace_arty_60mm_m722a1_m745_pd_chg4: ace_arty_60mm_m722a1_m745_pd_chg0 { initSpeed = 207.264; displayName = "60mm M722A1 M745 PD Chg. 4"; };