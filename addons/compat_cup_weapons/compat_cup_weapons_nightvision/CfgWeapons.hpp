#define NVG_BINO_PRESET \
    ace_nightvision_bluRadius = 0.13; \
    EGVAR(nightvision,border) = QPATHTOEF(nightvision,data\nvg_mask_binos_4096.paa); \
    EGVAR(nightvision,generation) = 3; \
    modelOptics = ""

#define NVG_MONO_PRESET(GEN) \
    EGVAR(nightvision,eyeCups) = 1; \
    EGVAR(nightvision,border) = QPATHTOEF(nightvision,data\nvg_mask_4096.paa); \
    EGVAR(nightvision,bluRadius) = 0.13; \
    EGVAR(nightvision,generation) = GEN; \
    modelOptics = ""

#define NVG_GPNVG_PRESET \
    EGVAR(nightvision,bluRadius) = 0.13; \
    EGVAR(nightvision,border) = QPATHTOEF(nightvision,data\nvg_mask_quad_4096.paa); \
    EGVAR(nightvision,generation) = 4; \
    modelOptics = ""

#define NVG_GREEN_PRESET EGVAR(nightvision,colorPreset)[] = {0, {0.0, 0.0, 0.0, 0.0}, {1.3, 1.2, 0.0, 0.9}, {6, 1, 1, 0}}
#define NVG_WP_PRESET EGVAR(nightvision,colorPreset)[] = {0, {0.0, 0.0, 0.0, 0.0}, {1.1, 0.8, 1.9, 0.9}, {1, 1, 6, 0}}

class CfgWeapons {
    class NVGoggles;
    // Monocular
    class CUP_NVG_PVS7: NVGoggles {
        NVG_MONO_PRESET(3);
        NVG_GREEN_PRESET;
    };
    class CUP_NVG_HMNVS: NVGoggles {
        NVG_MONO_PRESET(3);
        NVG_GREEN_PRESET;
    };

    // Binocular
    class CUP_NVG_PVS14: NVGoggles {
        NVG_MONO_PRESET(3);
        NVG_GREEN_PRESET;
    };
    class CUP_NVG_PVS15_black: NVGoggles {
        NVG_BINO_PRESET;
        NVG_GREEN_PRESET;
    };
    class CUP_NVG_PVS15_green: NVGoggles {
        NVG_BINO_PRESET;
        NVG_GREEN_PRESET;
    };
    class CUP_NVG_PVS15_tan: NVGoggles {
        NVG_BINO_PRESET;
        NVG_GREEN_PRESET;
    };
    class CUP_NVG_PVS15_winter: NVGoggles {
        NVG_BINO_PRESET;
        NVG_GREEN_PRESET;
    };

    // White Phosphor NVGs
    class CUP_NVG_PVS14_WP: CUP_NVG_PVS14 {
        displayName = SUBCSTRING(CUP_NVG_PVS14_WP);
        NVG_WP_PRESET;
    };
    class CUP_NVG_PVS15_black_WP: CUP_NVG_PVS15_black {
        displayName = SUBCSTRING(CUP_NVG_PVS15_black_WP);
        NVG_WP_PRESET;
    };
    class CUP_NVG_PVS15_green_WP: CUP_NVG_PVS15_green {
        displayName = SUBCSTRING(CUP_NVG_PVS15_green_WP);
        NVG_WP_PRESET;
    };
    class CUP_NVG_PVS15_tan_WP: CUP_NVG_PVS15_tan {
        displayName = SUBCSTRING(CUP_NVG_PVS15_tan_WP);
        NVG_WP_PRESET;
    };
    class CUP_NVG_PVS15_winter_WP: CUP_NVG_PVS15_winter {
        displayName = SUBCSTRING(CUP_NVG_PVS15_winter_WP);
        NVG_WP_PRESET;
    };

    // Gen4s
    class CUP_NVG_1PN138: NVGoggles {
        NVG_MONO_PRESET(4);
        NVG_GREEN_PRESET;
    };
    class CUP_NVG_GPNVG_black: NVGoggles {
        NVG_GPNVG_PRESET;
        NVG_GREEN_PRESET;
    };
    class CUP_NVG_GPNVG_tan: NVGoggles {
        NVG_GPNVG_PRESET;
        NVG_GREEN_PRESET;
    };
    class CUP_NVG_GPNVG_green: NVGoggles {
        NVG_GPNVG_PRESET;
        NVG_GREEN_PRESET;
    };
    class CUP_NVG_GPNVG_winter: NVGoggles {
        NVG_GPNVG_PRESET;
        NVG_GREEN_PRESET;
    };

    // White Phosphor NVGs
    class CUP_NVG_GPNVG_black_WP: CUP_NVG_GPNVG_black {
        displayName = SUBCSTRING(CUP_NVG_GPNVG_black_WP);
        NVG_WP_PRESET;
    };
    class CUP_NVG_GPNVG_tan_WP: CUP_NVG_GPNVG_tan {
        displayName = SUBCSTRING(CUP_NVG_GPNVG_tan_WP);
        NVG_WP_PRESET;
    };
    class CUP_NVG_GPNVG_green_WP: CUP_NVG_GPNVG_green {
        displayName = SUBCSTRING(CUP_NVG_GPNVG_green_WP);
        NVG_WP_PRESET;
    };
    class CUP_NVG_GPNVG_winter_WP: CUP_NVG_GPNVG_winter {
        displayName = SUBCSTRING(CUP_NVG_GPNVG_winter_WP);
        NVG_WP_PRESET;
    };
};
