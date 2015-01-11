class ace_arty_82mm_default: ace_arty_howitzer_default {
	ACE_ARTY_BTABS = "\x\ace\addons\sys_arty_ammunition\82mm\tables\ace_arty_82mm_genericBtab_%1_chg%2.sqf"; // 1 = angle (LA/HA) 2 = chg#
	ACE_ARTY_BTABS_KEY = "ace_arty_82mm_genericBtab_%1_chg%2";
	scope = 2;
	ACE_Weight = 4.5;
};

class ace_arty_82mm_he: ace_arty_82mm_default {
	scope = 1;
	type = 0;
	displayName = "82mm HE";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_82mm_he_%1_chg%2";
	ACE_ARTY_BTABS = "\x\ace\addons\sys_arty_ammunition\82mm\tables\ace_arty_82mm_heBtab_%1_chg%2.sqf"; 
	//ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\82mm\data\images\m720_chg%1.paa";
	//ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\82mm\data\images\m720.paa";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "";
	ACE_ARTY_SHELL_IMAGE = "";		
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_82mm_he_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"pd"};
	ACE_ARTY_FUZE_DESC[] = {"Point Detonate"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_82mm_he_pd"};
	ACE_ARTY_MINCHARGE = 0;
	ACE_ARTY_MAXCHARGE = 6;
	ACE_ARTY_INEFFECT = "HE";
	ACE_Weight = 4.5;
};

class ace_arty_82mm_he_pd_chg0: ace_arty_howitzer_mag {
	displayName = "82mm HE PD Chg. 0";
	ammo = "ace_arty_82mm_he_pd";
	initSpeed = 70;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_82mm_he";
	ACE_Weight = 4.5;
};
class ace_arty_82mm_he_pd_chg1: ace_arty_82mm_he_pd_chg0  { initSpeed = 121; displayName = "82mm HE PD Chg. 1"; };
class ace_arty_82mm_he_pd_chg2: ace_arty_82mm_he_pd_chg0 { initSpeed = 164; displayName = "82mm HE PD Chg. 2"; };
class ace_arty_82mm_he_pd_chg3: ace_arty_82mm_he_pd_chg0 { initSpeed = 200; displayName = "82mm HE PD Chg. 3"; };
class ace_arty_82mm_he_pd_chg4: ace_arty_82mm_he_pd_chg0  { initSpeed = 230; displayName = "82mm HE PD Chg. 4"; };
class ace_arty_82mm_he_pd_chg5: ace_arty_82mm_he_pd_chg0 { initSpeed = 259; displayName = "82mm HE PD Chg. 5"; };
class ace_arty_82mm_he_pd_chg6: ace_arty_82mm_he_pd_chg0 { initSpeed = 284; displayName = "82mm HE PD Chg. 6"; };

// ILLUM
class ace_arty_82mm_illum: ace_arty_82mm_default {
	scope = 1;
	type = 0;
	displayName = "82mm Illumination";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_82mm_illum_%1_chg%2";
	ACE_ARTY_BTABS = "\x\ace\addons\sys_arty_ammunition\82mm\tables\ace_arty_82mm_illumBtab_%1_chg%2.sqf"; 
	//ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\82mm\data\images\m14_chg%1.paa";
	//ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\82mm\data\images\M721.paa";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "";
	ACE_ARTY_SHELL_IMAGE = "";		
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_82mm_illum_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"time"};
	ACE_ARTY_FUZE_DESC[] = {"Time"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_82mm_illum_time"};
	ACE_ARTY_MINCHARGE = 1;
	ACE_ARTY_MAXCHARGE = 3;
	ACE_ARTY_INEFFECT = "ILLUM";
};

class ace_arty_82mm_illum_time_chg0: ace_arty_howitzer_mag {
	displayName = "82mm ILLUM TIME Chg. 0";
	ammo = "ace_arty_82mm_illum_time";
	initSpeed = 64;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_82mm_illum";
	ACE_Weight = 4.5;
};
class ace_arty_82mm_illum_time_chg1: ace_arty_82mm_illum_time_chg0 { initSpeed = 125; displayName = "82mm ILLUM TIME Chg. 1"; };
class ace_arty_82mm_illum_time_chg2: ace_arty_82mm_illum_time_chg0 { initSpeed = 165; displayName = "82mm ILLUM TIME Chg. 2"; };
class ace_arty_82mm_illum_time_chg3: ace_arty_82mm_illum_time_chg0 { initSpeed = 199; displayName = "82mm ILLUM TIME Chg. 3"; };

// WP
class ace_arty_82mm_wp: ace_arty_82mm_default {
	scope = 1;
	type = 0;
	displayName = "82mm WP";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_82mm_wp_%1_chg%2";
	ACE_ARTY_BTABS = "\x\ace\addons\sys_arty_ammunition\82mm\tables\ace_arty_82mm_wpBtab_%1_chg%2.sqf"; 
	//ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\82mm\data\images\m14_chg%1.paa";
	//ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\82mm\data\images\M722A1.paa";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "";
	ACE_ARTY_SHELL_IMAGE = "";		
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_82mm_smoke_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"pd"};
	ACE_ARTY_FUZE_DESC[] = {"Point Detonate"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_82mm_wp_pd"};
	ACE_ARTY_MINCHARGE = 0;
	ACE_ARTY_MAXCHARGE = 3;
	ACE_ARTY_INEFFECT = "WP";
	ACE_Weight = 4.5;
};

class ace_arty_82mm_wp_pd_chg0: ace_arty_howitzer_mag {
	displayName = "82mm WP PD Chg. 0";
	ammo = "ace_arty_82mm_wp_pd";
	initSpeed = 70;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_82mm_wp";
	ACE_Weight = 4.5;
};
class ace_arty_82mm_wp_pd_chg1: ace_arty_82mm_wp_pd_chg0 { initSpeed = 127; displayName = "82mm WP PD Chg. 1"; };
class ace_arty_82mm_wp_pd_chg2: ace_arty_82mm_wp_pd_chg0 { initSpeed = 170; displayName = "82mm WP PD Chg. 2"; };
class ace_arty_82mm_wp_pd_chg3: ace_arty_82mm_wp_pd_chg0 { initSpeed = 206; displayName = "82mm WP PD Chg. 3"; };
