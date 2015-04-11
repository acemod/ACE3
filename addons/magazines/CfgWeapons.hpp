
class CfgWeapons {

    /* MX */

    class Rifle_Base_F;
    class arifle_MX_Base_F: Rifle_Base_F {
        magazines[] += {
            "ACE_30Rnd_65x39_caseless_mag_Tracer_Dim",
            "ACE_30Rnd_65x39_caseless_mag_SD",
            "ACE_30Rnd_65x39_caseless_mag_AP",
            "100Rnd_65x39_caseless_mag",
            "100Rnd_65x39_caseless_mag_Tracer"
        };
    };

    class arifle_MX_SW_F: arifle_MX_Base_F {
        magazines[] += {
            "30Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag_Tracer"
        };
    };

    class arifle_MXM_F: arifle_MX_Base_F {
        magazines[] += {
            "30Rnd_65x39_caseless_mag",
            "30Rnd_65x39_caseless_mag_Tracer"
        };
    };


    /* Katiba */

    class arifle_katiba_Base_F: Rifle_Base_F {
        magazines[] += {
            "ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim",
            "ACE_30Rnd_65x39_caseless_green_mag_SD",
            "ACE_30Rnd_65x39_caseless_green_mag_AP"
        };
    };


    /* Assault Rifles */

    class Tavor_base_F: Rifle_Base_F {
        magazines[] += {
            "ACE_30Rnd_556x45_Stanag_Tracer_Dim",
            "ACE_30Rnd_556x45_Stanag_SD",
            "ACE_30Rnd_556x45_Stanag_AP"
        };
    };

    class mk20_base_F: Rifle_Base_F {
        magazines[] += {
            "ACE_30Rnd_556x45_Stanag_Tracer_Dim",
            "ACE_30Rnd_556x45_Stanag_SD",
            "ACE_30Rnd_556x45_Stanag_AP"
        };
    };


    /* SMGs */

    class SDAR_base_F: Rifle_Base_F {
        magazines[] += {
            "ACE_30Rnd_556x45_Stanag_Tracer_Dim",
            "ACE_30Rnd_556x45_Stanag_SD",
            "ACE_30Rnd_556x45_Stanag_AP"
        };
    };


    /* Silencers */

    class ItemCore;
    class InventoryMuzzleItem_Base_F;

    class muzzle_snds_H: ItemCore {
        class ItemInfo: InventoryMuzzleItem_Base_F {
            class MagazineCoef {
                initSpeed = 1.05;
            };

            class AmmoCoef {
                hit = 0.9;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.8f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "1.0f";
                recoilProneCoef = "1.0f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_L: muzzle_snds_H {
        class ItemInfo: ItemInfo {
            class MagazineCoef {
                initSpeed = 1.05;
            };

            class AmmoCoef {
                hit = 0.9;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.8f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "1.0f";
                recoilProneCoef = "1.0f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_M: muzzle_snds_H {
        class ItemInfo: ItemInfo {
            class MagazineCoef {
                initSpeed = 1.05;
            };

            class AmmoCoef {
                hit = 0.9;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.8f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "1.0f";
                recoilProneCoef = "1.0f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_B: muzzle_snds_H {
        class ItemInfo: ItemInfo {
            class MagazineCoef {
                initSpeed = 1.05;
            };

            class AmmoCoef {
                hit = 0.9;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.8f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "1.0f";
                recoilProneCoef = "1.0f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_H_MG: muzzle_snds_H {
        class ItemInfo: ItemInfo {
            class MagazineCoef {
                initSpeed = 1.05;
            };

            class AmmoCoef {
                hit = 0.9;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.8f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "1.0f";
                recoilProneCoef = "1.0f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_H_SW: muzzle_snds_H_MG {
        class ItemInfo: ItemInfo {
            class MagazineCoef {
                initSpeed = 1.05;
            };

            class AmmoCoef {
                hit = 0.9;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.8f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "1.0f";
                recoilProneCoef = "1.0f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_acp: muzzle_snds_H {
        class ItemInfo: ItemInfo {
            class MagazineCoef {
                initSpeed = 1.05;
            };

            class AmmoCoef {
                hit = 0.9;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.8f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "1.0f";
                recoilProneCoef = "1.0f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_338_black: ItemCore {
        class ItemInfo: InventoryMuzzleItem_Base_F {
            class MagazineCoef {
                initSpeed = 1.05;
            };

            class AmmoCoef {
                hit = 0.9;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.8f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "1.0f";
                recoilProneCoef = "1.0f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };

    class muzzle_snds_93mmg: ItemCore {
        class ItemInfo: InventoryMuzzleItem_Base_F {
            class MagazineCoef {
                initSpeed = 1.05;
            };

            class AmmoCoef {
                hit = 0.9;
                visibleFire = 0.5;
                audibleFire = 0.1;
                visibleFireTime = 0.5;
                audibleFireTime = 0.5;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.8f";
                artilleryDispersionCoef = "1.0f";
                fireLightCoef = "0.5f";
                recoilCoef = "1.0f";
                recoilProneCoef = "1.0f";
                minRangeCoef = "1.0f";
                minRangeProbabCoef = "1.0f";
                midRangeCoef = "1.0f";
                midRangeProbabCoef = "1.0f";
                maxRangeCoef = "1.0f";
                maxRangeProbabCoef = "1.0f";
            };
        };
    };
};
