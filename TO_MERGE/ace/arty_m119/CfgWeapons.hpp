class CfgWeapons {
	class CannonCore;
	class ace_arty_m119  : CannonCore {
        magazineReloadTime = 2.5;
        dispersion = 0.0095;
        reloadTime = 2.5;
		magazines[] = {
            "ace_arty_105mm_m1_m782_pd_chg1",
			"ace_arty_105mm_m1_m782_pd_chg2",
			"ace_arty_105mm_m1_m782_pd_chg3",
			"ace_arty_105mm_m1_m782_pd_chg4",
			"ace_arty_105mm_m1_m782_pd_chg5",
			"ace_arty_105mm_m1_m782_pd_chg6",
			"ace_arty_105mm_m1_m782_pd_chg7",
			"ace_arty_105mm_m1_m782_pd_chg8",
			"ace_arty_105mm_m1_m782_time_chg1",
			"ace_arty_105mm_m1_m782_time_chg2",
			"ace_arty_105mm_m1_m782_time_chg3",
			"ace_arty_105mm_m1_m782_time_chg4",
			"ace_arty_105mm_m1_m782_time_chg5",
			"ace_arty_105mm_m1_m782_time_chg6",
			"ace_arty_105mm_m1_m782_time_chg7",
			"ace_arty_105mm_m1_m782_time_chg8",
			"ace_arty_105mm_m1_m782_prox_chg1",
			"ace_arty_105mm_m1_m782_prox_chg2",
			"ace_arty_105mm_m1_m782_prox_chg3",
			"ace_arty_105mm_m1_m782_prox_chg4",
			"ace_arty_105mm_m1_m782_prox_chg5",
			"ace_arty_105mm_m1_m782_prox_chg6",
			"ace_arty_105mm_m1_m782_prox_chg7",
			"ace_arty_105mm_m1_m782_prox_chg8",
			"ace_arty_105mm_m1_m782_delay_chg1",
			"ace_arty_105mm_m1_m782_delay_chg2",
			"ace_arty_105mm_m1_m782_delay_chg3",
			"ace_arty_105mm_m1_m782_delay_chg4",
			"ace_arty_105mm_m1_m782_delay_chg5",
			"ace_arty_105mm_m1_m782_delay_chg6",
			"ace_arty_105mm_m1_m782_delay_chg7",
			"ace_arty_105mm_m1_m782_delay_chg8",
			"ace_arty_105mm_m314a3_m782_time_chg1",
			"ace_arty_105mm_m314a3_m782_time_chg2",
			"ace_arty_105mm_m314a3_m782_time_chg3",
			"ace_arty_105mm_m314a3_m782_time_chg4",
			"ace_arty_105mm_m314a3_m782_time_chg5",
			"ace_arty_105mm_m314a3_m782_time_chg6",
			"ace_arty_105mm_m314a3_m782_time_chg7",
			"ace_arty_105mm_m84a1_m782_time_chg1",
			"ace_arty_105mm_m84a1_m782_time_chg2",
			"ace_arty_105mm_m84a1_m782_time_chg3",
			"ace_arty_105mm_m84a1_m782_time_chg4",
			"ace_arty_105mm_m84a1_m782_time_chg5",
			"ace_arty_105mm_m84a1_m782_time_chg6",
			"ace_arty_105mm_m84a1_m782_time_chg7",
			"ace_arty_105mm_m916_m782_time_chg1",
			"ace_arty_105mm_m916_m782_time_chg2",
			"ace_arty_105mm_m916_m782_time_chg3",
			"ace_arty_105mm_m916_m782_time_chg4",
			"ace_arty_105mm_m916_m782_time_chg5",
			"ace_arty_105mm_m916_m782_time_chg6",
			"ace_arty_105mm_m916_m782_time_chg7",
			"ace_arty_105mm_m916_m782_time_chg8",
			"ace_arty_105mm_m60a2_m782_pd_chg1",
			"ace_arty_105mm_m60a2_m782_pd_chg2",
			"ace_arty_105mm_m60a2_m782_pd_chg3",
			"ace_arty_105mm_m60a2_m782_pd_chg4",
			"ace_arty_105mm_m60a2_m782_pd_chg5",
			"ace_arty_105mm_m60a2_m782_pd_chg6",
			"ace_arty_105mm_m60a2_m782_pd_chg7"
        };
		scope = 1;
		displayName = "ACE M119";
		nameSound = "cannon";
		cursor = "Cannon";
		cursorAim = "\ca\Weapons\Data\clear_empty";
		cursorSize = 1;
		sound[] = {"\ca\Sounds\weapons\cannon\gun120",316.22775,1,1500};
		reloadSound[] = {"\x\ace\addons\sys_arty_m119\sounds\M119breachAction",2.0,1,20};
		//reloadMagazineSound[] = {"\x\ace\addons\sys_arty_m119\sounds\M119breachAction",2.0,1,20};
		// minRange = 10;
		// minRangeProbab = 0.6;
		// midRange = 12000;
		// midRangeProbab = 0.7;
		// maxRange = 19000;
		// maxRangeProbab = 0.1;
		
		// disable default fun stuff
		autoReload =  0;
		backgroundReload = 0;
		ballisticsComputer = 0;
		canLock = 0;
	};
};
