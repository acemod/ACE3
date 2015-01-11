class ace_arty_105mm_default : ace_arty_howitzer_default {
	ACE_ARTY_BTABS = "\x\ace\addons\sys_arty_ammunition\105mm\tables\ace_arty_105mm_genericBtab_%1_chg%2.sqf"; // 1 = angle (LA/HA) 2 = chg#
	ACE_ARTY_BTABS_KEY = "ace_arty_105mm_genericBtab_%1_chg%2";
	scope = 2;
	ACE_Weight = 18.10;
};

class ace_arty_105mm_m1 : ace_arty_105mm_default {
	scope = 1;
	type = 0;
	displayName = "105mm M1 HE";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_105mm_m1_m782_%1_chg%2";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\105mm\data\images\m14_chg%1.paa";
	ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\105mm\data\images\m1.paa";
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_m1_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"pd", "prox", "time", "delay"};
	ACE_ARTY_FUZE_DESC[] = {"Point Detonate", "Proximity", "Time", "Delay"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_105mm_m1_m782_pd", "ace_arty_105mm_m1_m782_prox", "ace_arty_105mm_m1_m782_time", "ace_arty_105mm_m1_m782_delay"};
	ACE_ARTY_MINCHARGE = 1;
	ACE_ARTY_MAXCHARGE = 8;
	ACE_ARTY_INEFFECT = "HE";
};

class ace_arty_105mm_m1_m782_pd_chg1 : ace_arty_howitzer_mag {
	displayName = "105mm M1 - M782 PD Chg. 1";
	ammo = "ace_arty_105mm_m1_m782_pd";
	initSpeed = 205;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_105mm_m1";
};

class ace_arty_105mm_m1_m782_pd_chg2 : ace_arty_105mm_m1_m782_pd_chg1 { initSpeed = 223; displayName = "105mm M1 - M782 PD Chg. 2"; };
class ace_arty_105mm_m1_m782_pd_chg3 : ace_arty_105mm_m1_m782_pd_chg1 { initSpeed = 247; displayName = "105mm M1 - M782 PD Chg. 3"; };
class ace_arty_105mm_m1_m782_pd_chg4 : ace_arty_105mm_m1_m782_pd_chg1 { initSpeed = 278; displayName = "105mm M1 - M782 PD Chg. 4"; };
class ace_arty_105mm_m1_m782_pd_chg5 : ace_arty_105mm_m1_m782_pd_chg1 { initSpeed = 325; displayName = "105mm M1 - M782 PD Chg. 5"; };
class ace_arty_105mm_m1_m782_pd_chg6 : ace_arty_105mm_m1_m782_pd_chg1 { initSpeed = 393; displayName = "105mm M1 - M782 PD Chg. 6"; };
class ace_arty_105mm_m1_m782_pd_chg7 : ace_arty_105mm_m1_m782_pd_chg1 { initSpeed = 494; displayName = "105mm M1 - M782 PD Chg. 7"; };
class ace_arty_105mm_m1_m782_pd_chg8 : ace_arty_105mm_m1_m782_pd_chg1 { initSpeed = 616; displayName = "105mm M1 - M782 PD Chg. 8"; };

class ace_arty_105mm_m1_m782_time_chg1 : ace_arty_howitzer_mag {
	displayName = "105mm M1 - M782 TIME Chg. 1";
	ammo = "ace_arty_105mm_m1_m782_time";
	initSpeed = 205;
};

class ace_arty_105mm_m1_m782_time_chg2 : ace_arty_105mm_m1_m782_time_chg1 { initSpeed = 223; displayName = "105mm M1 - M782 TIME Chg. 2"; };
class ace_arty_105mm_m1_m782_time_chg3 : ace_arty_105mm_m1_m782_time_chg1 { initSpeed = 247; displayName = "105mm M1 - M782 TIME Chg. 3"; };
class ace_arty_105mm_m1_m782_time_chg4 : ace_arty_105mm_m1_m782_time_chg1 { initSpeed = 278; displayName = "105mm M1 - M782 TIME Chg. 4"; };
class ace_arty_105mm_m1_m782_time_chg5 : ace_arty_105mm_m1_m782_time_chg1 { initSpeed = 325; displayName = "105mm M1 - M782 TIME Chg. 5"; };
class ace_arty_105mm_m1_m782_time_chg6 : ace_arty_105mm_m1_m782_time_chg1 { initSpeed = 393; displayName = "105mm M1 - M782 TIME Chg. 6"; };
class ace_arty_105mm_m1_m782_time_chg7 : ace_arty_105mm_m1_m782_time_chg1 { initSpeed = 494; displayName = "105mm M1 - M782 TIME Chg. 7"; };
class ace_arty_105mm_m1_m782_time_chg8 : ace_arty_105mm_m1_m782_time_chg1 { initSpeed = 616; displayName = "105mm M1 - M782 TIME Chg. 8"; };

