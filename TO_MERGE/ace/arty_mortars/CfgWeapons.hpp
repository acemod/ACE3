class CfgWeapons {
	class CannonCore;
	class ace_arty_m224 : CannonCore {
        magazineReloadTime = 0.5;
        dispersion = 0.0071428; // 25m @ 3500m (// to calc: dispersion = cep/maxrange)
        reloadTime = 0.5;
		magazines[] = {
			"ace_arty_60mm_m720a1_m734_pd_chg0",
            "ace_arty_60mm_m720a1_m734_pd_chg1",
			"ace_arty_60mm_m720a1_m734_pd_chg2",
			"ace_arty_60mm_m720a1_m734_pd_chg3",
			"ace_arty_60mm_m720a1_m734_pd_chg4",
			"ace_arty_60mm_m720a1_m734_prox_chg0",
			"ace_arty_60mm_m720a1_m734_prox_chg1",
			"ace_arty_60mm_m720a1_m734_prox_chg2",
			"ace_arty_60mm_m720a1_m734_prox_chg3",
			"ace_arty_60mm_m720a1_m734_prox_chg4",
			"ace_arty_60mm_m720a1_m734_nsb_chg0",
			"ace_arty_60mm_m720a1_m734_nsb_chg1",
			"ace_arty_60mm_m720a1_m734_nsb_chg2",
			"ace_arty_60mm_m720a1_m734_nsb_chg3",
			"ace_arty_60mm_m720a1_m734_nsb_chg4",			
			"ace_arty_60mm_m720a1_m734_delay_chg0",
			"ace_arty_60mm_m720a1_m734_delay_chg1",
			"ace_arty_60mm_m720a1_m734_delay_chg2",
			"ace_arty_60mm_m720a1_m734_delay_chg3",
			"ace_arty_60mm_m720a1_m734_delay_chg4",
			"ace_arty_60mm_m721_m776_time_chg0",
			"ace_arty_60mm_m721_m776_time_chg1",
			"ace_arty_60mm_m721_m776_time_chg2",
			"ace_arty_60mm_m721_m776_time_chg3",
			"ace_arty_60mm_m721_m776_time_chg4",
			"ace_arty_60mm_m722a1_m745_pd_chg0",
			"ace_arty_60mm_m722a1_m745_pd_chg1",
			"ace_arty_60mm_m722a1_m745_pd_chg2",
			"ace_arty_60mm_m722a1_m745_pd_chg3",
			"ace_arty_60mm_m722a1_m745_pd_chg4"
        };
		scope = 1;
		displayName = "M224";
		nameSound = "cannon";
		cursor = "Missile";
		cursorAim = "\ca\Weapons\Data\clear_empty";
		cursorSize = 1;
		begin1[] = {QPATHTO_S(data\sounds\60mm_1),db+27,1,300};
		begin2[] = {QPATHTO_S(data\sounds\60mm_1),db+25,1.3,300};	
		soundBegin[] = {"begin1",0.5,"begin2",0.5};			
		reloadSound[] = {QPATHTO_S(data\sounds\mortar_load_long),3,1,12};
		soundServo[] = {"",0.0001,1};
		autoReload =  0;
		backgroundReload = 0;
		ballisticsComputer = 0;
		canLock = 0;
	};
	class ace_arty_m252: ace_arty_m224 {
		displayName = "M252";
		magazines[] = {
			"ace_arty_81mm_m821a2_m734_pd_chg0",
            "ace_arty_81mm_m821a2_m734_pd_chg1",
			"ace_arty_81mm_m821a2_m734_pd_chg2",
			"ace_arty_81mm_m821a2_m734_pd_chg3",
			"ace_arty_81mm_m821a2_m734_pd_chg4",
			"ace_arty_81mm_m821a2_m734_prox_chg0",
			"ace_arty_81mm_m821a2_m734_prox_chg1",
			"ace_arty_81mm_m821a2_m734_prox_chg2",
			"ace_arty_81mm_m821a2_m734_prox_chg3",
			"ace_arty_81mm_m821a2_m734_prox_chg4",
			"ace_arty_81mm_m821a2_m734_nsb_chg0",
			"ace_arty_81mm_m821a2_m734_nsb_chg1",
			"ace_arty_81mm_m821a2_m734_nsb_chg2",
			"ace_arty_81mm_m821a2_m734_nsb_chg3",
			"ace_arty_81mm_m821a2_m734_nsb_chg4",			
			"ace_arty_81mm_m821a2_m734_delay_chg0",
			"ace_arty_81mm_m821a2_m734_delay_chg1",
			"ace_arty_81mm_m821a2_m734_delay_chg2",
			"ace_arty_81mm_m821a2_m734_delay_chg3",
			"ace_arty_81mm_m821a2_m734_delay_chg4",
			"ace_arty_81mm_m853a1_m772_time_chg0",
			"ace_arty_81mm_m853a1_m772_time_chg1",
			"ace_arty_81mm_m853a1_m772_time_chg2",
			"ace_arty_81mm_m853a1_m772_time_chg3",
			"ace_arty_81mm_m853a1_m772_time_chg4",
			"ace_arty_81mm_m375a3_m524_pd_chg0",
			"ace_arty_81mm_m375a3_m524_pd_chg1",
			"ace_arty_81mm_m375a3_m524_pd_chg2",
			"ace_arty_81mm_m375a3_m524_pd_chg3",
			"ace_arty_81mm_m375a3_m524_pd_chg4"
        };
		begin1[] = {QPATHTO_S(data\sounds\ace_mortar_fire),db+27,1.1,600};
		begin2[] = {QPATHTO_S(data\sounds\ace_mortar_fire),db+27,1.03,600};
		begin3[] = {QPATHTO_S(data\sounds\ace_mortar_fire),db+26,1.01,600};
		begin4[] = {QPATHTO_S(data\sounds\ace_mortar_fire),db+25,1.09,600};			
		soundBegin[] = {"begin1",0.25,"begin2",0.25,"begin3",0.25,"begin4",0.25};		
		reloadSound[] = {QPATHTO_S(data\sounds\mortar_load_short),3,1,8};
		dispersion = 0.018867; // 100m @ 5300m
	};
	class ace_arty_2b14: ace_arty_m252 {
		displayName = "2B14";
		magazines[] = {
			"ace_arty_82mm_he_pd_chg0",
            "ace_arty_82mm_he_pd_chg1",
			"ace_arty_82mm_he_pd_chg2",
			"ace_arty_82mm_he_pd_chg3",
			"ace_arty_82mm_he_pd_chg4",
			"ace_arty_82mm_he_pd_chg5",
			"ace_arty_82mm_he_pd_chg6",
			"ace_arty_82mm_illum_time_chg0",
			"ace_arty_82mm_illum_time_chg1",
			"ace_arty_82mm_illum_time_chg2",
			"ace_arty_82mm_illum_time_chg3",
			"ace_arty_82mm_wp_pd_chg0",
			"ace_arty_82mm_wp_pd_chg1",
			"ace_arty_82mm_wp_pd_chg2",
			"ace_arty_82mm_wp_pd_chg3"
        };		
		reloadSound[] = {QPATHTO_S(data\sounds\mortar_load_long),1.12202,1,12};			
	};
	class ace_arty_120tampella: ace_arty_m252 {
		displayName = "120mm Tampella";
		magazines[] = {
			"ace_arty_120mm_dm11a5_dm111a1_pd_chg0",
            "ace_arty_120mm_dm11a5_dm111a1_pd_chg1",
			"ace_arty_120mm_dm11a5_dm111a1_pd_chg2",
			"ace_arty_120mm_dm11a5_dm111a1_pd_chg3",
			"ace_arty_120mm_dm11a5_dm111a1_pd_chg4",
			"ace_arty_120mm_dm61_ppd_prox_chg0",
			"ace_arty_120mm_dm61_ppd_prox_chg1",
			"ace_arty_120mm_dm61_ppd_prox_chg2",
			"ace_arty_120mm_dm61_ppd_prox_chg3",
			"ace_arty_120mm_dm61_ppd_prox_chg4",
			"ace_arty_120mm_dm26_dm93_time_chg0",
			"ace_arty_120mm_dm26_dm93_time_chg1",
			"ace_arty_120mm_dm26_dm93_time_chg2",
			"ace_arty_120mm_dm26_dm93_time_chg3",
			"ace_arty_120mm_dm26_dm93_time_chg4",			
			"ace_arty_120mm_dm35_dm93_time_chg0",
			"ace_arty_120mm_dm35_dm93_time_chg1",
			"ace_arty_120mm_dm35_dm93_time_chg2",
			"ace_arty_120mm_dm35_dm93_time_chg3",
			"ace_arty_120mm_dm35_dm93_time_chg4"
        };
		begin1[] = {QPATHTO_S(data\sounds\120mm_1),216.228,1,800};
		begin2[] = {QPATHTO_S(data\sounds\120mm_2),216.228,1,800};
		begin3[] = {QPATHTO_S(data\sounds\120mm_5),216.228,1,800};
		begin4[] = {QPATHTO_S(data\sounds\120mm_6),216.228,1,800};		
		soundBegin[] = {"begin1",0.25,"begin2",0.25,"begin3",0.25,"begin4",0.25};
		dispersion = 0.01863; // 136m @ 7000m
	};
};
