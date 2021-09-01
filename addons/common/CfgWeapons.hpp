
class CfgWeapons {
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;
    class ACE_ItemCore: CBA_MiscItem {};

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

    class ACE_Banana: ACE_ItemCore {
        author = CSTRING(ACETeam);
        scope = 2;
        displayName = CSTRING(bananaDisplayName);
        descriptionShort = CSTRING(bananaDescr);
        model = QPATHTOF(data\banana.p3d);
        picture = QPATHTOF(data\icon_banana_ca.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class ACE_ropeBase: ACE_ItemCore {
        scope = 1;
        picture = QPATHTOF(data\m_rope_ca);
        model = "\A3\Structures_F_Heli\Items\Tools\Rope_01_F.p3d";
        descriptionShort = CSTRING(rope_descriptionShort);
    };

    class ACE_rope3: ACE_ropeBase {
        scope = 2;
        GVAR(ropeLength) = 3.2;
        displayName = CSTRING(Rope_3_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 6;
        };
    };
    class ACE_rope6: ACE_ropeBase {
        scope = 2;
        GVAR(ropeLength) = 6.2;
        displayName = CSTRING(Rope_6_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 18;
        };
    };
    class ACE_rope12: ACE_ropeBase {
        scope = 2;
        GVAR(ropeLength) = 12.2;
        displayName = CSTRING(Rope_12_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 36;
        };
    };
    class ACE_rope15: ACE_ropeBase {
        scope = 2;
        GVAR(ropeLength) = 15.2;
        displayName = CSTRING(Rope_15_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 45;
        };
    };
    class ACE_rope18: ACE_ropeBase {
        scope = 2;
        GVAR(ropeLength) = 18.3;
        displayName = CSTRING(Rope_18_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 54;
        };
    };
    class ACE_rope27: ACE_ropeBase {
        scope = 2;
        GVAR(ropeLength) = 27.4;
        displayName = CSTRING(Rope_27_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 81;
        };
    };
    class ACE_rope36: ACE_ropeBase {
        scope = 2;
        GVAR(ropeLength) = 36.6;
        displayName = CSTRING(Rope_36_Display);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 108;
        };
    };
};

