BASE_PAIR(rhs_facewear_6m2,rhs_6m2_nvg);
BASE_PAIR(rhs_facewear_6m2_1,rhs_6m2_1_nvg);

#define HEADSET rhs_facewear_6m2
#define HEADSET_MIC rhs_facewear_6m2_1
#define BALA_HOLE_1 rhs_balaclava
#define BALA_HOLE_2 rhs_balaclava1_olive

#define ESS_GOGGLES rhs_ess_black

#define RHS_HELMET_BALA_ESS(HelmetOnly,HelmetBala,HelmetEss,HelmetCombo,Bala,ESS)\
class HelmetOnly: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetBala {};\
        class HelmetEss {};\
        class HelmetCombo {};\
    };\
    components[] = { QUOTE(HelmetOnly) };\
};\
class HelmetBala: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetOnly {};\
        class HelmetEss {};\
        class HelmetCombo {};\
    };\
    components[] = { QUOTE(HelmetOnly), QUOTE(Bala) };\
};\
class HelmetEss: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetOnly {};\
        class HelmetBala {};\
        class HelmetCombo {};\
    };\
    components[] = { QUOTE(HelmetOnly), QUOTE(ESS) };\
};\
class HelmetCombo: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetOnly {};\
        class HelmetBala {};\
        class HelmetEss {};\
    };\
    components[] = { QUOTE(HelmetOnly), QUOTE(ESS), QUOTE(Bala) };\
}

#define RHS_HELMET_FIELDCAP_BALA_ESS(HelmetOnly,FieldCapOnly,CapWithHelmet,HelmetBala,HelmetEss,HelmetCombo,Bala,ESS)\
class HelmetOnly: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetBala {};\
        class HelmetEss {};\
        class HelmetCombo {};\
        class FieldCapOnly {};\
        class CapWithHelmet {};\
    };\
    components[] = { QUOTE(HelmetOnly) };\
};\
class FieldCapOnly: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetBala {};\
        class HelmetEss {};\
        class HelmetCombo {};\
        class HelmetOnly {};\
        class CapWithHelmet {};\
    };\
    components[] = { QUOTE(FieldCapOnly) };\
};\
class CapWithHelmet: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetBala {};\
        class HelmetEss {};\
        class HelmetCombo {};\
        class HelmetOnly {};\
        class FieldCapOnly {};\
    };\
    components[] = { QUOTE(HelmetOnly), QUOTE(FieldCapOnly) };\
};\
class HelmetBala: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetOnly {};\
        class HelmetEss {};\
        class HelmetCombo {};\
        class FieldCapOnly {};\
        class CapWithHelmet {};\
    };\
    components[] = { QUOTE(HelmetOnly), QUOTE(Bala) };\
};\
class HelmetEss: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetOnly {};\
        class HelmetBala {};\
        class HelmetCombo {};\
        class FieldCapOnly {};\
        class CapWithHelmet {};\
    };\
    components[] = { QUOTE(HelmetOnly), QUOTE(ESS) };\
};\
class HelmetCombo: EGVAR(wardrobe,base) {\
    class modifiableTo {\
        class HelmetOnly {};\
        class HelmetBala {};\
        class HelmetEss {};\
        class FieldCapOnly {};\
        class CapWithHelmet {};\
    };\
    components[] = { QUOTE(HelmetOnly), QUOTE(ESS), QUOTE(Bala) };\
}


// Components
class ESS_GOGGLES: EGVAR(wardrobe,base) {
    fallbackComponent = "G_Combat";
};


// RHS_HELMET_BALA_ESS(HelmetOnly,HelmetBala,HelmetEss,HelmetCombo,Bala,ESS);
// Since the ESS glasses are not part of RHS AFRF we use the vanilla Goggles. Most likely, we'll create another compat for RHS AFRF AND USAF which then uses the RHS goggles.

