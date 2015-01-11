class ace_arty_81mm_default : ace_arty_howitzer_default {
	ACE_ARTY_BTABS = "\x\ace\addons\sys_arty_ammunition\81mm\tables\ace_arty_81mm_genericBtab_%1_chg%2.sqf"; // 1 = angle (LA/HA) 2 = chg#
	ACE_ARTY_BTABS_KEY = "ace_arty_81mm_genericBtab_%1_chg%2";
	scope = 2;
	ACE_Weight = 4.5;
};

class ace_arty_81mm_m821a2: ace_arty_81mm_default {
	scope = 1;
	type = 0;
	displayName = "81mm M821A2 HE";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_81mm_m821a2_m734_%1_chg%2";
	//ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\81mm\data\images\m821a2_chg%1.paa";
	//ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\81mm\data\images\m821a2.paa";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "";
	ACE_ARTY_SHELL_IMAGE = "";	
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_m821a2_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"pd", "prox", "nsb","delay"};
	ACE_ARTY_FUZE_DESC[] = {"Impact Burst", "Proximity Burst", "Near-Surface Burst", "Delay"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_81mm_m821a2_m734_pd", "ace_arty_81mm_m821a2_m734_prox", "ace_arty_81mm_m821a2_m734_nsb" ,"ace_arty_81mm_m821a2_m734_delay"};
	ACE_ARTY_MINCHARGE = 0;
	ACE_ARTY_MAXCHARGE = 4;
	ACE_ARTY_INEFFECT = "HE";
	ACE_Weight = 4.5;
};
//IMP
class ace_arty_81mm_m821a2_m734_pd_chg0: ace_arty_howitzer_mag {
	displayName = "81mm M821A2 IMP 0";
	ammo = "ace_arty_81mm_m821a2_m734_pd";
	initSpeed = 65.532;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_81mm_m821a2";
	ACE_Weight = 4.5;
};
class ace_arty_81mm_m821a2_m734_pd_chg1: ace_arty_81mm_m821a2_m734_pd_chg0  { initSpeed = 133.5; displayName = "81mm M821A2 IMP +1"; };
class ace_arty_81mm_m821a2_m734_pd_chg2: ace_arty_81mm_m821a2_m734_pd_chg0 { initSpeed = 185.3184; displayName = "81mm M821A2 IMP +2"; };
class ace_arty_81mm_m821a2_m734_pd_chg3: ace_arty_81mm_m821a2_m734_pd_chg0 { initSpeed = 228.6; displayName = "81mm M821A2 IMP +3"; };
class ace_arty_81mm_m821a2_m734_pd_chg4: ace_arty_81mm_m821a2_m734_pd_chg0 { initSpeed = 267.9192; displayName = "81mm M821A2 IMP +4"; };
//PRX
class ace_arty_81mm_m821a2_m734_prox_chg0 : ace_arty_howitzer_mag {
	displayName = "81mm M821A2 PRX 0";
	ammo = "ace_arty_81mm_m821a2_m734_prox";
	initSpeed = 65.532;
	ACE_Weight = 4.5;
};
class ace_arty_81mm_m821a2_m734_prox_chg1 : ace_arty_81mm_m821a2_m734_prox_chg0 { initSpeed = 133.5; displayName = "81mm M821A2 PRX +1"; };
class ace_arty_81mm_m821a2_m734_prox_chg2 : ace_arty_81mm_m821a2_m734_prox_chg0 { initSpeed = 185.3184; displayName = "81mm M821A2 PRX +2"; };
class ace_arty_81mm_m821a2_m734_prox_chg3 : ace_arty_81mm_m821a2_m734_prox_chg0 { initSpeed = 228.6; displayName = "81mm M821A2 PRX +3"; };
class ace_arty_81mm_m821a2_m734_prox_chg4 : ace_arty_81mm_m821a2_m734_prox_chg0 { initSpeed = 267.9192; displayName = "81mm M821A2 PRX +4"; };
//DLY
class ace_arty_81mm_m821a2_m734_delay_chg0 : ace_arty_howitzer_mag {
	displayName = "81mm M821A2 DLY 0";
	ammo = "ace_arty_81mm_m821a2_m734_delay";
	initSpeed = 65.532;
	ACE_Weight = 4.5;
};
class ace_arty_81mm_m821a2_m734_delay_chg1 : ace_arty_81mm_m821a2_m734_delay_chg0 { initSpeed = 133.5; displayName = "81mm M821A2 DLY +1"; };
class ace_arty_81mm_m821a2_m734_delay_chg2 : ace_arty_81mm_m821a2_m734_delay_chg0 { initSpeed = 185.3184; displayName = "81mm M821A2 DLY +2"; };
class ace_arty_81mm_m821a2_m734_delay_chg3 : ace_arty_81mm_m821a2_m734_delay_chg0 { initSpeed = 228.6; displayName = "81mm M821A2 DLY +3"; };
class ace_arty_81mm_m821a2_m734_delay_chg4 : ace_arty_81mm_m821a2_m734_delay_chg0 { initSpeed = 267.9192; displayName = "81mm M821A2 DLY +4"; };
//NSB
class ace_arty_81mm_m821a2_m734_nsb_chg0 : ace_arty_howitzer_mag {
	displayName = "81mm M821A2 NSB 0";
	ammo = "ace_arty_81mm_m821a2_m734_prox";
	initSpeed = 65.532;
	ACE_Weight = 4.5;
};
class ace_arty_81mm_m821a2_m734_nsb_chg1 : ace_arty_81mm_m821a2_m734_nsb_chg0 { initSpeed = 133.5; displayName = "81mm M821A2 NSB +1"; };
class ace_arty_81mm_m821a2_m734_nsb_chg2 : ace_arty_81mm_m821a2_m734_nsb_chg0 { initSpeed = 185.3184; displayName = "81mm M821A2 NSB +2"; };
class ace_arty_81mm_m821a2_m734_nsb_chg3 : ace_arty_81mm_m821a2_m734_nsb_chg0 { initSpeed = 228.6; displayName = "81mm M821A2 NSB +3"; };
class ace_arty_81mm_m821a2_m734_nsb_chg4 : ace_arty_81mm_m821a2_m734_nsb_chg0 { initSpeed = 267.9192; displayName = "81mm M821A2 NSB +4"; };


