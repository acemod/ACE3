
class MuzzleSlot;

class CfgWeapons {

    /* MX */

    class Rifle;
    class Rifle_Base_F: Rifle {
        class WeaponSlotsInfo;
    };

    class arifle_MX_Base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_H"};
            };
        };
    };

    class arifle_MX_SW_F: arifle_MX_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                // Shit is broken again
                //compatibleItems[] += {"ACE_muzzle_mzls_H"};
                compatibleItems[] = {"muzzle_snds_H","muzzle_snds_H_SW","ACE_muzzle_mzls_H"};
            };
        };
    };


    /* Katiba */

    class arifle_katiba_Base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_H"};
            };
        };
    };


    /* Other */

    class Rifle_Long_Base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };

    class EBR_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_B"};
            };
        };
    };

    class DMR_01_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_B"};
            };
        };
    };

    class DMR_02_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_338"};
            };
        };
    };

    class DMR_03_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_B"};
            };
        };
    };

    class DMR_05_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_93mmg"};
            };
        };
    };

    class DMR_06_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_B"};
            };
        };
    };

    class MMG_01_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_93mmg"};
            };
        };
    };

    class MMG_02_base_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_338"};
            };
        };
    };

    class LMG_Mk200_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_H"};
            };
        };
    };

    class LMG_Zafir_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_B"};
            };
        };
    };


    /* Assault Rifles */

    class Tavor_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_L"};
            };
        };
    };

    class mk20_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_L"};
            };
        };
    };


    /* SMGs */

    class pdw2000_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_smg_02"};
            };
        };
    };

    class SMG_01_Base: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_smg_01"};
            };
        };
    };

    class SMG_02_base_F: Rifle_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_smg_02"};
            };
        };
    };


    /* Pistols */

    class Pistol;
    class Pistol_Base_F: Pistol {
        class WeaponSlotsInfo;
    };

    class hgun_P07_F: Pistol_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
                compatibleItems[] += {"ACE_muzzle_mzls_smg_02"};
            };
        };
    };

    class hgun_Rook40_F: Pistol_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
                compatibleItems[] += {"ACE_muzzle_mzls_smg_02"};
            };
        };
    };

    class hgun_ACPC2_F: Pistol_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_smg_01"};
            };
        };
    };

    class hgun_Pistol_heavy_01_F: Pistol_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot {
                compatibleItems[] += {"ACE_muzzle_mzls_smg_01"};
            };
        };
    };

    /*class hgun_Pistol_heavy_02_F: Pistol_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot {
                linkProxy = "\A3\data_f\proxies\weapon_slots\MUZZLE";
                compatibleItems[] += {"ACE_muzzle_mzls_smg_01"};
            };
        };
    };*/


    /* Flashsuppressors */

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
        displayName = CSTRING(muzzle_mzls_H);
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
        displayName = CSTRING(muzzle_mzls_B);
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
        displayName = CSTRING(muzzle_mzls_L);
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
        displayName = CSTRING(muzzle_mzls_smg_01);
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
        displayName = CSTRING(muzzle_mzls_smg_02);
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

    class ACE_muzzle_mzls_338: ACE_muzzle_mzls_H {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_muzzle_mzls_338";
        displayName = CSTRING(muzzle_mzls_338);
        picture = "\A3\weapons_F\Data\UI\gear_acca_mzls_h_ca.paa";
        model = "\A3\weapons_f\acc\acca_mzls_H_F";

        class ItemInfo: ItemInfo {
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

    class ACE_muzzle_mzls_93mmg: ACE_muzzle_mzls_H {
        author = "$STR_ACE_Common_ACETeam";
        _generalMacro = "ACE_muzzle_mzls_93mmg";
        displayName = CSTRING(muzzle_mzls_93mmg);
        picture = "\A3\weapons_F\Data\UI\gear_acca_mzls_h_ca.paa";
        model = "\A3\weapons_f\acc\acca_mzls_H_F";

        class ItemInfo: ItemInfo {
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
};
