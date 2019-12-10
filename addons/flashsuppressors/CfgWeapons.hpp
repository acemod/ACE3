class asdg_MuzzleSlot;
class asdg_MuzzleSlot_338: asdg_MuzzleSlot { // for .338 universal mount suppressors
    class compatibleItems {
        ACE_muzzle_mzls_338 = 1;
    };
};
class asdg_MuzzleSlot_762: asdg_MuzzleSlot { // for 7.62x51 universal mount suppressors
    class compatibleItems {
        ACE_muzzle_mzls_B = 1;
    };
};
class asdg_MuzzleSlot_65: asdg_MuzzleSlot_762 { // for 6.5 weapons, mostly to deal with BIS vanilla compatibility
    class compatibleItems: compatibleItems {
        ACE_muzzle_mzls_H = 1;
        ACE_muzzle_mzls_B = 0;
    };
};
class asdg_MuzzleSlot_93x64: asdg_MuzzleSlot { // for 9.3x64 universal mount suppressors
    class compatibleItems {
        ACE_muzzle_mzls_93mmg = 1;
    };
};
class asdg_MuzzleSlot_9MM_SMG: asdg_MuzzleSlot { // for 9x19mm universal mount SMG suppressors
    class compatibleItems {
        ACE_muzzle_mzls_smg_02 = 1;
    };
};
class asdg_MuzzleSlot_9MM: asdg_MuzzleSlot { // for 9x19mm universal mount pistol suppressors
    class compatibleItems {
        ACE_muzzle_mzls_smg_02 = 1;
    };
};
class asdg_MuzzleSlot_556: asdg_MuzzleSlot { // for 5.56x45 universal mount suppressors
    class compatibleItems {
        ACE_muzzle_mzls_L = 1;
    };
};
class asdg_MuzzleSlot_45ACP_SMG: asdg_MuzzleSlot { // for .45ACP universal mount SMG suppressors
    class compatibleItems {
        ACE_muzzle_mzls_smg_01 = 1;
    };
};
class asdg_MuzzleSlot_45ACP: asdg_MuzzleSlot { // for .45ACP universal mount pistol suppressors
    class compatibleItems {
        ACE_muzzle_mzls_smg_01 = 1;
    };
};
class asdg_MuzzleSlot_762MG: asdg_MuzzleSlot { // for 7.62, 6.5 and 5.56 universal mount MG suppressors
    class compatibleItems {
        ACE_muzzle_mzls_B = 1;
    };
};

// Vanilla Muzzles from 1.94+ (ref https://github.com/CBATeam/CBA_A3/pull/1184)
class MuzzleSlot;
class MuzzleSlot_65: MuzzleSlot {
    class compatibleItems {
        ACE_muzzle_mzls_H = 1;
    };
};
class MuzzleSlot_556: MuzzleSlot {
    class compatibleItems {
        ACE_muzzle_mzls_L = 1;
    };
};
class MuzzleSlot_762: MuzzleSlot {
    class compatibleItems {
        ACE_muzzle_mzls_B = 1;
    };
};

class CfgWeapons {
    class Rifle_Base_F;
    class Rifle_Long_Base_F: Rifle_Base_F {
        class WeaponSlotsInfo;
    };
    /* Other */
    class LMG_Mk200_F: Rifle_Long_Base_F {
        class WeaponSlotsInfo: WeaponSlotsInfo {
            class MuzzleSlot: MuzzleSlot_65 {
                compatibleItems[] += {"ACE_muzzle_mzls_H"};  // uses array instead of inherited class
            };
        };
    };


    /* Flashsuppressors */

    class ItemCore;
    class InventoryMuzzleItem_Base_F;

    class ACE_muzzle_mzls_H: ItemCore {
        author = ECSTRING(common,ACETeam);
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
        author = ECSTRING(common,ACETeam);
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
        author = ECSTRING(common,ACETeam);
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
        author = ECSTRING(common,ACETeam);
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
        author = ECSTRING(common,ACETeam);
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
        author = ECSTRING(common,ACETeam);
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
        author = ECSTRING(common,ACETeam);
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
