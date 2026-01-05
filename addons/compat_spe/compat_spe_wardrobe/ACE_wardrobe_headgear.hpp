// Helmet with normal strap and folded Strap
// Normal, Folded
// FR
BASE_PAIR(H_SPE_FR_Adrian,H_SPE_FR_Adrian_ns);
BASE_PAIR(H_SPE_FR_Adrian_cover,H_SPE_FR_Adrian_cover_ns);
BASE_PAIR(H_SPE_FR_Adrian_net,H_SPE_FR_Adrian_net_ns);

// GER
BASE_PAIR(H_SPE_GER_Helmet_M35_LW,H_SPE_GER_Helmet_M35_LW_ns);

BASE_PAIR(H_SPE_GER_Helmet_M40_lw,H_SPE_GER_Helmet_M40_ns_lw);
BASE_PAIR(H_SPE_GER_Helmet_M40_lw_net,H_SPE_GER_Helmet_M40_ns_lw_net);

BASE_PAIR(H_SPE_GER_Helmet_M40_lw_net_camo,H_SPE_GER_Helmet_M40_ns_lw_net_camo);
BASE_PAIR(H_SPE_GER_Helmet_M40_lw_camo,H_SPE_GER_Helmet_M40_ns_lw_camo);

BASE_PAIR(H_SPE_GER_HelmetCamo3,H_SPE_GER_HelmetCamo3_OS);

BASE_PAIR(H_SPE_GER_Helmet_M40_burlap_band,H_SPE_GER_Helmet_M40_burlap_band_ns);

BASE_PAIR(H_SPE_GER_Helmet_M40_net,H_SPE_GER_Helmet_M40_ns_net);
BASE_PAIR(H_SPE_GER_Helmet_M40Utility,H_SPE_GER_Helmet_M40Utility_OS);


BASE_PAIR(H_SPE_GER_Helmet_M40_wire,H_SPE_GER_Helmet_M40_ns_wire);

BASE_PAIR(H_SPE_GER_Helmet_net,H_SPE_GER_Helmet_net_ns);

BASE_PAIR(H_SPE_GER_Helmet_os,H_SPE_GER_Helmet_ns_wire);


// Headphones Up, Headphones Down
BASE_PAIR(H_SPE_GER_SPGPrivateCap,H_SPE_GER_SPGPrivateCap2);

BASE_PAIR(H_SPE_GER_TankPrivateCap,H_SPE_GER_TankPrivateCap2);
BASE_PAIR(H_SPE_GER_TankOffzCap,H_SPE_GER_TankOffzCap2);

BASE_PAIR(H_SPE_GER_TankOfficerCap,H_SPE_GER_TankOfficerCap2);


// Hat, Tilted
// Normal, Tilted

BASE_PAIR(H_SPE_GER_M40_LW,H_SPE_GER_M40_LW_2);
BASE_PAIR(H_SPE_GER_M40_LW_Offz,H_SPE_GER_M40_LW_Offz_2);

BASE_PAIR(H_SPE_GER_M38,H_SPE_GER_M38_2);
BASE_PAIR(H_SPE_GER_M38_Offz,H_SPE_GER_M38_Offz_2);

BASE_PAIR(H_SPE_GER_M38_art,H_SPE_GER_M38_art_2);
BASE_PAIR(H_SPE_GER_M38_Art_Offz,H_SPE_GER_M38_Art_Offz_2);

BASE_PAIR(H_SPE_GER_M38_inf,H_SPE_GER_M38_inf_2);
BASE_PAIR(H_SPE_GER_M38_inf_Offz,H_SPE_GER_M38_inf_Offz_2);

BASE_PAIR(H_SPE_GER_M38_Pz,H_SPE_GER_M38_Pz_2);
BASE_PAIR(H_SPE_GER_M38_Pz_Offz,H_SPE_GER_M38_Pz_Offz_2);

BASE_PAIR(H_SPE_GER_M38_pzgren,H_SPE_GER_M38_pzgren_2);
BASE_PAIR(H_SPE_GER_M38_PzGren_Offz,H_SPE_GER_M38_PzGren_Offz_2);

