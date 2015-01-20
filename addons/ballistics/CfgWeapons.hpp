
class Mode_SemiAuto;
class Mode_FullAuto;

class CfgWeapons {

    /* MX */

    class Rifle_Base_F;
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
        class Single: Mode_SemiAuto {
            dispersion = 0.000800; // radians. Equal to 2.75 MOA.
            // Based on widely cited 2 MOA figure for new 5.56 ACR.
        };

        class manual: FullAuto {
            dispersion = 0.00147; // radians. Equal to 5.1 MOA.
        };
    };

    class arifle_MXM_F: arifle_MX_Base_F {
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

    class Rifle_Long_Base_F: Rifle_Base_F {};
    class LMG_Mk200_F: Rifle_Long_Base_F {
        class manual: Mode_FullAuto {
            dispersion = 0.00175; // radians. Equal to 6 MOA.
        };

        class Single: manual {
            dispersion = 0.00175; // radians. Equal to 6 MOA.
        };
    };

    class LMG_Zafir_F: Rifle_Long_Base_F {
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
            //
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
};