class ace_arty_105mm_m1_m782_prox_chg1 : ace_arty_howitzer_mag {
	displayName = "105mm M1 - M782 PROX Chg. 1";
	ammo = "ace_arty_105mm_m1_m782_prox";
	initSpeed = 205;
};

class ace_arty_105mm_m1_m782_prox_chg2 : ace_arty_105mm_m1_m782_prox_chg1 { initSpeed = 223; displayName = "105mm M1 - M782 PROX Chg. 2"; };
class ace_arty_105mm_m1_m782_prox_chg3 : ace_arty_105mm_m1_m782_prox_chg1 { initSpeed = 247; displayName = "105mm M1 - M782 PROX Chg. 3"; };
class ace_arty_105mm_m1_m782_prox_chg4 : ace_arty_105mm_m1_m782_prox_chg1 { initSpeed = 278; displayName = "105mm M1 - M782 PROX Chg. 4"; };
class ace_arty_105mm_m1_m782_prox_chg5 : ace_arty_105mm_m1_m782_prox_chg1 { initSpeed = 325; displayName = "105mm M1 - M782 PROX Chg. 5"; };
class ace_arty_105mm_m1_m782_prox_chg6 : ace_arty_105mm_m1_m782_prox_chg1 { initSpeed = 393; displayName = "105mm M1 - M782 PROX Chg. 6"; };
class ace_arty_105mm_m1_m782_prox_chg7 : ace_arty_105mm_m1_m782_prox_chg1 { initSpeed = 494; displayName = "105mm M1 - M782 PROX Chg. 7"; };
class ace_arty_105mm_m1_m782_prox_chg8 : ace_arty_105mm_m1_m782_prox_chg1 { initSpeed = 616; displayName = "105mm M1 - M782 PROX Chg. 8"; };

class ace_arty_105mm_m1_m782_delay_chg1 : ace_arty_howitzer_mag {
	displayName = "105mm M1 - M782 DELAY Chg. 1";
	ammo = "ace_arty_105mm_m1_m782_delay";
	initSpeed = 205;
};

class ace_arty_105mm_m1_m782_delay_chg2 : ace_arty_105mm_m1_m782_delay_chg1 { initSpeed = 223; displayName = "105mm M1 - M782 DELAY Chg. 2"; };
class ace_arty_105mm_m1_m782_delay_chg3 : ace_arty_105mm_m1_m782_delay_chg1 { initSpeed = 247; displayName = "105mm M1 - M782 DELAY Chg. 3"; };
class ace_arty_105mm_m1_m782_delay_chg4 : ace_arty_105mm_m1_m782_delay_chg1 { initSpeed = 278; displayName = "105mm M1 - M782 DELAY Chg. 4"; };
class ace_arty_105mm_m1_m782_delay_chg5 : ace_arty_105mm_m1_m782_delay_chg1 { initSpeed = 325; displayName = "105mm M1 - M782 DELAY Chg. 5"; };
class ace_arty_105mm_m1_m782_delay_chg6 : ace_arty_105mm_m1_m782_delay_chg1 { initSpeed = 393; displayName = "105mm M1 - M782 DELAY Chg. 6"; };
class ace_arty_105mm_m1_m782_delay_chg7 : ace_arty_105mm_m1_m782_delay_chg1 { initSpeed = 494; displayName = "105mm M1 - M782 DELAY Chg. 7"; };
class ace_arty_105mm_m1_m782_delay_chg8 : ace_arty_105mm_m1_m782_delay_chg1 { initSpeed = 616; displayName = "105mm M1 - M782 DELAY Chg. 8"; };

class ace_arty_105mm_m314a3 : ace_arty_105mm_default {
	scope = 1;
	type = 0;
	displayName = "105mm M314A3 Illumination";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_105mm_m314a3_m782_%1_chg%2";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\105mm\data\images\m14_chg%1.paa";
	ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\105mm\data\images\M314A3.paa";
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_m314a3_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"time"};
	ACE_ARTY_FUZE_DESC[] = {"Time"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_105mm_m314a3_m782"};
	ACE_ARTY_MINCHARGE = 1;
	ACE_ARTY_MAXCHARGE = 7;
	ACE_ARTY_INEFFECT = "ILLUM";
};

class ace_arty_105mm_m314a3_m782_time_chg1 : ace_arty_howitzer_mag {
	displayName = "105mm M314A3 - M782 TIME Chg. 1";
	ammo = "ace_arty_105mm_m314a3_m782";
	initSpeed = 205;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_105mm_m314a3";
};

