class Mode_SemiAuto;
class Mode_FullAuto;

class CfgWeapons {
    class DMR_01_base_F;
    class EBR_base_F;
    class GM6_base_F;
    class LMG_RCWS;
    class LRR_base_F;
    class MGun;
    class MGunCore;
    class pdw2000_base_F;
    class Pistol_Base_F;
    class Rifle_Base_F;
    class Rifle_Long_Base_F;
    class SMG_01_Base;
    class SMG_02_base_F;
    class DMR_02_base_F;
    class DMR_03_base_F;
    class DMR_04_base_F;
    class DMR_05_base_F;
    class DMR_06_base_F;
    class MMG_01_base_F;
    class MMG_02_base_F;
    
    /* MX */
    class arifle_MX_Base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.000800; // radians. Equal to 2.75 MOA.
            // Based on widely cited 2 MOA figure for new 5.56 ACR.
        };

        class FullAuto: Mode_FullAuto {
            dispersion = 0.00147; // radians. Equal to 5.1 MOA.
        };
    };
    class arifle_MX_SW_F: arifle_MX_Base_F {
        ACE_barrelTwist=9;
        ACE_barrelLength=16.0;
        class Single: Mode_SemiAuto {
            dispersion = 0.000800; // radians. Equal to 2.75 MOA.
            // Based on widely cited 2 MOA figure for new 5.56 ACR.
        };

        class manual: FullAuto {
            dispersion = 0.00147; // radians. Equal to 5.1 MOA.
        };
    };
    class arifle_MXM_F: arifle_MX_Base_F {
        ACE_barrelTwist=9;
        ACE_barrelLength=18;
        class Single: Single {
            dispersion = 0.00029; // radians. Equal to 1 MOA.
            // 6.5mm is easily capable of this in a half-tuned rifle.
        };

        class FullAuto: FullAuto {
            dispersion = 0.000800; // radians. Equal to 2.75 MOA.
        };
    };


    /* Katiba */
    class arifle_katiba_Base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.000800; // radians. Equal to 2.75 MOA.
            // Based on widely cited 2 MOA figure for new 5.56 ACR?
            // Use your imagination for fictional weapons!
        };

        class FullAuto: Mode_FullAuto {
            dispersion = 0.00147; // radians. Equal to 5.1 MOA.
        };
    };


    /* Other */
    class LMG_Mk200_F: Rifle_Long_Base_F {
        ACE_barrelTwist=7;
        ACE_barrelLength=12.5;
        class manual: Mode_FullAuto {
            dispersion = 0.00175; // radians. Equal to 6 MOA.
        };

        class Single: manual {
            dispersion = 0.00175; // radians. Equal to 6 MOA.
        };
    };
    class LMG_Zafir_F: Rifle_Long_Base_F {
        ACE_barrelTwist=12;
        ACE_barrelLength=18.1;
        class FullAuto: Mode_FullAuto {
            dispersion = 0.00175; // radians. Equal to 6 MOA.
        };

        class Single: Mode_SemiAuto {
            dispersion = 0.00175; // radians. Equal to 6 MOA.
        };
    };


    /* Assault Rifles */
    class Tavor_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.000727; // radians. Equal to 2.5 MOA, about the limit of mass-produced M855.
        };

        class FullAuto: Mode_FullAuto {
            dispersion = 0.00147; // radians. Equal to 5.1 MOA.
        };
    };
    class mk20_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.0008727; // radians. Equal to 3 MOA, about the limit of mass-produced M855 plus
            // some extra for these worn out Greek Army service rifles.
        };

        class FullAuto: Mode_FullAuto {
            dispersion = 0.00147; // radians. Equal to 5.1 MOA.
        };
    };


    /* SMGs */
    class SDAR_base_F: Rifle_Base_F {
        class Single: Mode_SemiAuto {
            dispersion = 0.0008727; // radians. Equal to 3 MOA, about the limit of mass-produced M855 plus
            // some extra because Kel-Tec.
        };

        class FullAuto: Mode_FullAuto {
            dispersion = 0.00147; // radians. Equal to 5.1 MOA.
        };
    };
    
    class hgun_P07_F: Pistol_Base_F {
        ACE_barrelTwist=10;
        ACE_barrelLength=4;
    };
    class hgun_Rook40_F: Pistol_Base_F {
        ACE_barrelTwist=10;
        ACE_barrelLength=4.4;
    };
    class hgun_Pistol_heavy_01_F: Pistol_Base_F {
        ACE_barrelTwist=16;
        ACE_barrelLength=4.5;
    };
    class hgun_Pistol_heavy_02_F: Pistol_Base_F {
        ACE_barrelTwist=16;
        ACE_barrelLength=3;
    };
    class hgun_ACPC2_F: Pistol_Base_F {
        ACE_barrelTwist=16;
        ACE_barrelLength=5;
    };
    class hgun_PDW2000_F: pdw2000_base_F {
        ACE_barrelTwist=9;
        ACE_barrelLength=7;
    };
    class arifle_Katiba_F: arifle_katiba_Base_F {
        ACE_barrelTwist=8;
        ACE_barrelLength=28.7;
    };
    class arifle_Katiba_C_F: arifle_katiba_Base_F {
        ACE_barrelTwist=8;
        ACE_barrelLength=26.8;
    };
    class arifle_Katiba_GL_F: arifle_katiba_Base_F {
        ACE_barrelTwist=8;
        ACE_barrelLength=28.7;
    };
    class arifle_MX_F: arifle_MX_Base_F {
        ACE_barrelTwist=9;
        ACE_barrelLength=14.5;
    };
    class arifle_MX_GL_F: arifle_MX_Base_F {
        ACE_barrelTwist=9;
        ACE_barrelLength=14.5;
    };
    /*
    class arifle_MX_SW_F: arifle_MX_Base_F {
        ACE_barrelTwist=9;
        ACE_barrelLength=16.0;
    };
    */
    class arifle_MXC_F: arifle_MX_Base_F {
        ACE_barrelTwist=8;
        ACE_barrelLength=10.5;
    };
    /*
    class arifle_MXM_F: arifle_MX_Base_F {
        ACE_barrelTwist=9;
        ACE_barrelLength=18;
    };
    */
    class arifle_SDAR_F: SDAR_base_F {
        ACE_barrelTwist=11.25;
        ACE_barrelLength=18;
    };
    class SMG_02_F: SMG_02_base_F {
        ACE_barrelTwist=10;
        ACE_barrelLength=7.7;
    };
    class arifle_TRG20_F: Tavor_base_F {
        ACE_barrelTwist=7;
        ACE_barrelLength=15;
    };
    class arifle_TRG21_F: Tavor_base_F {
        ACE_barrelTwist=7;
        ACE_barrelLength=18.1;
    };
    /*
    class LMG_Zafir_F: Rifle_Long_Base_F {
        ACE_barrelTwist=12;
        ACE_barrelLength=18.1;
    };
    */
    class arifle_Mk20_F: mk20_base_F {
        ACE_barrelTwist=7;
        ACE_barrelLength=17.4;
    };
    class arifle_Mk20C_F: mk20_base_F {
        ACE_barrelTwist=7;
        ACE_barrelLength=16;
    };
    class arifle_Mk20_GL_F: mk20_base_F {
        ACE_barrelTwist=7;
        ACE_barrelLength=16;
    };
    class SMG_01_F: SMG_01_Base {
        ACE_barrelTwist=16;
        ACE_barrelLength=5.5;
    };
    class srifle_DMR_01_F: DMR_01_base_F {
        ACE_barrelTwist=9.5;
        ACE_barrelLength=24;
    };
    class srifle_EBR_F: EBR_base_F {
        ACE_barrelTwist=12;
        ACE_barrelLength=24;
    };
    /*
    class LMG_Mk200_F: Rifle_Long_Base_F {
        ACE_barrelTwist=7;
        ACE_barrelLength=12.5;
    };
    */
    class srifle_LRR_F: LRR_base_F {
        ACE_barrelTwist=13;
        ACE_barrelLength=29;
    };
    class srifle_GM6_F: GM6_base_F {
        ACE_barrelTwist=15;
        ACE_barrelLength=43.3;
    };
    class srifle_DMR_02_F: DMR_02_base_F {
		ACE_barrelTwist=10;
		ACE_barrelLength=26;
    };
    class srifle_DMR_03_F: DMR_03_base_F {
		ACE_barrelTwist=10;
		ACE_barrelLength=20;
    };
    class srifle_DMR_04_F: DMR_04_base_F {
		ACE_barrelTwist=8;
		ACE_barrelLength=17.72;
    };
    class srifle_DMR_05_blk_F: DMR_05_base_F {
		ACE_barrelTwist=14.17;
		ACE_barrelLength=24.41;
    };
    class srifle_DMR_06_camo_F: DMR_06_base_F {
		ACE_barrelTwist=12;
		ACE_barrelLength=22;
    };
    class MMG_01_hex_F: MMG_01_base_F {
		ACE_barrelTwist=14.17;
		ACE_barrelLength=21.65;
    };
    class MMG_02_camo_F: MMG_02_base_F {
		ACE_barrelTwist=9.25;
		ACE_barrelLength=24;
    };
    
    class HMG_127 : LMG_RCWS {
    };
    class HMG_01: HMG_127 {
    };
    class HMG_M2: HMG_01 {
        ACE_barrelTwist=12;
        ACE_barrelLength=45;
    };
};