RHS_HELMET_BALA_ESS(rhs_6b26_green,rhs_6b26_bala_green,rhs_6b26_ess_green,rhs_6b26_ess_bala_green,BALA_HOLE_1,ESS_GOGGLES);
RHS_HELMET_BALA_ESS(rhs_6b26_digi,rhs_6b26_digi_bala,rhs_6b26_digi_ess,rhs_6b26_digi_ess_bala,BALA_HOLE_1,ESS_GOGGLES);
RHS_HELMET_BALA_ESS(rhs_6b26,rhs_6b26_bala,rhs_6b26_ess,rhs_6b26_ess_bala,BALA_HOLE_1,ESS_GOGGLES);

RHS_HELMET_BALA_ESS(rhs_6b27m_green,rhs_6b27m_green_bala,rhs_6b27m_green_ess,rhs_6b27m_green_ess_bala,BALA_HOLE_1,ESS_GOGGLES);

RHS_HELMET_BALA_ESS(rhs_6b28,rhs_6b28_bala,rhs_6b28_ess,rhs_6b28_ess_bala,BALA_HOLE_1,ESS_GOGGLES);
RHS_HELMET_BALA_ESS(rhs_6b28_green,rhs_6b28_green_bala,rhs_6b28_green_ess,rhs_6b28_green_ess_bala,BALA_HOLE_1,ESS_GOGGLES);
RHS_HELMET_BALA_ESS(rhs_6b28_flora,rhs_6b28_flora_bala,rhs_6b28_flora_ess,rhs_6b28_flora_ess_bala,BALA_HOLE_1,ESS_GOGGLES);

RHS_HELMET_BALA_ESS(rhs_altyn_novisor,rhs_altyn_novisor_bala,rhs_altyn_novisor_ess,rhs_altyn_novisor_ess_bala,BALA_HOLE_1,ESS_GOGGLES);


// + Fieldcap Solo + Fieldcap with Helmet attached to the chest
RHS_HELMET_FIELDCAP_BALA_ESS(rhs_6b27m,rhs_fieldcap,rhs_fieldcap_helm,rhs_6b27m_bala,rhs_6b27m_ess,rhs_6b27m_ess_bala,BALA_HOLE_1,ESS_GOGGLES);
RHS_HELMET_FIELDCAP_BALA_ESS(rhs_6b27m_ml,rhs_fieldcap_ml,rhs_fieldcap_helm_ml,rhs_6b27m_ml_bala,rhs_6b27m_ml_ess,rhs_6b27m_ml_ess_bala,BALA_HOLE_1,ESS_GOGGLES);
RHS_HELMET_FIELDCAP_BALA_ESS(rhs_6b27m_digi,rhs_fieldcap_digi,rhs_fieldcap_helm_digi,rhs_6b27m_digi_bala,rhs_6b27m_digi_ess,rhs_6b27m_digi_ess_bala,BALA_HOLE_1,ESS_GOGGLES);


// Custom Combinations
class rhs_6b47: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b47_6m2 {};
        class rhs_6b47_6m2_1 {};
        class rhs_6b47_bala {};
        class rhs_6b47_ess {};
        class rhs_6b47_ess_bala {};
    };
    components[] = { QUOTE(rhs_6b47) };
};
class rhs_6b47_6m2: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b47 {};
        class rhs_6b47_6m2_1 {};
        class rhs_6b47_bala {};
        class rhs_6b47_ess {};
        class rhs_6b47_ess_bala {};
    };
    components[] = { QUOTE(rhs_6b47), QUOTE(HEADSET) };
};
class rhs_6b47_6m2_1: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b47 {};
        class rhs_6b47_6m2 {};
        class rhs_6b47_bala {};
        class rhs_6b47_ess {};
        class rhs_6b47_ess_bala {};
    };
    components[] = { QUOTE(rhs_6b47), QUOTE(HEADSET_MIC) };
};
class rhs_6b47_bala: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b47 {};
        class rhs_6b47_6m2 {};
        class rhs_6b47_6m2_1 {};
        class rhs_6b47_ess {};
        class rhs_6b47_ess_bala {};
    };
    components[] = { QUOTE(rhs_6b47), QUOTE(BALA_HOLE_2) };
};
class rhs_6b47_ess: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b47 {};
        class rhs_6b47_6m2 {};
        class rhs_6b47_6m2_1 {};
        class rhs_6b47_ess {};
        class rhs_6b47_ess_bala {};
    };
    components[] = { QUOTE(rhs_6b47), QUOTE(ESS_GOGGLES) };
};
class rhs_6b47_ess_bala: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b47 {};
        class rhs_6b47_6m2 {};
        class rhs_6b47_6m2_1 {};
        class rhs_6b47_ess {};
    };
    components[] = { QUOTE(rhs_6b47), QUOTE(ESS_GOGGLES), QUOTE(BALA_HOLE_2) };
};


