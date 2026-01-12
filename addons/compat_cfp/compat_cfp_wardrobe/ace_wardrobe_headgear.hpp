#define BOONIEHATS(BoonieHatUnfolded,BoonieHatFolded)\
class BoonieHatUnfolded: ACEWARDROBE(base) {\
    class modifiableTo {\
        class BoonieHatFolded {};\
    };\
};\
class BoonieHatFolded: ACEWARDROBE(base) {\
    class modifiableTo {\
        class BoonieHatUnfolded {};\
    };\
}

BOONIEHATS(CFP_BoonieHat_DCU,CFP_BoonieHat2_DCU);
BOONIEHATS(CFP_BoonieHat_M81,CFP_BoonieHat2_M81);

#define CAPS(CapRegular,CapBackwards)\
class CapRegular: ACEWARDROBE(base) {\
    class modifiableTo {\
        class CapBackwards {};\
    };\
};\
class CapBackwards: ACEWARDROBE(base) {\
    class modifiableTo {\
        class CapRegular {};\
    };\
}

CAPS(CFP_BaseballCap_Multicam,CFP_BaseballCap_Multicam_Back);
CAPS(CFP_BaseballCap_Multicam_DEF,CFP_BaseballCap_Multicam_DEF_Back);

HELMET_GOGGLES_COVER(CFP_IDF_M76,CFP_IDF_M76_GG,CFP_IDF_M76_CF_GG,CFP_IDF_M76_CB_GG,CUP_G_ESS_BLK);
HELMET_GOGGLES_COVER(CFP_IDF_M76_BD,CFP_IDF_M76_BD_GG,CFP_IDF_M76_BD_CF_GG,CFP_IDF_M76_BD_CB_GG,CUP_G_ESS_BLK);
HELMET_GOGGLES_COVER(CFP_IDF_M76_BD_Black,CFP_IDF_M76_BD_GG_Black,CFP_IDF_M76_BD_CF_GG_Black,CFP_IDF_M76_BD_CB_GG_Black,CUP_G_ESS_BLK);

#define LUNGEE_1(LungeeRegular,LungeeOpen)\
class LungeeRegular: ACEWARDROBE(base) {\
    class modifiableTo {\
        class LungeeOpen {};\
    };\
};\
class LungeeOpen: ACEWARDROBE(base) {\
    class modifiableTo {\
        class LungeeRegular {};\
    };\
}

#define LUNGEE_2(LungeeRegular,LungeeOpen,LungeeShemagh)\
class LungeeRegular: ACEWARDROBE(base) {\
    class modifiableTo {\
        class LungeeOpen {};\
        class LungeeShemagh {};\
    };\
};\
class LungeeOpen: ACEWARDROBE(base) {\
    class modifiableTo {\
        class LungeeRegular {};\
        class LungeeShemagh {};\
    };\
};\
class LungeeShemagh: ACEWARDROBE(base) {\
    class modifiableTo {\
        class LungeeRegular {};\
        class LungeeOpen {};\
    };\
}

LUNGEE_1(CFP_Lungee_Brown,CFP_Lungee_Open_Brown);
LUNGEE_1(CFP_Lungee_Green,CFP_Lungee_Shemagh_Green);
LUNGEE_1(CFP_Lungee_LightOlive,CFP_Lungee_Open_LightOlive);

LUNGEE_2(CFP_Lungee_BlueGrey,CFP_Lungee_Open_BlueGrey,CFP_Lungee_Shemagh_BlueGrey);
LUNGEE_2(CFP_Lungee_Grey,CFP_Lungee_Open_Grey,CFP_Lungee_Shemagh_Grey);
LUNGEE_2(CFP_Lungee_M81,CFP_Lungee_Open_M81,CFP_Lungee_Shemagh_M81);
LUNGEE_2(CFP_Lungee_Tan,CFP_Lungee_Open_Tan,CFP_Lungee_Shemagh);

