class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class CfgWeapons {
    class Rifle_Base_F;
    class Rifle_Long_Base_F: Rifle_Base_F {};

    // GM6 Lynx
    class GM6_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.45);
        };
    };

    // M200 Intervention
    class LRR_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.50);
        };
    };

    // MX
    class arifle_MX_Base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // KH2002 Sama
    class arifle_katiba_Base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // CTAR-21
    class Tavor_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // F2000
    class mk20_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // Noreen "Bad News" ULR
    class DMR_02_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.61);
        };
    };

    // VS-121
    class DMR_01_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.81);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.81);
        };
    };

    // Mk14 Mod 1 EBR
    class EBR_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.81);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.81);
        };
    };

    // SIG 556
    class DMR_03_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.81);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.81);
        };
    };

    // ASP-1 Kir
    class DMR_04_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.0);
        };
    };

    // Cyrus
    class DMR_05_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.67);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.67);
        };
    };

    // M14
    class DMR_06_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.81);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.81);
        };
    };

    class DMR_06_hunter_base_F: DMR_06_base_F {
        class Single: Single {
            dispersion = MOA_TO_RAD(0.81);
        };
    };

    // MX LSW
    class arifle_MX_SW_F: arifle_MX_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // MXM
    class arifle_MXM_F: arifle_MX_Base_F {
        class Single: Single {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // HK416A5 11"
    class arifle_SPAR_01_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // HK416A5 14.5"
    class arifle_SPAR_02_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // HK417A2 20"
    class arifle_SPAR_03_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.81);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.81);
        };
    };

    // RFB SDAR
    class SDAR_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(3.0);
        };

        class Burst: Mode_Burst {
            dispersion = MOA_TO_RAD(3.0);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(3.0);
        };
    };

    // QBZ-95-1
    class arifle_CTAR_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // QBU-88
    class DMR_07_base_F: Rifle_Long_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.01);
        };
    };

    // QBZ-95-1 LSW
    class arifle_CTARS_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // Type 115
    class arifle_ARX_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: Mode_FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // KH2002C Sama
    class arifle_Katiba_C_F: arifle_katiba_Base_F {
        class Single: Single {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // MXC
    class arifle_MXC_F: arifle_MX_Base_F {
        class Single: Single {
            dispersion = MOA_TO_RAD(0.90);
        };

        class FullAuto: FullAuto {
            dispersion = MOA_TO_RAD(0.90);
        };
    };

    // TAR-21
    class arifle_TRG21_F: Tavor_base_F {
        class Single: Single {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };

    // F2000 Tactical
    class arifle_Mk20C_F: mk20_base_F {
        class Single: Single {
            dispersion = MOA_TO_RAD(1.12);
        };

        class FullAuto: FullAuto {
            dispersion = MOA_TO_RAD(1.12);
        };
    };
};