class rhs_6b7_1m_emr: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m_bala1_emr {};
        class rhs_6b7_1m_bala2_emr {};
        class rhs_6b7_1m_emr_ess {};
        class rhs_6b7_1m_emr_ess_bala {};
    };
    components[] = { QUOTE(rhs_6b7_1m_emr) };
};
class rhs_6b7_1m_bala1_emr: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m_emr {};
        class rhs_6b7_1m_bala2_emr {};
        class rhs_6b7_1m_emr_ess {};
        class rhs_6b7_1m_emr_ess_bala {};
    };
    components[] = { QUOTE(rhs_6b7_1m_emr), QUOTE(BALA_HOLE_2) };
};
class rhs_6b7_1m_bala2_emr: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m_emr {};
        class rhs_6b7_1m_bala1_emr {};
        class rhs_6b7_1m_emr_ess {};
        class rhs_6b7_1m_emr_ess_bala {};
    };
    components[] = { QUOTE(rhs_6b7_1m_emr), QUOTE(BALA_HOLE_1) };
};
class rhs_6b7_1m_emr_ess: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m_emr {};
        class rhs_6b7_1m_bala1_emr {};
        class rhs_6b7_1m_bala2_emr {};
        class rhs_6b7_1m_emr_ess_bala {};
    };
    components[] = { QUOTE(rhs_6b7_1m_emr), QUOTE(ESS_GOGGLES) };
};
class rhs_6b7_1m_emr_ess_bala: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m_emr {};
        class rhs_6b7_1m_bala1_emr {};
        class rhs_6b7_1m_bala2_emr {};
        class rhs_6b7_1m_emr_ess {};
    };
    components[] = { QUOTE(rhs_6b7_1m_emr), QUOTE(ESS_GOGGLES), QUOTE(BALA_HOLE_2) };
};


class rhs_6b7_1m: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m_bala1 {};
        class rhs_6b7_1m_bala2 {};
        class rhs_6b7_1m_ess {};
        class rhs_6b7_1m_ess_bala {};
    };
    components[] = { QUOTE(rhs_6b7_1m) };
};
class rhs_6b7_1m_bala1: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m {};
        class rhs_6b7_1m_bala2 {};
        class rhs_6b7_1m_ess {};
        class rhs_6b7_1m_ess_bala {};
    };
    components[] = { QUOTE(rhs_6b7_1m), QUOTE(BALA_HOLE_2) };
};
class rhs_6b7_1m_bala2: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m {};
        class rhs_6b7_1m_bala1 {};
        class rhs_6b7_1m_ess {};
        class rhs_6b7_1m_ess_bala {};
    };
    components[] = { QUOTE(rhs_6b7_1m), QUOTE(BALA_HOLE_1) };
};
class rhs_6b7_1m_ess: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m {};
        class rhs_6b7_1m_bala1 {};
        class rhs_6b7_1m_bala2 {};
        class rhs_6b7_1m_ess_bala {};
    };
    components[] = { QUOTE(rhs_6b7_1m), QUOTE(ESS_GOGGLES) };
};
class rhs_6b7_1m_ess_bala: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m {};
        class rhs_6b7_1m_bala1 {};
        class rhs_6b7_1m_bala2 {};
        class rhs_6b7_1m_ess {};
    };
    components[] = { QUOTE(rhs_6b7_1m), QUOTE(ESS_GOGGLES), QUOTE(BALA_HOLE_2) };
};


