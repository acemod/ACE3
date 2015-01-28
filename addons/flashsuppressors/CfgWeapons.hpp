
class CfgWeapons {
    class ItemCore;
    class InventoryMuzzleItem_Base_F;

    class ACE_muzzle_mzls_H: ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_muzzle_mzls_H";
        htMin = 1;
        htMax = 600;
        afMax = 0;
        mfMax = 0;
        mFact = 1;
        tBody = 100;
        scope = 2;
        displayName = "$STR_ACE_muzzle_mzls_H";
        picture = "\A3\weapons_F\Data\UI\gear_acca_mzls_h_ca.paa";
        model = "\A3\weapons_f\acc\acca_mzls_H_F";

        class ItemInfo: InventoryMuzzleItem_Base_F {
            mass = 8;
            soundTypeIndex = 0;
            muzzleEnd = "zaslehPoint";
            alternativeFire = "Zasleh2";

            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 1.0;
                visibleFireTime = 0.5;
                audibleFireTime = 1.0;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.9f";
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

        inertia = 0.2;
    };

    class ACE_muzzle_mzls_B: ACE_muzzle_mzls_H {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_muzzle_mzls_B";
        displayName = "$STR_ACE_muzzle_mzls_B";
        picture = "\A3\weapons_F\Data\UI\gear_acca_mzls_h_ca.paa";
        model = "\A3\weapons_f\acc\acca_mzls_H_F";

        class ItemInfo: ItemInfo {
            mass = 6;
            soundTypeIndex = 0;
            muzzleEnd = "zaslehPoint";
            alternativeFire = "Zasleh2";

            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 1.0;
                visibleFireTime = 0.5;
                audibleFireTime = 1.0;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.9f";
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

        inertia = 0.2;
    };

    class ACE_muzzle_mzls_L: ACE_muzzle_mzls_H {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_muzzle_mzls_L";
        displayName = "$STR_ACE_muzzle_mzls_L";
        picture = "\A3\weapons_F\Data\UI\gear_acca_mzls_l_ca.paa";
        model = "\A3\weapons_f\acc\acca_mzls_l_F";

        class ItemInfo: ItemInfo {
            mass = 6;
            soundTypeIndex = 0;
            muzzleEnd = "zaslehPoint";
            alternativeFire = "Zasleh2";

            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 1.0;
                visibleFireTime = 0.5;
                audibleFireTime = 1.0;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.9f";
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

        inertia = 0.1;
    };

    class ACE_muzzle_mzls_smg_01: ACE_muzzle_mzls_H {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_muzzle_mzls_smg_01";
        displayName = "$STR_ACE_muzzle_mzls_smg_01";
        picture = "\A3\weapons_F\Data\UI\gear_acca_mzls_l_ca.paa";
        model = "\A3\weapons_f\acc\acca_mzls_H_F"; //"\A3\weapons_f\acc\acca_mzls_smg_01_F";

        class ItemInfo: ItemInfo {
            mass = 6;
            soundTypeIndex = 0;
            muzzleEnd = "zaslehPoint";
            alternativeFire = "Zasleh2";

            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 1.0;
                visibleFireTime = 0.5;
                audibleFireTime = 1.0;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.9f";
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

        inertia = 0.1;
    };

    class ACE_muzzle_mzls_smg_02: ACE_muzzle_mzls_H {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_muzzle_mzls_smg_02";
        displayName = "$STR_ACE_muzzle_mzls_smg_02";
        picture = "\A3\weapons_F\Data\UI\gear_acca_mzls_l_ca.paa";
        model = "\A3\weapons_f\acc\acca_mzls_H_F"; //"\A3\weapons_f\acc\acca_mzls_smg_01_F";

        class ItemInfo: ItemInfo {
            mass = 6;
            soundTypeIndex = 0;
            muzzleEnd = "zaslehPoint";
            alternativeFire = "Zasleh2";

            class MagazineCoef {
                initSpeed = 1.0;
            };

            class AmmoCoef {
                hit = 1.0;
                visibleFire = 0.5;
                audibleFire = 1.0;
                visibleFireTime = 0.5;
                audibleFireTime = 1.0;
                cost = 1.0;
                typicalSpeed = 1.0;
                airFriction = 1.0;
            };

            class MuzzleCoef {
                dispersionCoef = "0.9f";
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

        inertia = 0.1;
    };
};