HELMET_GOGGLES(SP_M88Helmet_Black1,SP_M88Helmet_Black2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M88Helmet_Blue1,SP_M88Helmet_Blue2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M88Helmet_Green1,SP_M88Helmet_Green2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M88Helmet_Tan1,SP_M88Helmet_Tan2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M88Helmet_Un1,SP_M88Helmet_Un2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M88PSMHelmet_Black1,SP_M88PSMHelmet_Black2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M88PSMHelmet_Blue1,SP_M88PSMHelmet_Blue2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M88PSMHelmet_Green1,SP_M88PSMHelmet_Green2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M88PSMHelmet_Tan1,SP_M88PSMHelmet_Tan2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M88PSMHelmet_Un1,SP_M88PSMHelmet_Un2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M96Helmet_Black1,SP_M96Helmet_Black2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M96Helmet_Blue1,SP_M96Helmet_Blue2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M96Helmet_Green1,SP_M96Helmet_Green2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M96Helmet_Tan1,SP_M96Helmet_Tan2,SP_Goggles_Black);
HELMET_GOGGLES(SP_M96Helmet_Un1,SP_M96Helmet_Un2,SP_Goggles_Black);
HELMET_GOGGLES(SP_MichHelmet_Black1,SP_MichHelmet_Black2,SP_Goggles_Black);
HELMET_GOGGLES(SP_MichHelmet_Green1,SP_MichHelmet_Green2,SP_Goggles_Black);
HELMET_GOGGLES(SP_MichHelmet_Tan1,SP_MichHelmet_Tan2,SP_Goggles_Black);
HELMET_GOGGLES(SP_Mk7Helmet_Black1,SP_Mk7Helmet_Black2,SP_Goggles_Black);
HELMET_GOGGLES(SP_Mk7Helmet_Blue1,SP_Mk7Helmet_Blue2,SP_Goggles_Black);
HELMET_GOGGLES(SP_Mk7Helmet_Green1,SP_Mk7Helmet_Green2,SP_Goggles_Black);
HELMET_GOGGLES(SP_Mk7Helmet_Tan1,SP_Mk7Helmet_Tan2,SP_Goggles_Black);
HELMET_GOGGLES(SP_Mk7Helmet_Un1,SP_Mk7Helmet_Un2,SP_Goggles_Black);
HELMET_GOGGLES(CFP_PASGTHelmet_ACRDesert1,CFP_PASGTHelmet_ACRDesert2,SP_Goggles_Black);
HELMET_GOGGLES(SP_PASGTHelmet_Black1,SP_PASGTHelmet_Black2,SP_Goggles_Black);
HELMET_GOGGLES(SP_PASGTHelmet_Blue1,SP_PASGTHelmet_Blue2,SP_Goggles_Black);
HELMET_GOGGLES(CFP_PASGTHelmet_ChocChip1,CFP_PASGTHelmet_ChocChip2,SP_Goggles_Black);
HELMET_GOGGLES(CFP_PASGTHelmet_DCU1,CFP_PASGTHelmet_DCU2,SP_Goggles_Black);
HELMET_GOGGLES(CFP_PASGTHelmet_EDRL1,CFP_PASGTHelmet_EDRL2,SP_Goggles_Black);
HELMET_GOGGLES(SP_PASGTHelmet_Green1,SP_PASGTHelmet_Green2,SP_Goggles_Black);
HELMET_GOGGLES(CFP_PASGTHelmet_IranDPM1,CFP_PASGTHelmet_IranDPM2,SP_Goggles_Black);
HELMET_GOGGLES(CFP_PASGTHelmet_IPDigital2,CFP_PASGTHelmet_IPDigital,SP_Goggles_Black);
HELMET_GOGGLES(CFP_PASGTHelmet_IPDPM2,CFP_PASGTHelmet_IPDPM,SP_Goggles_Black);
HELMET_GOGGLES(CFP_PASGTHelmet_Marpat1,CFP_PASGTHelmet_Marpat2,SP_Goggles_Black);
HELMET_GOGGLES(SP_PASGTHelmet_Tan1,SP_PASGTHelmet_Tan2,SP_Goggles_Black);
HELMET_GOGGLES(CFP_PASGTHelmet_Tiger1,CFP_PASGTHelmet_Tiger2,SP_Goggles_Black);
HELMET_GOGGLES(SP_PASGTHelmet_Un1,SP_PASGTHelmet_Un2,SP_Goggles_Black);
HELMET_GOGGLES(CFP_PASGTHelmet_SFUPDF1,CFP_PASGTHelmet_SFUPDF2,SP_Goggles_Black);
HELMET_GOGGLES(CFP_PASGTHelmet_Woodland1,CFP_PASGTHelmet_Woodland2,SP_Goggles_Black);

HELMET_GOGGLES(SP_ZSH1Helmet_Black1,SP_ZSH1Helmet_Black2,SP_Goggles_Black);
HELMET_GOGGLES(SP_ZSH1Helmet_Green1,SP_ZSH1Helmet_Green2,SP_Goggles_Black);
HELMET_GOGGLES(SP_ZSH1Helmet_Tan1,SP_ZSH1Helmet_Tan2,SP_Goggles_Black);

