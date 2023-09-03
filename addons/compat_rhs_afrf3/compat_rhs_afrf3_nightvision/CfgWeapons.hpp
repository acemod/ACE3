class CfgWeapons {
    class NVGoggles;
    class rhs_1PN138: NVGoggles { // Monocular
        modelOptics = "";
        EGVAR(nightvision,border) = QPATHTOEF(nightvision,data\nvg_mask_4096.paa);
        EGVAR(nightvision,bluRadius) = 0.13;
    };
};
