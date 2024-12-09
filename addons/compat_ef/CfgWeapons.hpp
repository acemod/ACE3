class CfgWeapons {
    // -- ace_nightvision --
    class NVGoggles;
    class EF_LPNVG: NVGoggles { // all 4 inherit from this
        EGVAR(nightvision,generation) = 4;
        EGVAR(nightvision,colorPreset)[] = {0,{0,0,0,0},{0.7,0.65,0.4,0},{0.199,1.3,0.114,1}};
        EGVAR(nightvision,border) = QPATHTOEF(nightvision,data\nvg_mask_binos_4096.paa);
    };

    // -- ace_hearing --
    class HelmetBase;
    class EF_H_Protecta: HelmetBase {
        HEARING_PROTECTION_PELTOR;
    };
    class EF_H_MCH; // this does not have peltor
    class EF_H_MCH_Basic: EF_H_MCH {
        HEARING_PROTECTION_PELTOR;
    };
    class EF_H_MCH_BasicNet_Des: EF_H_MCH {
        HEARING_PROTECTION_PELTOR;
    };
    class EF_H_MCH_Full: EF_H_MCH {
        HEARING_PROTECTION_PELTOR;
    };
    class EF_H_MCH_FullCamo_Des: EF_H_MCH {
        HEARING_PROTECTION_PELTOR;
    };

    // -- ace_overpressure --
    class autocannon_30mm;
    class EF_autocannon_50mm_AAV9: autocannon_30mm {
        EGVAR(overpressure,priority) = 1;
        EGVAR(overpressure,angle) = 90;
        EGVAR(overpressure,range) = 5;
        EGVAR(overpressure,damage) = 0.3;
    };
};
