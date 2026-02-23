// Helmet with normal strap and folded Strap
// Normal, Folded
// CW
BASE_PAIR(H_SPEX_CW_HSAT_mk1,H_SPEX_CW_HSAT_mk1_op);
BASE_PAIR(H_SPEX_CW_HSAT_mk2,H_SPEX_CW_HSAT_mk2_op);
BASE_PAIR(H_SPEX_CW_HSAT_mk1_net,H_SPEX_CW_HSAT_mk1_net_op);

BASE_PAIR(H_SPEX_CW_Helmet_mk2,H_SPEX_CW_Helmet_mk2_op_tilt);
BASE_PAIR(H_SPEX_CW_Helmet_mk2_op,H_SPEX_CW_Helmet_mk2_tilt);
BASE_PAIR(H_SPEX_CW_Helmet_mk2_burlap,H_SPEX_CW_Helmet_mk2_burlap_tilt);
BASE_PAIR(H_SPEX_CW_Helmet_mk2_burlap_op,H_SPEX_CW_Helmet_mk2_burlap_op_tilt);

BASE_PAIR(H_SPEX_CW_Helmet_mk2_desert,H_SPEX_CW_Helmet_mk2_desert_op_tilt);
BASE_PAIR(H_SPEX_CW_Helmet_mk2_desert_op,H_SPEX_CW_Helmet_mk2_desert_tilt);

BASE_PAIR(H_SPEX_CW_Helmet_mk2_hessian,H_SPEX_CW_Helmet_mk2_hessian_tilt);
BASE_PAIR(H_SPEX_CW_Helmet_mk2_hessian_op,H_SPEX_CW_Helmet_mk2_hessian_op_tilt);

BASE_PAIR(H_SPEX_CW_Helmet_mk3,H_SPEX_CW_Helmet_mk3_op);

class H_SPEX_CW_hat_felt: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPEX_CW_hat_felt_cl {};
        class H_SPEX_CW_hat_felt_slouch {};
    };
};
class H_SPEX_CW_hat_felt_cl: ACEWARDROBE(base) {\
    class modifiableTo {\
        class H_SPEX_CW_hat_felt {};
        class H_SPEX_CW_hat_felt_slouch_cl {};
    };
};
class H_SPEX_CW_hat_felt_slouch: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPEX_CW_hat_felt {};
        class H_SPEX_CW_hat_felt_slouch_cl {};
    };
};
class H_SPEX_CW_hat_felt_slouch_cl: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPEX_CW_hat_felt_slouch {};
        class H_SPEX_CW_hat_felt_cl {};
    };
};

// GER
BASE_PAIR(H_SPEX_LW_DAK_SIDECAP,H_SPEX_LW_DAK_SIDECAP_2);
BASE_PAIR(H_SPEX_LW_DAK_SIDECAP_OFFZ,H_SPEX_LW_DAK_SIDECAP_2_OFFZ);

class H_SPEX_LW_DAK_Helmet_M35_3: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPEX_LW_DAK_Helmet_M35_Glasses_ns {};
    };
};
class H_SPEX_LW_DAK_Helmet_M35_Glasses_ns: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPEX_LW_DAK_Helmet_M35_3 {};
    };
    components[] = { QUOTE(G_SPE_Dust_Goggles) };
};

class H_SPEX_LW_DAK_Helmet_M35_3_ns: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPEX_LW_DAK_Helmet_M35_Glasses {};
    };
};
class H_SPEX_LW_DAK_Helmet_M35_Glasses: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPEX_LW_DAK_Helmet_M35_3_ns {};
    };
    components[] = { QUOTE(G_SPE_Dust_Goggles) };
};

BASE_PAIR(H_SPEX_GER_Helmet_chute_band,H_SPEX_GER_Helmet_chute_band_ns);
BASE_PAIR(H_SPEX_GER_Helmet_chute,H_SPEX_GER_Helmet_chute_OS);

// PL
#define HELMET_4_VARIANTS(baseVariant,open,openTilted,tilted)\
class baseVariant: ACEWARDROBE(base) {\
    class modifiableTo {\
        class open {};\
        class tilted {};\
    };\
};\
class open: ACEWARDROBE(base) {\
    class modifiableTo {\
        class baseVariant {};\
        class openTilted {};\
    };\
};\
class openTilted: ACEWARDROBE(base) {\
    class modifiableTo {\
        class open {};\
    };\
};\
class tilted: ACEWARDROBE(base) {\
    class modifiableTo {\
        class baseVariant {};\
    };\
}

