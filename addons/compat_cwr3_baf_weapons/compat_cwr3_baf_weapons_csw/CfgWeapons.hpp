class CfgWeapons {
    class CUP_lmg_L7A2;
    class CUP_lmg_L7A2_Flat: CUP_lmg_L7A2 {
        class ace_csw {
            type = "weapon";
            deployTime = 4;
            pickupTime = 4;
            class assembleTo {
                ace_csw_m3TripodLow = "cwr3_b_uk_l7a2_low";
            };
        };
    };

    class cwr3_proxy_l7a2: CUP_lmg_L7A2_Flat {
        scope = 1;
        magazineReloadTime = 0.5;
    };
};
