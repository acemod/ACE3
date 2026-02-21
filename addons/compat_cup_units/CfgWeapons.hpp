#define HEARING(CLASSNAME) \
    class CLASSNAME: ItemCore { \
        ace_hearing_protection = 0.75; \
        ace_hearing_lowerVolume = 0; \
    }

#define HEARING_PARENT(CLASSNAME,PARENT) \
    class CLASSNAME: PARENT { \
        ace_hearing_protection = 0.75; \
        ace_hearing_lowerVolume = 0; \
    }

class CfgWeapons {
    class ItemCore;
    class CUP_H_PMC_Beanie_Khaki;

    HEARING(CUP_H_BAF_DDPM_Mk6_CREW_PRR);
    HEARING(CUP_H_BAF_DPM_Mk6_CREW_PRR);
    HEARING(CUP_H_BAF_MTP_Mk6_CREW_PRR);
    HEARING(CUP_H_CZ_Cap_Headphones);
    HEARING(CUP_H_CZ_Cap_Headphones_des);
    HEARING(CUP_H_CZ_Helmet05);
    HEARING(CUP_H_CZ_Helmet07);
    HEARING(CUP_H_CZ_Helmet08);
    HEARING(CUP_H_CZ_Helmet09);
    HEARING(CUP_H_CZ_Helmet10);
    HEARING(CUP_H_FR_ECH);
    HEARING(CUP_H_Ger_Beret_TankCommander_Blk);
    HEARING(CUP_H_Ger_Beret_TankCommander_Grn);
    HEARING(CUP_H_Ger_Cap_EP_Grn1);
    HEARING(CUP_H_Ger_Cap_EP_Grn2);
    HEARING(CUP_H_Ger_Cap_EP_Tan1);
    HEARING(CUP_H_Ger_Cap_EP_Tan2);
    HEARING(CUP_H_OpsCore_Black);
    HEARING(CUP_H_OpsCore_Black_SF);
    HEARING(CUP_H_OpsCore_Covered_AAF);
    HEARING(CUP_H_OpsCore_Covered_AAF_SF);
    HEARING(CUP_H_OpsCore_Covered_Fleck);
    HEARING(CUP_H_OpsCore_Covered_Fleck_SF);
    HEARING(CUP_H_OpsCore_Covered_MCAM);
    HEARING(CUP_H_OpsCore_Covered_MCAM_SF);
    HEARING(CUP_H_OpsCore_Covered_MCAM_US);
    HEARING(CUP_H_OpsCore_Covered_MCAM_US_SF);
    HEARING(CUP_H_OpsCore_Covered_MTP);
    HEARING(CUP_H_OpsCore_Covered_MTP_SF);
    HEARING(CUP_H_OpsCore_Covered_Tigerstripe);
    HEARING(CUP_H_OpsCore_Covered_Tigerstripe_SF);
    HEARING(CUP_H_OpsCore_Covered_Tropen);
    HEARING(CUP_H_OpsCore_Covered_Tropen_SF);
    HEARING(CUP_H_OpsCore_Covered_UCP);
    HEARING(CUP_H_OpsCore_Covered_UCP_SF);
    HEARING(CUP_H_OpsCore_Green);
    HEARING(CUP_H_OpsCore_Green_SF);
    HEARING(CUP_H_OpsCore_Grey);
    HEARING(CUP_H_OpsCore_Grey_SF);
    HEARING(CUP_H_OpsCore_Spray);
    HEARING(CUP_H_OpsCore_Spray_SF);
    HEARING(CUP_H_OpsCore_Spray_US);
    HEARING(CUP_H_OpsCore_Spray_US_SF);
    HEARING(CUP_H_OpsCore_Tan);
    HEARING(CUP_H_OpsCore_Tan_SF);
    HEARING_PARENT(CUP_H_PMC_Beanie_Headphones_Khaki,CUP_H_PMC_Beanie_Khaki);
    HEARING_PARENT(CUP_H_PMC_Beanie_Headphones_Black,CUP_H_PMC_Beanie_Headphones_Khaki);
    HEARING_PARENT(CUP_H_PMC_Beanie_Headphones_Winter,CUP_H_PMC_Beanie_Headphones_Khaki);
    HEARING(CUP_H_PMC_Cap_Back_EP_Grey);
    HEARING(CUP_H_PMC_Cap_Back_EP_Tan);
    HEARING(CUP_H_PMC_Cap_EP_Grey);
    HEARING(CUP_H_PMC_Cap_EP_Tan);
    HEARING(CUP_H_PMC_EP_Headset);
    HEARING(CUP_H_RUS_K6_3);
    HEARING(CUP_H_USArmy_HelmetMICH_earpro);
    HEARING(CUP_H_USArmy_HelmetMICH_earpro_DCU);
    HEARING(CUP_H_USArmy_HelmetMICH_earpro_ess);
    HEARING(CUP_H_USArmy_HelmetMICH_earpro_ess_DCU);
    HEARING(CUP_H_USArmy_HelmetMICH_earpro_ess_wdl);
    HEARING(CUP_H_USArmy_HelmetMICH_earpro_wdl);
    HEARING(CUP_H_USArmy_Helmet_ECH1_Black);
    HEARING(CUP_H_USArmy_Helmet_ECH1_Green);
    HEARING(CUP_H_USArmy_Helmet_ECH1_Sand);
    HEARING(CUP_H_USArmy_Helmet_ECH2_Black);
    HEARING(CUP_H_USArmy_Helmet_ECH2_GREEN);
    HEARING(CUP_H_USArmy_Helmet_ECH2_Sand);
    HEARING(CUP_H_USMC_Crew_Helmet);
    HEARING(CUP_H_USMC_MICH2000_DEF_DES);
    HEARING(CUP_H_USMC_MICH2000_DEF_ESS_DES);
    HEARING(CUP_H_USMC_MICH2000_DEF_ESS_WDL);
    HEARING(CUP_H_USMC_MICH2000_DEF_WDL);