HELMET_GOGGLES_COVER(CFP_PASGTHelmet_M811,CFP_PASGTHelmet_M814,CFP_PASGTHelmet_M815,CFP_PASGTHelmet_M816,CUP_G_ESS_BLK);

class CFP_PASGTHelmet_DBDU1: ACEWARDROBE(base_H_goggles_off) {
    class modifiableTo {
        class CFP_PASGTHelmet_DBDU4 {};
        class CFP_PASGTHelmet_DBDU5 {};
    };
};
class CFP_PASGTHelmet_DBDU4: ACEWARDROBE(base_H_goggles_on) {
    class modifiableTo {
        class CFP_PASGTHelmet_DBDU1 {};
        class CFP_PASGTHelmet_DBDU5 {};
    };
    components[] = {QUOTE(CUP_G_ESS_BLK)};
};
class CFP_PASGTHelmet_DBDU5: ACEWARDROBE(base_H_goggles_on) {
    class modifiableTo {
        class CFP_PASGTHelmet_DBDU1 {};
        class CFP_PASGTHelmet_DBDU4 {};
    };
    components[] = {QUOTE(CUP_G_ESS_BLK)};
};

class CFP_PASGTHelmet_DBDU2: ACEWARDROBE(base_H_goggles_off) {
    class modifiableTo {
        class CFP_PASGTHelmet_DBDU3 {};
        class CFP_PASGTHelmet_DBDU6 {};
    };
};
class CFP_PASGTHelmet_DBDU3: ACEWARDROBE(base_H_goggles_on) {
    class modifiableTo {
        class CFP_PASGTHelmet_DBDU2 {};
        class CFP_PASGTHelmet_DBDU6 {};
    };
    components[] = {QUOTE(CUP_G_ESS_BLK)};
};
class CFP_PASGTHelmet_DBDU6: ACEWARDROBE(base_H_goggles_on) {
    class modifiableTo {
        class CFP_PASGTHelmet_DBDU2 {};
        class CFP_PASGTHelmet_DBDU3 {};
    };
    components[] = {QUOTE(CUP_G_ESS_BLK)};
};

HELMET_GOGGLES(CFP_PASGTHelmet_M812,CFP_PASGTHelmet_M813,CUP_G_ESS_BLK);

// Goggles might be changed, they are covered on the helmet
// there exists also a variante with goggles coverd at the back
#define OPSCORE_HELMET_SF_COVERED_GOGGLES(HelmetBase,HelmetGogglesFront,HelmetGogglesBack,Goggles)\
class HelmetBase: ACEWARDROBE(base_H_goggles_off) {\
    class modifiableTo {\
        class HelmetGogglesFront {};\
        class HelmetGogglesBack {};\
        components[] = {QUOTE(Goggles)};\
    };\
};\
class HelmetGogglesFront: ACEWARDROBE(base_H_goggles_on) {\
    class modifiableTo {\
        class HelmetBase {};\
        class HelmetGogglesBack {};\
    };\
};\
class HelmetGogglesBack: ACEWARDROBE(base_H_goggles_on) {\
    class modifiableTo {\
        class HelmetBase {};\
        class HelmetGogglesFront {};\
    };\
}

OPSCORE_HELMET_SF_COVERED_GOGGLES(CFP_OpsC_Covered_KSK2,CFP_OpsC_Cov_Goggles_Off_KSK2,CFP_OpsC_Med_KSK2,CUP_G_ESS_BLK);
OPSCORE_HELMET_SF_COVERED_GOGGLES(CFP_OpsC_Covered_KSK,CFP_OpsC_Cov_Goggles_Off_KSK,CFP_OpsC_Med_KSK,CUP_G_ESS_BLK);
OPSCORE_HELMET_SF_COVERED_GOGGLES(CFP_OpsC_Covered_AOR1,CFP_OpsC_Cov_Goggles_Off_AOR1,CFP_OpsC_Med_AOR1,CUP_G_ESS_BLK);
OPSCORE_HELMET_SF_COVERED_GOGGLES(CFP_OpsC_Covered_AOR2,CFP_OpsC_Cov_Goggles_Off_AOR2,CFP_OpsC_Med_AOR2,CUP_G_ESS_BLK);
OPSCORE_HELMET_SF_COVERED_GOGGLES(CFP_OpsC_Covered,CFP_OpsC_Cov_Goggles_Off,CFP_OpsC_Med,CUP_G_ESS_BLK);

