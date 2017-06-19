
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
        scope = 1;
        scopeCurator = 1;
        scopeArsenal = 1;
        displayName = "";
        model = "\A3\Weapons_f\empty";
        picture = "";
        magazines[] = {"ACE_FakeMagazine"};
        discreteDistance[] = {};
        discreteDistanceInitIndex = 0;

        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 0;
        };
    };

    class InventoryItem_Base_F;
    class ACE_Banana: ACE_ItemCore {
        author = CSTRING(ACETeam);
        scope = 2;
        displayName = CSTRING(bananaDisplayName);
        descriptionShort = CSTRING(bananaDescr);
        model = QPATHTOF(data\banana.p3d);
        picture = QPATHTOF(data\icon_banana_ca.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
};

