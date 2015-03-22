
class CfgWeapons {
    class ItemCore;
    class ACE_ItemCore: ItemCore {
        type = 4096;//4;
        detectRange = -1;
        simulation = "ItemMineDetector";
    };

    class Rifle;
    class Rifle_Base_F: Rifle {
        class WeaponSlotsInfo;
    };

    class ACE_FakePrimaryWeapon: Rifle_Base_F {
        scope = 2;
        displayName = "";
        model = "";
        picture = "";
        magazines[] = {"ACE_FakeMagazine"};
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;

        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 0;
        };
    };
};