BASE_PAIR(H_SPE_GER_ST_M40_cap,H_SPE_GER_ST_M40_cap_2);
BASE_PAIR(H_SPE_GER_ST_M40_cap_Offz,H_SPE_GER_ST_M40_cap_Offz_2);

BASE_PAIR(H_SPE_GER_ST_M40_Pz_cap,H_SPE_GER_ST_M40_Pz_cap_2);
BASE_PAIR(H_SPE_GER_ST_M40_Pz_cap_Offz,H_SPE_GER_ST_M40_Pz_cap_Offz_2);


HELMET_2VARIANTS_GOGGLES(H_SPE_GER_Helmet_M35,H_SPE_GER_Helmet_M35_ns,H_SPE_GER_Helmet_M35_Glasses,H_SPE_GER_Helmet_M35_Glasses_ns,G_SPE_Dust_Goggles);
HELMET_2VARIANTS_GOGGLES(H_SPE_GER_Helmet_M40,H_SPE_GER_Helmet_M40_ns,H_SPE_GER_Helmet_M40_Glasses,H_SPE_GER_Helmet_M40_Glasses_ns,G_SPE_Dust_Goggles);


// Helmet With 2 Variants but only one has Goggles
class H_SPE_GER_Helmet: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_GER_Helmet_ns {};
        class H_SPE_GER_Helmet_Glasses {};
    };
};
class H_SPE_GER_Helmet_ns: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_GER_Helmet {};
        class H_SPE_GER_Helmet_Glasses {};
    };
};
class H_SPE_GER_Helmet_Glasses: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_GER_Helmet {};
        class H_SPE_GER_Helmet_ns {};
    };
    components[] = { QUOTE(G_SPE_Dust_Goggles) };
};

BASE_PAIR(H_SPE_GER_HelmetUtility,H_SPE_GER_HelmetUtility_OS);

// US
HELMET_GOGGLES(H_SPE_US_AB_Helmet_Net,H_SPE_US_AB_Helmet_polar_net,G_SPE_Polar_Goggles);

BASE_TRIPLET(H_SPE_US_AB_Helmet_Net_up,H_SPE_US_AB_Helmet_Net_ns,H_SPE_US_AB_Helmet_Net_os);
BASE_TRIPLET(H_SPE_US_AB_Helmet_Scrim_up,H_SPE_US_AB_Helmet_Scrim_ns,H_SPE_US_AB_Helmet_Scrim_os);

BASE_PAIR(H_SPE_US_AB_Helmet_501,H_SPE_US_AB_Helmet_501_ns);
BASE_TRIPLET(H_SPE_US_AB_Helmet_501_Net_up,H_SPE_US_AB_Helmet_501_Net_ns,H_SPE_US_AB_Helmet_501_Net_os);
BASE_TRIPLET(H_SPE_US_AB_Helmet_501_Scrim_os,H_SPE_US_AB_Helmet_501_Scrim_ns,H_SPE_US_AB_Helmet_501_Scrim_up);

BASE_PAIR(H_SPE_US_AB_Helmet_502,H_SPE_US_AB_Helmet_502_ns);
BASE_TRIPLET(H_SPE_US_AB_Helmet_502_Net_up,H_SPE_US_AB_Helmet_502_Net_ns,H_SPE_US_AB_Helmet_502_Net_os);
BASE_TRIPLET(H_SPE_US_AB_Helmet_502_Scrim_os,H_SPE_US_AB_Helmet_502_Scrim_ns,H_SPE_US_AB_Helmet_502_Scrim_up);

BASE_PAIR(H_SPE_US_Helmet_Pilot_Glasses_Down,H_SPE_US_Helmet_Pilot_Glasses_Up);
BASE_PAIR(H_SPE_US_Helmet_Pilot_Respirator_Glasses_Down,H_SPE_US_Helmet_Pilot_Respirator_Glasses_Up);
BASE_PAIR(H_SPE_US_Helmet_Pilot_SWDG_Respirator,H_SPE_US_Helmet_Pilot_SWDG_low_Respirator);
BASE_PAIR(H_SPE_US_Helmet_Pilot,H_SPE_US_Helmet_Pilot_Op);