// ToDo CFP_OpsC_Uncov_Full,CFP_OpsC_Uncov_Goggles,CFP_OpsC_Uncovered > (CUP_FR_NeckScarf4 + CUP_G_ESS_BLK)
// ToDo CFP_OpsC_Covered > CFP_OpsC_Cov_Full (CUP_G_ESS_CBR_Ember + CUP_FR_NeckScarf4)

BASE_PAIR(CFP_75th_Patrol_Cap,CFP_75th_Patrol_Cap_Oakleys);

class CFP_MitzHelm1_Des: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_MitzHelm2_Des {};
        class CFP_MitzHelm3_Des {};
        class CFP_MitzHelm4_Des {};
        class CFP_Mitznefet_Desert {};
        class CFP_Mitznefet_Desert_Ranger {};
        class CFP_Mitznefet_Desert_Tan {};
        class CFP_Mitznefet_Desert_Tropical {};
    };
};
class CFP_MitzHelm2_Des: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_MitzHelm1_Des {};
        class CFP_MitzHelm3_Des {};
        class CFP_MitzHelm4_Des {};
        class CFP_Mitznefet_Desert {};
        class CFP_Mitznefet_Desert_Ranger {};
        class CFP_Mitznefet_Desert_Tan {};
        class CFP_Mitznefet_Desert_Tropical {};
    };
};
class CFP_MitzHelm3_Des: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_MitzHelm1_Des {};
        class CFP_MitzHelm2_Des {};
        class CFP_MitzHelm4_Des {};
        class CFP_Mitznefet_Desert {};
        class CFP_Mitznefet_Desert_Ranger {};
        class CFP_Mitznefet_Desert_Tan {};
        class CFP_Mitznefet_Desert_Tropical {};
    };
};
class CFP_MitzHelm4_Des: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_MitzHelm1_Des {};
        class CFP_MitzHelm2_Des {};
        class CFP_MitzHelm3_Des {};
        class CFP_Mitznefet_Desert {};
        class CFP_Mitznefet_Desert_Ranger {};
        class CFP_Mitznefet_Desert_Tan {};
        class CFP_Mitznefet_Desert_Tropical {};
    };
};
class CFP_Mitznefet_Desert: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_MitzHelm1_Des {};
        class CFP_MitzHelm2_Des {};
        class CFP_MitzHelm3_Des {};
        class CFP_MitzHelm4_Des {};
    };
    components[] = {"CUP_PMC_Facewrap_Black"};
};
class CFP_Mitznefet_Desert_Ranger: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_MitzHelm1_Des {};
        class CFP_MitzHelm2_Des {};
        class CFP_MitzHelm3_Des {};
        class CFP_MitzHelm4_Des {};
    };
    components[] = {"CUP_PMC_Facewrap_Ranger"};
};
class CFP_Mitznefet_Desert_Tan: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_MitzHelm1_Des {};
        class CFP_MitzHelm2_Des {};
        class CFP_MitzHelm3_Des {};
        class CFP_MitzHelm4_Des {};
    };
    components[] = {"CUP_PMC_Facewrap_Tan"};
};
class CFP_Mitznefet_Desert_Tropical: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_MitzHelm1_Des {};
        class CFP_MitzHelm2_Des {};
        class CFP_MitzHelm3_Des {};
        class CFP_MitzHelm4_Des {};
    };
    components[] = {"CUP_PMC_Facewrap_Tropical"};
};

class CFP_MitzHelm1_Mcam: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_Mitznefet_Mcam {};
        class CFP_MitzHelm2_Mcam {};
        class CFP_MitzHelm3_Mcam {};
        class CFP_MitzHelm4_Mcam {};
    };
};
class CFP_MitzHelm2_Mcam: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_Mitznefet_Mcam {};
        class CFP_MitzHelm1_Mcam {};
        class CFP_MitzHelm3_Mcam {};
        class CFP_MitzHelm4_Mcam {};
    };
};
class CFP_MitzHelm3_Mcam: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_Mitznefet_Mcam {};
        class CFP_MitzHelm1_Mcam {};
        class CFP_MitzHelm2_Mcam {};
        class CFP_MitzHelm4_Mcam {};
    };
};
class CFP_MitzHelm4_Mcam: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_Mitznefet_Mcam {};
        class CFP_MitzHelm1_Mcam {};
        class CFP_MitzHelm2_Mcam {};
        class CFP_MitzHelm3_Mcam {};
    };
};
class CFP_Mitznefet_Mcam: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_MitzHelm1_Mcam {};
        class CFP_MitzHelm2_Mcam {};
        class CFP_MitzHelm3_Mcam {};
        class CFP_MitzHelm4_Mcam {};
    };
    components[] = {"CUP_PMC_Facewrap_Black"};
};

