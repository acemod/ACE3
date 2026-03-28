HELMET_SCRIM(cwr3_b_uk_headgear_m76_dpm_net,cwr3_b_uk_headgear_m76_dpm_camo);
HELMET_SCRIM(cwr3_b_uk_headgear_m76_olive_net,cwr3_b_uk_headgear_m76_camo);
HELMET_SCRIM(cwr3_b_uk_headgear_parahelmet_olive_net,cwr3_b_uk_headgear_parahelmet_camo);
HELMET_SCRIM(cwr3_b_uk_headgear_mk5_helmet_dpm_net,cwr3_b_uk_headgear_mk5_helmet_scrim_dpm);

//Helmet has no "without scrim" variant
class cwr3_b_uk_headgear_mk5_helmet_scrim_burlap: ace_wardrobe_base {
    class modifiableTo {
        class cwr3_b_uk_headgear_mk5_helmet_scrim_burlap_camo {
            displayName = ECSTRING(main,add_foliage);
        };
    };
};
class cwr3_b_uk_headgear_mk5_helmet_scrim_burlap_camo: ace_wardrobe_base {
    class modifiableTo {
        class cwr3_b_uk_headgear_mk5_helmet_scrim_burlap {
            displayName = ECSTRING(main,remove_foliage);
        };
    };
};


class cwr3_b_uk_headgear_mk5_helmet_net: ace_wardrobe_base {
    class modifiableTo {
        class cwr3_b_uk_headgear_mk5_helmet_scrim {
            displayName = ECSTRING(main,add_scrim);
        };
    };
};
class cwr3_b_uk_headgear_mk5_helmet_scrim: ace_wardrobe_base {
    class modifiableTo {
        class cwr3_b_uk_headgear_mk5_helmet_scrim_camo {
            displayName = ECSTRING(main,add_foliage);
        };
        class cwr3_b_uk_headgear_mk5_helmet_net {
            displayName = ECSTRING(main,remove_scrim);
        };
    };
};
class cwr3_b_uk_headgear_mk5_helmet_scrim_camo: ace_wardrobe_base {
    class modifiableTo {
        class cwr3_b_uk_headgear_mk5_helmet_scrim {
            displayName = ECSTRING(main,remove_foliage);
        };
    };
};