class ace_arty_105mm_m314a3_m782_time_chg2 : ace_arty_105mm_m314a3_m782_time_chg1 { initSpeed = 223; displayName = "105mm M314A3 - M782 TIME Chg. 2"; };
class ace_arty_105mm_m314a3_m782_time_chg3 : ace_arty_105mm_m314a3_m782_time_chg1 { initSpeed = 247; displayName = "105mm M314A3 - M782 TIME Chg. 3"; };
class ace_arty_105mm_m314a3_m782_time_chg4 : ace_arty_105mm_m314a3_m782_time_chg1 { initSpeed = 278; displayName = "105mm M314A3 - M782 TIME Chg. 4"; };
class ace_arty_105mm_m314a3_m782_time_chg5 : ace_arty_105mm_m314a3_m782_time_chg1 { initSpeed = 325; displayName = "105mm M314A3 - M782 TIME Chg. 5"; };
class ace_arty_105mm_m314a3_m782_time_chg6 : ace_arty_105mm_m314a3_m782_time_chg1 { initSpeed = 393; displayName = "105mm M314A3 - M782 TIME Chg. 6"; };
class ace_arty_105mm_m314a3_m782_time_chg7 : ace_arty_105mm_m314a3_m782_time_chg1 { initSpeed = 494; displayName = "105mm M314A3 - M782 TIME Chg. 7"; };

class ace_arty_105mm_m84a1 : ace_arty_105mm_default {
	scope = 1;
	type = 0;
	displayName = "105mm M84A1 Base Ejecting HC Smoke";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_105mm_m84a1_m782_%1_chg%2";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\105mm\data\images\m14_chg%1.paa";
	ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\105mm\data\images\M84A1.paa";
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_m84a1_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"time"};
	ACE_ARTY_FUZE_DESC[] = {"Time"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_105mm_m84a1_m782"};
	ACE_ARTY_MINCHARGE = 1;
	ACE_ARTY_MAXCHARGE = 7;
	ACE_ARTY_INEFFECT = "SMOKE";
};

class ace_arty_105mm_m84a1_m782_time_chg1 : ace_arty_howitzer_mag {
	displayName = "105mm M84A1 - M782 TIME Chg. 1";
	ammo = "ace_arty_105mm_m84a1_m782";
	initSpeed = 205;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_105mm_m84a1";
};

class ace_arty_105mm_m84a1_m782_time_chg2 : ace_arty_105mm_m84a1_m782_time_chg1 { initSpeed = 223; displayName = "105mm M84A1 - M782 TIME Chg. 2"; };
class ace_arty_105mm_m84a1_m782_time_chg3 : ace_arty_105mm_m84a1_m782_time_chg1 { initSpeed = 247; displayName = "105mm M84A1 - M782 TIME Chg. 3"; };
class ace_arty_105mm_m84a1_m782_time_chg4 : ace_arty_105mm_m84a1_m782_time_chg1 { initSpeed = 278; displayName = "105mm M84A1 - M782 TIME Chg. 4"; };
class ace_arty_105mm_m84a1_m782_time_chg5 : ace_arty_105mm_m84a1_m782_time_chg1 { initSpeed = 325; displayName = "105mm M84A1 - M782 TIME Chg. 5"; };
class ace_arty_105mm_m84a1_m782_time_chg6 : ace_arty_105mm_m84a1_m782_time_chg1 { initSpeed = 393; displayName = "105mm M84A1 - M782 TIME Chg. 6"; };
class ace_arty_105mm_m84a1_m782_time_chg7 : ace_arty_105mm_m84a1_m782_time_chg1 { initSpeed = 494; displayName = "105mm M84A1 - M782 TIME Chg. 7"; };

class ace_arty_105mm_m916 : ace_arty_105mm_default {
	scope = 1;
	type = 0;
	displayName = "105mm M916 Base Ejecting DPICM";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_105mm_m916_m782_%1_chg%2";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\105mm\data\images\m14_chg%1.paa";
	ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\105mm\data\images\M916.paa";
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_m916_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"time"};
	ACE_ARTY_FUZE_DESC[] = {"Time"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_105mm_m916_m782"};
	ACE_ARTY_MINCHARGE = 1;
	ACE_ARTY_MAXCHARGE = 8;
	ACE_ARTY_INEFFECT = "DPICM";
};