// rhs_6b7_1m_flora
// rhs_6b7_1m_bala1_flora  // 2 small
// rhs_6b7_1m_bala2_flora  // 1 big
// rhs_6b7_1m_flora_ns3    // Funny glasses
class rhs_6b7_1m_flora: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m_bala1_flora {};
        class rhs_6b7_1m_bala2_flora {};
        class rhs_6b7_1m_flora_ns3 {};
    };
    components[] = { QUOTE(rhs_6b7_1m_flora) };
};
class rhs_6b7_1m_bala1_flora: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m_flora {};
        class rhs_6b7_1m_bala2_flora {};
        class rhs_6b7_1m_flora_ns3 {};
    };
    components[] = { QUOTE(rhs_6b7_1m_flora), QUOTE(BALA_HOLE_2) };
};
class rhs_6b7_1m_bala2_flora: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m_flora {};
        class rhs_6b7_1m_bala1_flora {};
        class rhs_6b7_1m_flora_ns3 {};
    };
    components[] = { QUOTE(rhs_6b7_1m_flora), QUOTE(BALA_HOLE_1) };
};
class rhs_6b7_1m_flora_ns3: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m_flora {};
        class rhs_6b7_1m_bala1_flora {};
        class rhs_6b7_1m_bala2_flora {};
    };
    components[] = { QUOTE(rhs_6b7_1m_flora), QUOTE(ESS_GOGGLES) };
};


class rhs_6b7_1m_olive: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m_bala1_olive {};
        class rhs_6b7_1m_bala2_olive {};
    };
    components[] = { QUOTE(rhs_6b7_1m_olive) };
};
class rhs_6b7_1m_bala1_olive: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m_olive {};
        class rhs_6b7_1m_bala2_olive {};
    };
    components[] = { QUOTE(rhs_6b7_1m_olive), QUOTE(BALA_HOLE_2) };
};
class rhs_6b7_1m_bala2_olive: EGVAR(wardrobe,base) {
    class modifiableTo {
        class rhs_6b7_1m_olive {};
        class rhs_6b7_1m_bala1_olive {};
    };
    components[] = { QUOTE(rhs_6b7_1m_olive), QUOTE(BALA_HOLE_1) };
};


// Berets: Same Beret just slightly differently arranged
BASE_PAIR(rhs_beret_mp1,rhs_beret_mp2);
BASE_PAIR(rhs_beret_vdv2,rhs_beret_vdv3);

// Fieldcap: Nomal and reversed
BASE_PAIR(rhs_fieldcap_m88,rhs_fieldcap_m88_back);
BASE_PAIR(rhs_fieldcap_m88_grey,rhs_fieldcap_m88_grey_back);
BASE_PAIR(rhs_fieldcap_m88_klmk,rhs_fieldcap_m88_klmk_back);

BASE_PAIR(rhs_fieldcap_m88_moldovan_ttsko_blue,rhs_fieldcap_m88_moldovan_ttsko_blue_back);
BASE_PAIR(rhs_fieldcap_m88_moldovan_ttsko_cold,rhs_fieldcap_m88_moldovan_ttsko_cold_back);
BASE_PAIR(rhs_fieldcap_m88_moldovan_ttsko_desat,rhs_fieldcap_m88_moldovan_ttsko_desat_back);
BASE_PAIR(rhs_fieldcap_m88_moldovan_ttsko_hot,rhs_fieldcap_m88_moldovan_ttsko_hot_back);

BASE_PAIR(rhs_fieldcap_m88_ttsko_alt,rhs_fieldcap_m88_ttsko_alt_back);
BASE_PAIR(rhs_fieldcap_m88_ttsko_vdv,rhs_fieldcap_m88_ttsko_vdv_back);

BASE_PAIR(rhs_fieldcap_m88_vsr,rhs_fieldcap_m88_vsr_back);
BASE_PAIR(rhs_fieldcap_m88_vsr_2,rhs_fieldcap_m88_vsr_2_back);

BASE_PAIR(rhs_fieldcap_m88_woodland,rhs_fieldcap_m88_woodland_back);


// Visor up / Down
HELMET_VISOR(rhs_zsh7a_mike,rhs_zsh7a_mike_alt);
HELMET_VISOR(rhs_zsh7a_mike_green,rhs_zsh7a_mike_green_alt);
HELMET_VISOR(rhs_zsh7a,rhs_zsh7a_alt);
HELMET_VISOR(rhs_altyn,rhs_altyn_visordown);
