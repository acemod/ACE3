class CfgWeapons {
    class NVGoggles;
    class rhsusf_ANPVS_14: NVGoggles { // Monocular
        modelOptics = "";
        EGVAR(nightvision,border) = QPATHTOEF(nightvision,data\nvg_mask_4096.paa);
        EGVAR(nightvision,bluRadius) = 0.13;
    };
    class rhsusf_ANPVS_15: rhsusf_ANPVS_14 { // Binocular (same as base)
        modelOptics = "";
        EGVAR(nightvision,border) = QPATHTOEF(nightvision,data\nvg_mask_binos_4096.paa);
        EGVAR(nightvision,bluRadius) = 0.15;
    };
};