BASE_PAIR(H_SPE_US_Helmet_H15_SWDG,H_SPE_US_Helmet_H15_SWDG_low);
BASE_PAIR(H_SPE_US_Helmet_H15,H_SPE_US_Helmet_H15_Op);
BASE_PAIR(H_SPE_US_Helmet_H15_SWDG_O2,H_SPE_US_Helmet_H15_SWDG_low_O2);
BASE_PAIR(H_SPE_US_Helmet_H15_B7_O2,H_SPE_US_Helmet_H15_B7_low_O2);

BASE_PAIR(H_SPE_US_Helmet_29ID_Net_ns,H_SPE_US_Helmet_29ID_Net_os);
BASE_PAIR(H_SPE_US_Helmet_29ID_Scrim_ns,H_SPE_US_Helmet_29ID_Scrim_os);
BASE_TRIPLET(H_SPE_US_Helmet_cover,H_SPE_US_Helmet_cover_ns,H_SPE_US_Helmet_cover_os);
BASE_PAIR(H_SPE_US_Helmet_Med,H_SPE_US_Helmet_Med_os);
BASE_TRIPLET(H_SPE_US_MP_Helmet_White,H_SPE_US_MP_Helmet_White_ns,H_SPE_US_MP_Helmet_White_os);
BASE_PAIR(H_SPE_US_Helmet_band_net_up,H_SPE_US_Helmet_band_net_os);
BASE_TRIPLET(H_SPE_US_Helmet_Net_ns,H_SPE_US_Helmet_Net_up,H_SPE_US_Helmet_Net_os);
BASE_PAIR(H_SPE_US_Helmet_Scrim,H_SPE_US_Helmet_Scrim_up);
HELMET_SCRIM(H_SPE_US_Helmet_Tank_M1_NS,H_SPE_US_Helmet_Tank_M1_Scrim);


class H_SPE_US_HBT_cap: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_HBT_cap_up {};
        class H_SPE_US_HBT_cap_rear {};
        class H_SPE_US_HBT_cap_polar {};
    };
};
class H_SPE_US_HBT_cap_up: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_HBT_cap {};
        class H_SPE_US_HBT_cap_rear {};
    };
};
class H_SPE_US_HBT_cap_rear: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_HBT_cap {};
        class H_SPE_US_HBT_cap_up {};
    };
};

class H_SPE_US_HBT_cap_polar: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_HBT_cap {};
    };
    components[] = { QUOTE(G_SPE_Polar_Goggles) };
};


class H_SPE_US_Helmet_polar_ns: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_Helmet_ns {};
    };
    components[] = { QUOTE(G_SPE_Polar_Goggles) };
};
class H_SPE_US_Helmet_ns: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_Helmet_polar_ns {};
    };
};


class H_SPE_US_Helmet_Tank_NG: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_Helmet_Tank_polar_low {};
        class H_SPE_US_Helmet_Tank_polar {};
        class H_SPE_US_Helmet_Tank_Nun {};
    };
};
class H_SPE_US_Helmet_Tank_Nun: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_Helmet_Tank_NG {};
    };
};

class H_SPE_US_Helmet_Tank_polar_low: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_Helmet_Tank_NG {};
        class H_SPE_US_Helmet_Tank_polar {};
    };
    components[] = { QUOTE(G_SPE_Polar_Goggles) };
};
class H_SPE_US_Helmet_Tank_polar: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_Helmet_Tank_NG {};
        class H_SPE_US_Helmet_Tank_polar_low {};
    };
    components[] = { QUOTE(G_SPE_Polar_Goggles) };
};


class H_SPE_US_Helmet_Tank_polar_tapes: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_Helmet_Tank_tapes {};
    };
    components[] = { QUOTE(G_SPE_Polar_Goggles) };
};
class H_SPE_US_Helmet_Tank_tapes: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_Helmet_Tank_polar_tapes {};
    };
};


class H_SPE_US_jeep_cap: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_jeep_cap_rear {};
        class H_SPE_US_jeep_cap_polar {};
    };
};
class H_SPE_US_jeep_cap_rear: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_jeep_cap {};
    };
};

class H_SPE_US_jeep_cap_polar: ACEWARDROBE(base) {
    class modifiableTo {
        class H_SPE_US_jeep_cap {};
    };
    components[] = { QUOTE(G_SPE_Polar_Goggles) };
};
