// Macros
#define CUP_HELMET_2_ESS(HelmetBase,HelmetGoggles1,HelmetGoggles2,Goggles)\
class HelmetBase: EGVAR(wardrobe,base) {\
    class modifiableTo {\
            class HelmetGoggles1 {};\
            class HelmetGoggles2 {};\
        };\
};\
class HelmetGoggles1: EGVAR(wardrobe,base) {\
    class modifiableTo {\
            class HelmetBase {};\
        };\
    components[] = {QUOTE(Goggles)};\
};\
class HelmetGoggles2: EGVAR(wardrobe,base) {\
    class modifiableTo {\
            class HelmetBase {};\
        };\
    components[] = {QUOTE(Goggles)};\
}

#define CUP_HELMET_3_ESS(HelmetBase,HelmetGoggles1,HelmetGoggles2,HelmetGoggles3,Goggles)\
CUP_HELMET_2_ESS(HelmetBase,HelmetGoggles1,HelmetGoggles2,Goggles);\
class HelmetGoggles3: EGVAR(wardrobe,base) {\
    class modifiableTo {\
            class HelmetBase {};\
        };\
    components[] = {QUOTE(Goggles)};\
}

#define CUP_BAF_MK6(HelmetBase,HelmetGlasses,HelmetGoggles,HelmetNetting,Glasses,Goggles)\
class HelmetBase: EGVAR(wardrobe,base_H_goggles_off) {\
    class modifiableTo {\
        class HelmetGlasses {};\
        class HelmetGoggles {};\
    };\
};\
class HelmetGlasses: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetBase {};\
        class HelmetNetting {};\
    };\
    components[] = {QUOTE(Glasses)};\
};\
class HelmetGoggles: EGVAR(wardrobe,base_H_goggles_on) {\
    class modifiableTo {\
        class HelmetBase {};\
    };\
    components[] = {QUOTE(Goggles)};\
};\
class HelmetNetting: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetGlasses {};\
    };\
    components[] = {};\
}

// Russian HELMET 6B27
HELMET_GOGGLES(CUP_H_RUS_6B27_cover_BeigeDigital,CUP_H_RUS_6B27_cover_BeigeDigital_goggles,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B27_cover_BeigeDigital_headset,CUP_H_RUS_6B27_cover_BeigeDigital_headset_goggles,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B27_cover,CUP_H_RUS_6B46,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B27_cover_headset,CUP_H_RUS_6B27_cover_headset_goggles,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B27,CUP_H_RUS_6B27_goggles,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B27_headset,CUP_H_RUS_6B27_headset_goggles,CUP_G_ESS_BLK);

// Russian HELMET 6B47
// most of the these have no fitting goggles within CUP CUP_G_ESS_BLK
// Simple Cases
HELMET_GOGGLES(CUP_H_RUS_6B47_Desert_1,CUP_H_RUS_6B47_6B34C_Desert_1,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B47_NV_Desert_1,CUP_H_RUS_6B47_NV_6B34C_Desert_1,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B47_Summer,CUP_H_RUS_6B47_6B34C_Summer,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B47_NV_Summer,CUP_H_RUS_6B47_NV_6B34C_Summer,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B47_Winter,CUP_H_RUS_6B47_6B34C_Winter,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B47_NV_Winter,CUP_H_RUS_6B47_NV_6B34C_Winter,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B47_desert,CUP_H_RUS_6B47_goggles_desert,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B47_SF_headset_black,CUP_H_RUS_6B47_SF_headset_goggles_black,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B47_SF_headset_desert,CUP_H_RUS_6B47_SF_headset_goggles_desert,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_6B47_SF_headset,CUP_H_RUS_6B47_SF,CUP_G_ESS_BLK);

HELMET_GOGGLES(CUP_H_RUS_ZSH_1,CUP_H_RUS_ZSH_1_Goggles,CUP_G_ESS_BLK);

//Advanced Cases