    class CUP_Vest_Camo_Base;
    class CUP_V_O_SLA_Flak_Vest01: CUP_Vest_Camo_Base {
         EGVAR(trenches,entrenchingTool) = 1;
    };
    class CUP_V_O_SLA_Carrier_Belt: CUP_Vest_Camo_Base {
         EGVAR(trenches,entrenchingTool) = 1;
    };

    //Fire Protection
    //Pilot and Tanker Coveralls
    class CUP_U_B_CZ_Pilot_WDL: ItemCore {
        ace_fire_protection = 0.5;
    };
    class CUP_U_B_GER_Fleck_Overalls_Pilot: ItemCore {
        ace_fire_protection = 0.5;
    };
    class CUP_U_B_GER_Fleck_Overalls_Tank: ItemCore {
        ace_fire_protection = 0.5;
    };
    class CUP_U_B_GER_Overalls_Tank: ItemCore {
        ace_fire_protection = 0.5;
    };
    class CUP_U_B_USArmy_PilotOverall: ItemCore {
        ace_fire_protection = 0.5;
    };
    class CUP_U_B_USMC_PilotOverall: ItemCore {
        ace_fire_protection = 0.5;
    };
    class CUP_U_I_RACS_PilotOverall: ItemCore {
        ace_fire_protection = 0.5;
    };
    class CUP_U_O_SLA_Overalls_Pilot: ItemCore {
        ace_fire_protection = 0.5;
    };
    class CUP_U_O_SLA_Overalls_Tank: ItemCore {
        ace_fire_protection = 0.5;
    };

    //USMC FROG https://en.wikipedia.org/wiki/Flame_Resistant_Organizational_Gear
    class CUP_U_B_USMC_FROG1_DMARPAT: ItemCore {
        ace_fire_protection = 0.2;
    };
    class CUP_U_B_USMC_FROG1_WMARPAT: ItemCore {
        ace_fire_protection = 0.2;
    };
    class CUP_U_B_USMC_FROG2_DMARPAT: ItemCore {
        ace_fire_protection = 0.2;
    };
    class CUP_U_B_USMC_FROG2_WMARPAT: ItemCore {
        ace_fire_protection = 0.2;
    };
    class CUP_U_B_USMC_FROG3_DMARPAT: ItemCore {
        ace_fire_protection = 0.2;
    };
    class CUP_U_B_USMC_FROG3_WMARPAT: ItemCore {
        ace_fire_protection = 0.2;
    };
    class CUP_U_B_USMC_FROG4_DMARPAT: ItemCore {
        ace_fire_protection = 0.2;
    };
    class CUP_U_B_USMC_FROG4_WMARPAT: ItemCore {
        ace_fire_protection = 0.2;
    };

    //Civilian Clothes
    class CUP_U_C_Fireman_01: ItemCore {
        ace_fire_protection = 0.7;
    };
    class CUP_U_C_AirMedic_orange_01: ItemCore {
        ace_fire_protection = 0.5;
    };
    class CUP_U_C_AirMedic_red_01: ItemCore {
        ace_fire_protection = 0.5;
    };
    class CUP_U_C_AirMedic_yellow_01: ItemCore {
        ace_fire_protection = 0.5;
    };
};
