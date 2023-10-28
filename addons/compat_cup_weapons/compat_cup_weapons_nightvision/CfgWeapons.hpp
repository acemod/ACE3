#define NVG_MACRO_GREEN_GEN3 \
	ace_nightvision_bluRadius = 0.13; \
	ace_nightvision_border = QPATHTOEF(nightvision,data\nvg_mask_4096.paa); \
	ace_nightvision_colorPreset[] = {0, {0.0, 0.0, 0.0, 0.0}, {1.3, 1.2, 0.0, 0.9}, {6, 1, 1, 0.0}}; \
	ace_nightvision_generation = 3; \
	modelOptics = ""

#define NVG_MACRO_GREEN_GPNVG \
	ace_nightvision_bluRadius = 0.13; \
	ace_nightvision_border = "z\ace\addons\nightvision\data\nvg_mask_quad_4096.paa"; \
	ace_nightvision_colorPreset[] = {0, {0.0, 0.0, 0.0, 0.0}, {1.3, 1.2, 0.0, 0.9}, {6, 1, 1, 0.0}}; \
	ace_nightvision_generation = 4; \
	modelOptics = ""

class CfgWeapons {
	class NVGoggles;
	class CUP_NVG_PVS7: NVGoggles {
		modelOptics = "";
		ace_nightvision_border = QPATHTOEF(nightvision,data\nvg_mask_4096.paa);
		ace_nightvision_bluRadius = 0;
		ace_nightvision_eyeCups = 0;
		ace_nightvision_generation = 3;
		ace_nightvision_colorPreset[] = {0, {0.0, 0.0, 0.0, 0.0}, {1.3, 1.2, 0.0, 0.9}, {6, 1, 1, 0.0}};
	};
	class CUP_NVG_HMNVS: NVGoggles {
		NVG_MACRO_GREEN_GEN3;
	};
	class CUP_NVG_PVS14: NVGoggles {
		NVG_MACRO_GREEN_GEN3;
	};
	class CUP_NVG_PVS15_black: NVGoggles {
		NVG_MACRO_GREEN_GEN3;
	};
	class CUP_NVG_PVS15_tan: NVGoggles {
		NVG_MACRO_GREEN_GEN3;
	};
	class CUP_NVG_PVS15_green: NVGoggles {
		NVG_MACRO_GREEN_GEN3;
	};
	class CUP_NVG_PVS15_winter: NVGoggles {
		NVG_MACRO_GREEN_GEN3;
	};

	// Gen4s
	class CUP_NVG_1PN138: NVGoggles {
		ace_nightvision_bluRadius = 0.13;
		ace_nightvision_border = QPATHTOEF(nightvision,data\nvg_mask_4096.paa);
		ace_nightvision_colorPreset[] = {0, {0.0, 0.0, 0.0, 0.0}, {1.3, 1.2, 0.0, 0.9}, {6, 1, 1, 0.0}};
		ace_nightvision_generation = 4;
		modelOptics = "";
	};
	class CUP_NVG_GPNVG_black: NVGoggles {
		NVG_MACRO_GREEN_GPNVG;
	};
	class CUP_NVG_GPNVG_tan: NVGoggles {
        NVG_MACRO_GREEN_GPNVG;
	};
	class CUP_NVG_GPNVG_green: NVGoggles {
        NVG_MACRO_GREEN_GPNVG;
	};
	class CUP_NVG_GPNVG_winter: NVGoggles {
        NVG_MACRO_GREEN_GPNVG;
	};
};
