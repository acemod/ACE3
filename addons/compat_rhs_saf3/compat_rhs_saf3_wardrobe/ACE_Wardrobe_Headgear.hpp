// SAF uses USAF glasses on their helmets
// Components
class rhs_ess_black: EGVAR(wardrobe,base) {
    fallbackComponent = "G_Combat";
};

// Macro Dfinition
#define RHS_HELMET_VEIL_ESS_BARE(HelmetOnly,HelmetVeil,HelmetEss,HelmetEssBare,Veil,Ess)\
class HelmetOnly: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetEss {};\
        class HelmetVeil {};\
    };\
    components[] = {};\
};\
class HelmetVeil: EGVAR(wardrobe,base_H_mask_on) {\
    class modifiableTo {\
        class HelmetOnly {};\
    };\
    components[] = {\
        QUOTE(Veil)\
    };\
    displayName = ECSTRING(wardrobe,maskOn);\
};\
class HelmetEss: EGVAR(wardrobe,base_H_goggles_on) {\
    class modifiableTo {\
        class HelmetOnly {};\
    };\
    components[] = {\
        QUOTE(Ess)\
    };\
};\
class HelmetEssBare: EGVAR(wardrobe,base_H_goggles_on) {\
    class modifiableTo {\
        class HelmetOnly {};\
    };\
    components[] = {\
        QUOTE(Ess)\
    };\
}

#define RHS_HELMET_ESS_BARE(HelmetOnly,HelmetEss,HelmetEssBare,Ess)\
class HelmetOnly: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetEss {};\
    };\
    components[] = {};\
};\
class HelmetEss: EGVAR(wardrobe,base_H_goggles_on) {\
    class modifiableTo {\
        class HelmetOnly {};\
    };\
    components[] = {\
        QUOTE(Ess)\
    };\
};\
class HelmetEssBare: EGVAR(wardrobe,base_H_goggles_on) {\
    class modifiableTo {\
        class HelmetOnly {};\
    };\
    components[] = {\
        QUOTE(Ess)\
    };\
}


RHS_HELMET_VEIL_ESS_BARE(rhssaf_helmet_m97_digital,rhssaf_helmet_m97_veil_digital,rhssaf_helmet_m97_digital_black_ess,rhssaf_helmet_m97_digital_black_ess_bare,rhssaf_veil_Green,rhs_ess_black);
RHS_HELMET_VEIL_ESS_BARE(rhssaf_helmet_m97_md2camo,rhssaf_helmet_m97_veil_md2camo,rhssaf_helmet_m97_md2camo_black_ess,rhssaf_helmet_m97_md2camo_black_ess_bare,rhssaf_veil_Green,rhs_ess_black);
RHS_HELMET_VEIL_ESS_BARE(rhssaf_helmet_m97_oakleaf,rhssaf_helmet_m97_veil_oakleaf,rhssaf_helmet_m97_oakleaf_black_ess,rhssaf_helmet_m97_oakleaf_black_ess_bare,rhssaf_veil_Green,rhs_ess_black);
RHS_HELMET_VEIL_ESS_BARE(rhssaf_helmet_m97_woodland,rhssaf_helmet_m97_veil_woodland,rhssaf_helmet_m97_woodland_black_ess,rhssaf_helmet_m97_woodland_black_ess_bare,rhssaf_veil_Green,rhs_ess_black);

RHS_HELMET_ESS_BARE(rhssaf_helmet_m97_black_nocamo,rhssaf_helmet_m97_black_nocamo_black_ess,rhssaf_helmet_m97_black_nocamo_black_ess_bare,rhs_ess_black);
RHS_HELMET_ESS_BARE(rhssaf_helmet_m97_nostrap_blue,rhssaf_helmet_m97_nostrap_blue_tan_ess,rhssaf_helmet_m97_nostrap_blue_tan_ess_bare,rhs_ess_black);//technicly uses Tan Border Goggles not Black
RHS_HELMET_ESS_BARE(rhssaf_helmet_m97_olive_nocamo,rhssaf_helmet_m97_olive_nocamo_black_ess,rhssaf_helmet_m97_olive_nocamo_black_ess_bare,rhs_ess_black);