// Russian Altyn
HELMET_VISOR(CUP_H_RUS_Altyn_Shield_Up_black,CUP_H_RUS_Altyn_Shield_Down_black);
HELMET_VISOR(CUP_H_RUS_Altyn_Shield_Up,CUP_H_RUS_Altyn_Shield_Down);
HELMET_VISOR(CUP_H_RUS_Altyn_Shield_Up_khaki,CUP_H_RUS_Altyn_Shield_Down_khaki);
HELMET_GOGGLES(CUP_H_RUS_Altyn_black,CUP_H_RUS_Altyn_Goggles_black,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_Altyn,CUP_H_RUS_Altyn_Goggles,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_Altyn_khaki,CUP_H_RUS_Altyn_Goggles_khaki,CUP_G_ESS_BLK);

HELMET_VISOR(CUP_H_RUS_K6_3_Shield_Up_black,CUP_H_RUS_K6_3_Shield_Down_black);
HELMET_VISOR(CUP_H_RUS_K6_3_Shield_Up,CUP_H_RUS_K6_3_Shield_Down);
HELMET_VISOR(CUP_H_RUS_K6_3_Shield_Up_khaki,CUP_H_RUS_K6_3_Shield_Down_khaki);
HELMET_GOGGLES(CUP_H_RUS_K6_3_black,CUP_H_RUS_K6_3_Goggles_black,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_K6_3,CUP_H_RUS_K6_3_Goggles,CUP_G_ESS_BLK);
HELMET_GOGGLES(CUP_H_RUS_K6_3_khaki,CUP_H_RUS_K6_3_Goggles_khaki,CUP_G_ESS_BLK);

// Horizon Island Legion
CUP_HELMET_2_ESS(CUP_H_HIL_HelmetACH_CCE,CUP_H_HIL_HelmetACH_GCovered_CCE,CUP_H_HIL_HelmetACH_ESS_CCE,CUP_G_ESS_BLK);
CUP_HELMET_2_ESS(CUP_H_HIL_HelmetACH_Headset_CCE,CUP_H_HIL_HelmetACH_GCovered_Headset_CCE,CUP_H_HIL_HelmetACH_ESS_Headset_CCE,CUP_G_ESS_BLK);
CUP_HELMET_2_ESS(CUP_H_HIL_HelmetACH_TTS,CUP_H_HIL_HelmetACH_GCovered_TTS,CUP_H_HIL_HelmetACH_ESS_TTS,CUP_G_ESS_BLK);
CUP_HELMET_2_ESS(CUP_H_HIL_HelmetACH_Headset_TTS,CUP_H_HIL_HelmetACH_GCovered_Headset_TTS,CUP_H_HIL_HelmetACH_ESS_Headset_TTS,CUP_G_ESS_BLK);

//Armed Forces of Ukraine
CUP_HELMET_2_ESS(CUP_H_AFU_HelmetACH_MM_14,CUP_H_AFU_HelmetACH_GCOVERED_MM_14,CUP_H_AFU_HelmetACH_ESS_MM_14,CUP_G_ESS_BLK);
CUP_HELMET_2_ESS(CUP_H_AFU_HelmetACH_Headset_MM_14,CUP_H_AFU_HelmetACH_GCOVERED_Headset_MM_14,CUP_H_AFU_HelmetACH_ESS_Headset_MM_14,CUP_G_ESS_BLK);

// US Army
// ToDo make more complex
// CUP_HELMET_2_ESS(CUP_H_USArmy_HelmetACH_OCP,CUP_H_USArmy_HelmetACH_GCOVERED_OCP,CUP_H_USArmy_HelmetACH_ESS_OCP,CUP_G_ESS_KHK);
// CUP_HELMET_2_ESS(CUP_H_USArmy_HelmetACH_Headset_OCP,CUP_H_USArmy_HelmetACH_GCOVERED_Headset_OCP,CUP_H_USArmy_HelmetACH_ESS_OCP,CUP_G_ESS_KHK);
CUP_HELMET_2_ESS(CUP_H_USArmy_HelmetACH_OEFCP,CUP_H_USArmy_HelmetACH_GCOVERED_OEFCP,CUP_H_USArmy_HelmetACH_ESS_OEFCP,CUP_G_ESS_CBR);
CUP_HELMET_2_ESS(CUP_H_USArmy_HelmetACH_Headset_OEFCP,CUP_H_USArmy_HelmetACH_GCOVERED_Headset_OEFCP,CUP_H_USArmy_HelmetACH_ESS_Headset_OEFCP,CUP_G_ESS_CBR);
CUP_HELMET_2_ESS(CUP_H_USArmy_HelmetACH_UCP,CUP_H_USArmy_HelmetACH_GCOVERED_UCP,CUP_H_USArmy_HelmetACH_ESS_UCP,CUP_G_ESS_RGR);
CUP_HELMET_2_ESS(CUP_H_USArmy_HelmetACH_Headset_UCP,CUP_H_USArmy_HelmetACH_GCOVERED_Headset_UCP,CUP_H_USArmy_HelmetACH_ESS_Headset_UCP,CUP_G_ESS_RGR);