HELMET_4_VARIANTS(H_SPEX_PL_Helmet_mk2_2A,H_SPEX_PL_Helmet_mk2_2A_op,H_SPEX_PL_Helmet_mk2_2A_op_tilt,H_SPEX_PL_Helmet_mk2_2A_tilt);

BASE_PAIR(H_SPEX_PL_Helmet_mk2_2A_net,H_SPEX_PL_Helmet_mk2_2A_net_tilt);
BASE_PAIR(H_SPEX_PL_Helmet_mk2_2A_net_op,H_SPEX_PL_Helmet_mk2_2A_net_op_tilt);

BASE_PAIR(H_SPEX_PL_HSAT_mk1,H_SPEX_PL_HSAT_mk1_op);
BASE_PAIR(H_SPEX_PL_HSAT_mk2,H_SPEX_PL_HSAT_mk2_op);
BASE_PAIR(H_SPEX_PL_HSAT_mk1_net,H_SPEX_PL_HSAT_mk1_net_op);

HELMET_4_VARIANTS(H_SPEX_PL_Helmet_mk2,H_SPEX_PL_Helmet_mk2_op,H_SPEX_PL_Helmet_mk2_op_tilt,H_SPEX_PL_Helmet_mk2_tilt);
HELMET_4_VARIANTS(H_SPEX_PL_Helmet_mk2_desert,H_SPEX_PL_Helmet_mk2_desert_op,H_SPEX_PL_Helmet_mk2_desert_op_tilt,H_SPEX_PL_Helmet_mk2_desert_tilt);

BASE_PAIR(H_SPEX_PL_Helmet_mk2_desert_net,H_SPEX_PL_Helmet_mk2_desert_net_tilt);
BASE_PAIR(H_SPEX_PL_Helmet_mk2_desert_net_op,H_SPEX_PL_Helmet_mk2_desert_net_op_tilt);

BASE_PAIR(H_SPEX_PL_Helmet_mk2_net,H_SPEX_PL_Helmet_mk2_net_tilt);
BASE_PAIR(H_SPEX_PL_Helmet_mk2_net_op,H_SPEX_PL_Helmet_mk2_net_op_tilt);

HELMET_4_VARIANTS(H_SPEX_PL_Helmet_mk2_SBSK,H_SPEX_PL_Helmet_mk2_SBSK_op,H_SPEX_PL_Helmet_mk2_SBSK_op_tilt,H_SPEX_PL_Helmet_mk2_SBSK_tilt);

BASE_PAIR(H_SPEX_PL_Helmet_mk2_SBSK_net,H_SPEX_PL_Helmet_mk2_SBSK_net_tilt);
BASE_PAIR(H_SPEX_PL_Helmet_mk2_SBSK_net_op,H_SPEX_PL_Helmet_mk2_SBSK_net_op_tilt);

// US
BASE_PAIR(H_SPE_US_AB_Helmet_327,H_SPE_US_AB_Helmet_327_ns);

BASE_TRIPLET(H_SPE_US_AB_Helmet_327_Net_ns,H_SPE_US_AB_Helmet_327_Net_up,H_SPE_US_AB_Helmet_327_Net_os);
BASE_TRIPLET(H_SPE_US_AB_Helmet_327_Scrim_ns,H_SPE_US_AB_Helmet_327_Scrim_up,H_SPE_US_AB_Helmet_327_Scrim_os);

BASE_PAIR(H_SPE_US_AB_Helmet_506,H_SPE_US_AB_Helmet_506_ns);

BASE_TRIPLET(H_SPE_US_AB_Helmet_506_Net_ns,H_SPE_US_AB_Helmet_506_Net_up,H_SPE_US_AB_Helmet_506_Net_os);
BASE_TRIPLET(H_SPE_US_AB_Helmet_506_Scrim_ns,H_SPE_US_AB_Helmet_506_Scrim_up,H_SPE_US_AB_Helmet_506_Scrim_os);