class ace_arty_105mm_m916_m782_time_chg1 : ace_arty_howitzer_mag {
	displayName = "105mm M916 - M782 TIME Chg. 1";
	ammo = "ace_arty_105mm_m916_m782";
	initSpeed = 205;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_105mm_m916";
};
// m119 setVariable ["ace_sys_arty_currentRound", ["ace_arty_105mm_m1_m782_pd_chg6", [0], random (10000)]]; m119 fire "ace_arty_m119";
class ace_arty_105mm_m916_m782_time_chg2 : ace_arty_105mm_m916_m782_time_chg1 { initSpeed = 223; displayName = "105mm M916 - M782 TIME Chg. 2"; };
class ace_arty_105mm_m916_m782_time_chg3 : ace_arty_105mm_m916_m782_time_chg1 { initSpeed = 247; displayName = "105mm M916 - M782 TIME Chg. 3"; };
class ace_arty_105mm_m916_m782_time_chg4 : ace_arty_105mm_m916_m782_time_chg1 { initSpeed = 278; displayName = "105mm M916 - M782 TIME Chg. 4"; };
class ace_arty_105mm_m916_m782_time_chg5 : ace_arty_105mm_m916_m782_time_chg1 { initSpeed = 325; displayName = "105mm M916 - M782 TIME Chg. 5"; };
class ace_arty_105mm_m916_m782_time_chg6 : ace_arty_105mm_m916_m782_time_chg1 { initSpeed = 393; displayName = "105mm M916 - M782 TIME Chg. 6"; };
class ace_arty_105mm_m916_m782_time_chg7 : ace_arty_105mm_m916_m782_time_chg1 { initSpeed = 494; displayName = "105mm M916 - M782 TIME Chg. 7"; };
class ace_arty_105mm_m916_m782_time_chg8 : ace_arty_105mm_m916_m782_time_chg1 { initSpeed = 616; displayName = "105mm M916 - M782 TIME Chg. 8"; };


class ace_arty_105mm_m60a2 : ace_arty_105mm_default {
	scope = 1;
	type = 0;
	displayName = "105mm M60A2 WP";
	ACE_ARTY_MAGAZINE_FORMAT = "ace_arty_105mm_m60a2_m782_%1_chg%2";
	ACE_ARTY_CHARGE_IMAGE_FORMAT = "\x\ace\Addons\sys_arty_ammunition\105mm\data\images\m14_chg%1.paa";
	ACE_ARTY_SHELL_IMAGE = "\x\ace\Addons\sys_arty_ammunition\105mm\data\images\M60A2.paa";
	ACE_ARTY_SHELL_VEHICLE = "ace_arty_m60a2_cartridge";
	ACE_ARTY_FUZE_TYPES[] = {"pd"};
	ACE_ARTY_FUZE_DESC[] = {"Point Detonate"};
	ACE_ARTY_AMMO_CLASSES[] = {"ace_arty_105mm_m60a2_m782"};
	ACE_ARTY_MINCHARGE = 1;
	ACE_ARTY_MAXCHARGE = 7;
	ACE_ARTY_INEFFECT = "WP";
};

class ace_arty_105mm_m60a2_m782_pd_chg1 : ace_arty_howitzer_mag {
	displayName = "105mm M60A2 - M782 PD Chg. 1";
	ammo = "ace_arty_105mm_m60a2_m782_pd";
	initSpeed = 205;
	ACE_ARTY_DEFAULT_CLASS = "ace_arty_105mm_m60a2";
};

class ace_arty_105mm_m60a2_m782_pd_chg2 : ace_arty_105mm_m60a2_m782_pd_chg1 { initSpeed = 223; displayName = "105mm M60A2 - M782 PD Chg. 2"; };
class ace_arty_105mm_m60a2_m782_pd_chg3 : ace_arty_105mm_m60a2_m782_pd_chg1 { initSpeed = 247; displayName = "105mm M60A2 - M782 PD Chg. 3"; };
class ace_arty_105mm_m60a2_m782_pd_chg4 : ace_arty_105mm_m60a2_m782_pd_chg1 { initSpeed = 278; displayName = "105mm M60A2 - M782 PD Chg. 4"; };
class ace_arty_105mm_m60a2_m782_pd_chg5 : ace_arty_105mm_m60a2_m782_pd_chg1 { initSpeed = 325; displayName = "105mm M60A2 - M782 PD Chg. 5"; };
class ace_arty_105mm_m60a2_m782_pd_chg6 : ace_arty_105mm_m60a2_m782_pd_chg1 { initSpeed = 393; displayName = "105mm M60A2 - M782 PD Chg. 6"; };
class ace_arty_105mm_m60a2_m782_pd_chg7 : ace_arty_105mm_m60a2_m782_pd_chg1 { initSpeed = 494; displayName = "105mm M60A2 - M782 PD Chg. 7"; };