HELMET_GOGGLES(CUP_H_USArmy_Helmet_Protec,CUP_H_USArmy_Helmet_Protec_Gog,CUP_G_ESS_BLK);

CUP_HELMET_2_ESS(CUP_H_PASGTv2_NVG_WDL_GG_CB,CUP_H_PASGTv2_NVG_WDL_CF,CUP_H_PASGTv2_NVG_WDL_GG,CUP_G_ESS_BLK);
CUP_HELMET_2_ESS(CUP_H_PASGTv2_WDL,CUP_H_PASGTv2_WDL_GG,CUP_H_PASGTv2_WDL_CF,CUP_G_ESS_BLK);

// British Armed Forces
BASE_PAIR(CUP_H_BAF_PARA_PRROVER_BERET,CUP_H_BAF_PARA_PRRUNDER_BERET);

CUP_BAF_MK6(CUP_H_BAF_MTP_Mk6_EMPTY_PRR,CUP_H_BAF_MTP_Mk6_GLASS_PRR,CUP_H_BAF_MTP_Mk6_GOGGLES_PRR,CUP_H_BAF_MTP_Mk6_NETTING_PRR,G_Lowprofile,CUP_G_ESS_CBR);
CUP_BAF_MK6(CUP_H_BAF_DDPM_Mk6_EMPTY_PRR,CUP_H_BAF_DDPM_Mk6_GLASS_PRR,CUP_H_BAF_DDPM_Mk6_GOGGLES_PRR,CUP_H_BAF_DDPM_Mk6_NETTING_PRR,G_Lowprofile,CUP_G_ESS_CBR);
CUP_BAF_MK6(CUP_H_BAF_DPM_Mk6_EMPTY_PRR,CUP_H_BAF_DPM_Mk6_GLASS_PRR,CUP_H_BAF_DPM_Mk6_GOGGLES_PRR,CUP_H_BAF_DPM_Mk6_NETTING_PRR,G_Lowprofile,CUP_G_ESS_CBR);

// MK7 MTP
class CUP_H_BAF_MTP_Mk7: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_H_BAF_MTP_Mk7_PRR_SCRIM_B {};
        class CUP_H_BAF_MTP_Mk7_PRR_SCRIM_A {};
    };
};
class CUP_H_BAF_MTP_Mk7_PRR_SCRIM_A: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_H_BAF_MTP_Mk7 {};
    };
};
class CUP_H_BAF_MTP_Mk7_PRR_SCRIM_B: EGVAR(wardrobe,base) {
    class modifiableTo {
        class CUP_H_BAF_MTP_Mk7 {};
    };
};

// Army of the Czech Republic
BASE_PAIR(CUP_H_CZ_Booniehat_vz95_des,CUP_H_CZ_Booniehat_fold_des);
BASE_PAIR(CUP_H_CZ_Hat03,CUP_H_CZ_Hat02);

HELMET_GOGGLES(CUP_H_CZ_Helmet01,CUP_H_CZ_Helmet02,CUP_G_ESS_BLK_Ember);
HELMET_GOGGLES(CUP_H_CZ_Helmet03,CUP_H_CZ_Helmet04,CUP_G_ESS_BLK_Ember);
HELMET_GOGGLES(CUP_H_CZ_Helmet07,CUP_H_CZ_Helmet08,CUP_G_ESS_BLK_Ember);
HELMET_GOGGLES(CUP_H_CZ_Helmet10,CUP_H_CZ_Helmet09,CUP_G_ESS_BLK_Ember);

