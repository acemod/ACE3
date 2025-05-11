// Macro's

#undef HEADSET
#define HEADSET rhs_facewear_6m2
#undef HEADSET_MIC
#define HEADSET_MIC rhs_facewear_6m2_1
#undef BALA_HOLE_1
#define BALA_HOLE_1 rhs_balaclava
#undef BALA_HOLE_2
#define BALA_HOLE_2 rhs_balaclava1_olive

#undef ESS_GOGGLES
#define ESS_GOGGLES rhs_ess_black

#undef RHS_HELMET_BALA_ESS
#define RHS_HELMET_BALA_ESS(HelmetOnly,HelmetBala,HelmetEss,HelmetCombo,Bala,ESS)\
class HelmetEss: EGVAR(wardrobe,base) {\
    components[] = { QUOTE(HelmetOnly), QUOTE(ESS) };\
};\
class HelmetCombo: EGVAR(wardrobe,base) {\
    components[] = { QUOTE(HelmetOnly), QUOTE(ESS), QUOTE(Bala) };\
}

#undef RHS_HELMET_FIELDCAP_BALA_ESS
#define RHS_HELMET_FIELDCAP_BALA_ESS(HelmetOnly,FieldCapOnly,CapWithHelmet,HelmetBala,HelmetEss,HelmetCombo,Bala,ESS)\
class HelmetEss: EGVAR(wardrobe,base) {\
    components[] = { QUOTE(HelmetOnly), QUOTE(ESS) };\
};\
class HelmetCombo: EGVAR(wardrobe,base) {\
    components[] = { QUOTE(HelmetOnly), QUOTE(ESS), QUOTE(Bala) };\
}



// Helmets

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

class rhs_6b47_ess: EGVAR(wardrobe,base) {

    components[] = { QUOTE(rhs_6b47), QUOTE(ESS_GOGGLES) };
};
class rhs_6b47_ess_bala: EGVAR(wardrobe,base) {

    components[] = { QUOTE(rhs_6b47), QUOTE(ESS_GOGGLES), QUOTE(BALA_HOLE_2) };
};



class rhs_6b7_1m_emr_ess: EGVAR(wardrobe,base) {

    components[] = { QUOTE(rhs_6b7_1m_emr), QUOTE(ESS_GOGGLES) };
};
class rhs_6b7_1m_emr_ess_bala: EGVAR(wardrobe,base) {

    components[] = { QUOTE(rhs_6b7_1m_emr), QUOTE(ESS_GOGGLES), QUOTE(BALA_HOLE_2) };
};

class rhs_6b7_1m_ess: EGVAR(wardrobe,base) {

    components[] = { QUOTE(rhs_6b7_1m), QUOTE(ESS_GOGGLES) };
};
class rhs_6b7_1m_ess_bala: EGVAR(wardrobe,base) {
    components[] = { QUOTE(rhs_6b7_1m), QUOTE(ESS_GOGGLES), QUOTE(BALA_HOLE_2) };
};

class rhs_6b7_1m_flora_ns3: EGVAR(wardrobe,base) {
    components[] = { QUOTE(rhs_6b7_1m_flora), QUOTE(ESS_GOGGLES) };
};