// ILLUM
class ace_arty_81mm_m853a1: ace_arty_81mm_default {
	scope = 1;
	type = 0;
	displayName = "81mm M853A1 Illumination";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_81mm_m853a1_m772_%1_chg%2";
	//ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\81mm\data\images\m821a2_chg%1.paa";
	//ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\81mm\data\images\m821a2.paa";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "";
	ACE_ARTY_SHELL_IMAGE = "";	
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_m853a1_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"time"};
	ACE_ARTY_FUZE_DESC[] = {"Time"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_81mm_m853a1_m772_time"};
	ACE_ARTY_MINCHARGE = 1;
	ACE_ARTY_MAXCHARGE = 4;
	ACE_ARTY_INEFFECT = "ILLUM";
	ACE_Weight = 4.1;
};

class ace_arty_81mm_m853a1_m772_time_chg0 : ace_arty_howitzer_mag {
	displayName = "81mm M853A1 M772 TIME Chg. 0";
	ammo = "ace_arty_81mm_m853a1_m772_time";
	initSpeed = 65.532;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_81mm_m853a1";
	ACE_Weight = 4.1;
};
class ace_arty_81mm_m853a1_m772_time_chg1 : ace_arty_81mm_m853a1_m772_time_chg0 { initSpeed = 133.5; displayName = "81mm M853A1 M772 TIME Chg. 1"; };
class ace_arty_81mm_m853a1_m772_time_chg2 : ace_arty_81mm_m853a1_m772_time_chg0 { initSpeed = 185.3184; displayName = "81mm M853A1 M772 TIME Chg. 2"; };
class ace_arty_81mm_m853a1_m772_time_chg3 : ace_arty_81mm_m853a1_m772_time_chg0 { initSpeed = 228.6; displayName = "81mm M853A1 M772 TIME Chg. 3"; };
class ace_arty_81mm_m853a1_m772_time_chg4 : ace_arty_81mm_m853a1_m772_time_chg0 { initSpeed = 267.9192; displayName = "81mm M853A1 M772 TIME Chg. 4"; };

// WP
class ace_arty_81mm_m375a3 : ace_arty_81mm_default {
	scope = 1;
	type = 0;
	displayName = "81mm M375A3 WP";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_81mm_m375a3_m524_%1_chg%2";
	//ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\81mm\data\images\m821a2_chg%1.paa";
	//ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\81mm\data\images\m821a2.paa";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "";
	ACE_ARTY_SHELL_IMAGE = "";	
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_m375a3_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"pd"};
	ACE_ARTY_FUZE_DESC[] = {"Point Detonate"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_81mm_m375a3_m524_pd"};
	ACE_ARTY_MINCHARGE = 0;
	ACE_ARTY_MAXCHARGE = 4;
	ACE_ARTY_INEFFECT = "WP";
	ACE_Weight = 4.24;
};

class ace_arty_81mm_m375a3_m524_pd_chg0 : ace_arty_howitzer_mag {
	displayName = "81mm M375A3 M524 PD Chg. 0";
	ammo = "ace_arty_81mm_m375a3_m524_pd";
	initSpeed = 65.532;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_81mm_m375a3";
	ACE_Weight = 4.24;
};
class ace_arty_81mm_m375a3_m524_pd_chg1 : ace_arty_81mm_m375a3_m524_pd_chg0 { initSpeed = 133.5; displayName = "81mm M375A3 M524 PD Chg. 1"; };
class ace_arty_81mm_m375a3_m524_pd_chg2 : ace_arty_81mm_m375a3_m524_pd_chg0 { initSpeed = 185.3184; displayName = "81mm M375A3 M524 PD Chg. 2"; };
class ace_arty_81mm_m375a3_m524_pd_chg3 : ace_arty_81mm_m375a3_m524_pd_chg0 { initSpeed = 228.6; displayName = "81mm M375A3 M524 PD Chg. 3"; };
class ace_arty_81mm_m375a3_m524_pd_chg4 : ace_arty_81mm_m375a3_m524_pd_chg0 { initSpeed = 254; displayName = "81mm M375A3 M524 PD Chg. 4"; };
