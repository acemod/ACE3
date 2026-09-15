HELMET_SCRIM(cwr3_b_uk_headgear_m76_dpm_net,cwr3_b_uk_headgear_m76_dpm_camo);
HELMET_SCRIM(cwr3_b_uk_headgear_m76_olive_net,cwr3_b_uk_headgear_m76_camo);
HELMET_SCRIM(cwr3_b_uk_headgear_parahelmet_olive_net,cwr3_b_uk_headgear_parahelmet_camo);
HELMET_SCRIM(cwr3_b_uk_headgear_mk5_helmet_dpm_net,cwr3_b_uk_headgear_mk5_helmet_scrim_dpm);

//Helmet has no "without scrim" variant
class cwr3_b_uk_headgear_mk5_helmet_scrim_burlap: ace_wardrobe_base {
    class modifiableTo {
        class cwr3_b_uk_headgear_mk5_helmet_scrim_burlap_camo {
            displayName = ACEWARDROBE_CSTRING(foliageAdd);
        };
    };
};
class cwr3_b_uk_headgear_mk5_helmet_scrim_burlap_camo: ace_wardrobe_base {
    class modifiableTo {
        class cwr3_b_uk_headgear_mk5_helmet_scrim_burlap {
            displayName = ACEWARDROBE_CSTRING(foliageRemove);
        };
    };
};


class cwr3_b_uk_headgear_mk5_helmet_net: ace_wardrobe_base {
    class modifiableTo {
        class cwr3_b_uk_headgear_mk5_helmet_scrim {
            displayName = ACEWARDROBE_CSTRING(foliageAdd);
        };
    };
};
class cwr3_b_uk_headgear_mk5_helmet_scrim: ace_wardrobe_base {
    class modifiableTo {
        class cwr3_b_uk_headgear_mk5_helmet_scrim_camo {
            displayName = ACEWARDROBE_CSTRING(foliageAdd);
        };
        class cwr3_b_uk_headgear_mk5_helmet_net {
            displayName = ACEWARDROBE_CSTRING(foliageRemove);
        };
    };
};
class cwr3_b_uk_headgear_mk5_helmet_scrim_camo: ace_wardrobe_base {
    class modifiableTo {
        class cwr3_b_uk_headgear_mk5_helmet_scrim {
            displayName = ACEWARDROBE_CSTRING(foliageRemove);
        };
    };
};