class CFP_MitzHelm1_Wdl: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_Mitznefet_Wdl {};
        class CFP_MitzHelm2_Wdl {};
        class CFP_MitzHelm3_Wdl {};
        class CFP_MitzHelm4_Wdl {};
        class CFP_Mitznefet_Ranger {};
        class CFP_Mitznefet {};
        class CFP_Mitznefet_Tan {};
        class CFP_Mitznefet_Tropical {};
    };
};
class CFP_MitzHelm2_Wdl: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_Mitznefet_Wdl {};
        class CFP_MitzHelm1_Wdl {};
        class CFP_MitzHelm3_Wdl {};
        class CFP_MitzHelm4_Wdl {};
        class CFP_Mitznefet_Ranger {};
        class CFP_Mitznefet {};
        class CFP_Mitznefet_Tan {};
        class CFP_Mitznefet_Tropical {};
    };
};
class CFP_MitzHelm3_Wdl: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_Mitznefet_Wdl {};
        class CFP_MitzHelm1_Wdl {};
        class CFP_MitzHelm2_Wdl {};
        class CFP_MitzHelm4_Wdl {};
        class CFP_Mitznefet_Ranger {};
        class CFP_Mitznefet {};
        class CFP_Mitznefet_Tan {};
        class CFP_Mitznefet_Tropical {};
    };
};
class CFP_MitzHelm4_Wdl: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_Mitznefet_Wdl {};
        class CFP_MitzHelm1_Wdl {};
        class CFP_MitzHelm2_Wdl {};
        class CFP_MitzHelm3_Wdl {};
        class CFP_Mitznefet_Ranger {};
        class CFP_Mitznefet {};
        class CFP_Mitznefet_Tan {};
        class CFP_Mitznefet_Tropical {};
    };
};
class CFP_Mitznefet: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_MitzHelm1_Wdl {};
        class CFP_MitzHelm2_Wdl {};
        class CFP_MitzHelm3_Wdl {};
        class CFP_MitzHelm4_Wdl {};
        class CFP_Mitznefet_Ranger {};
        class CFP_Mitznefet_Tan {};
        class CFP_Mitznefet_Tropical {};
    };
    components[] = {"CUP_PMC_Facewrap_Black"};
};

class CFP_Mitznefet_Ranger: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_MitzHelm1_Wdl {};
        class CFP_MitzHelm2_Wdl {};
        class CFP_MitzHelm3_Wdl {};
        class CFP_MitzHelm4_Wdl {};
        class CFP_Mitznefet {};
        class CFP_Mitznefet_Tan {};
        class CFP_Mitznefet_Tropical {};
    };
    components[] = {"CUP_PMC_Facewrap_Ranger"};
};
class CFP_Mitznefet_Tan: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_MitzHelm1_Wdl {};
        class CFP_MitzHelm2_Wdl {};
        class CFP_MitzHelm3_Wdl {};
        class CFP_MitzHelm4_Wdl {};
        class CFP_Mitznefet_Ranger {};
        class CFP_Mitznefet {};
        class CFP_Mitznefet_Tropical {};
    };
    components[] = {"CUP_PMC_Facewrap_Tan"};
};

class CFP_Mitznefet_Tropical: ACEWARDROBE(base) {
    class modifiableTo {
        class CFP_MitzHelm1_Wdl {};
        class CFP_MitzHelm2_Wdl {};
        class CFP_MitzHelm3_Wdl {};
        class CFP_MitzHelm4_Wdl {};
        class CFP_Mitznefet {};
        class CFP_Mitznefet_Tan {};
        class CFP_Mitznefet_Ranger {};
    };
    components[] = {"CUP_PMC_Facewrap_Tropical"};
};

BASE_PAIR(CFP_Shemagh_Head_Black,CFP_Shemagh_Full_Black);
BASE_PAIR(CFP_Shemagh_Head_M81,CFP_Shemagh_Full_M81);
BASE_PAIR(CFP_Shemagh_Head_Red,CFP_Shemagh_Full_Red);
BASE_PAIR(CFP_Shemagh_Head_Tan,CFP_Shemagh_Full_Tan);
BASE_PAIR(CFP_Shemagh_Head_White,CFP_Shemagh_Full_White);
BASE_PAIR(CFP_Shemagh_Head_Green,CFP_Shemagh_Full_Green);