// PMC
BASE_PAIR(CUP_H_PMC_Cap_Burberry,CUP_H_PMC_Cap_Back_Burberry);
BASE_PAIR(CUP_H_PMC_Cap_PRR_Burberry,CUP_H_PMC_Cap_Back_PRR_Burberry);
BASE_PAIR(CUP_H_PMC_Cap_Grey,CUP_H_PMC_Cap_Back_Grey);
BASE_PAIR(CUP_H_PMC_Cap_PRR_Grey,CUP_H_PMC_Cap_Back_PRR_Grey);
BASE_PAIR(CUP_H_PMC_Cap_EP_Grey,CUP_H_PMC_Cap_Back_EP_Grey);
BASE_PAIR(CUP_H_PMC_Cap_PRR_Tan,CUP_H_PMC_Cap_Back_PRR_Tan);
BASE_PAIR(CUP_H_PMC_Cap_EP_Tan,CUP_H_PMC_Cap_Back_EP_Tan);
BASE_PAIR(CUP_H_PMC_Cap_Tan,CUP_H_PMC_Cap_Back_Tan);

// German Armed Forces
CUP_HELMET_3_ESS(CUP_H_Ger_M92,CUP_H_Ger_M92_GG,CUP_H_Ger_M92_GG_CB,CUP_H_Ger_M92_GG_CF,CUP_G_ESS_BLK);
CUP_HELMET_3_ESS(CUP_H_Ger_M92_Black,CUP_H_Ger_M92_Black_GG,CUP_H_Ger_M92_Black_GG_CB,CUP_H_Ger_M92_Black_GG_CF,CUP_G_ESS_BLK);
CUP_HELMET_3_ESS(CUP_H_Ger_M92_Cover,CUP_H_Ger_M92_Cover_GG,CUP_H_Ger_M92_Cover_GG_CB,CUP_H_Ger_M92_Cover_GG_CF,CUP_G_ESS_BLK);
CUP_HELMET_3_ESS(CUP_H_Ger_M92_RGR,CUP_H_Ger_M92_RGR_GG,CUP_H_Ger_M92_RGR_GG_CB,CUP_H_Ger_M92_RGR_GG_CF,CUP_G_ESS_BLK);
CUP_HELMET_3_ESS(CUP_H_Ger_M92_Tan,CUP_H_Ger_M92_Tan_GG,CUP_H_Ger_M92_Tan_GG_CB,CUP_H_Ger_M92_Tan_GG_CF,CUP_G_ESS_BLK);
CUP_HELMET_3_ESS(CUP_H_Ger_M92_Cover_Trop,CUP_H_Ger_M92_Cover_Trop_GG,CUP_H_Ger_M92_Cover_Trop_GG_CB,CUP_H_Ger_M92_Cover_Trop_GG_CF,CUP_G_ESS_BLK);

// Takistani Turban
BASE_PAIR(CUP_H_TKI_Lungee_Open_01,CUP_H_TKI_Lungee_01);
BASE_PAIR(CUP_H_TKI_Lungee_Open_02,CUP_H_TKI_Lungee_02);
BASE_PAIR(CUP_H_TKI_Lungee_Open_03,CUP_H_TKI_Lungee_03);
BASE_PAIR(CUP_H_TKI_Lungee_Open_04,CUP_H_TKI_Lungee_04);
BASE_PAIR(CUP_H_TKI_Lungee_Open_05,CUP_H_TKI_Lungee_05);
BASE_PAIR(CUP_H_TKI_Lungee_Open_06,CUP_H_TKI_Lungee_06);

// Russian Pilot HELMET
HELMET_VISOR(CUP_H_RUS_ZSH_Shield_Up,CUP_H_RUS_ZSH_Shield_Down);

// Helicopter Helmets
HELMET_VISOR(CUP_H_SPH4,CUP_H_SPH4_visor);
HELMET_VISOR(CUP_H_SPH4_khaki,CUP_H_SPH4_khaki_visor);
HELMET_VISOR(CUP_H_SPH4_grey,CUP_H_SPH4_grey_visor);
HELMET_VISOR(CUP_H_SPH4_green,CUP_H_SPH4_green_visor);
