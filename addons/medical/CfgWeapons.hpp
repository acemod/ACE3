
class CfgWeapons {
    class ItemCore;
    class CBA_MiscItem_ItemInfo;
    class InventoryFirstAidKitItem_Base_F;
    class MedikitItem;

    // ITEMS
    class FirstAidKit: ItemCore {
        type = 0;
        ace_arsenal_hide = 1;
        class ItemInfo: InventoryFirstAidKitItem_Base_F {
            mass = 4;
        };
    };
    class Medikit: ItemCore {
        type = 0;
        ace_arsenal_hide = 1;
        class ItemInfo: MedikitItem {
            mass = 60;
        };
    };

    class ACE_ItemCore;
    class ACE_fieldDressing: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        model = QPATHTOF(data\bandage.p3d);
        picture = QPATHTOF(ui\items\fieldDressing_x_ca.paa);
        displayName = CSTRING(Bandage_Basic_Display);
        descriptionShort = CSTRING(Bandage_Basic_Desc_Short);
        descriptionUse = CSTRING(Bandage_Basic_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
    class ACE_packingBandage: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Packing_Bandage_Display);
        picture = QPATHTOF(ui\items\packingBandage_x_ca.paa);
        model = QPATHTOF(data\packingbandage.p3d);
        descriptionShort = CSTRING(Packing_Bandage_Desc_Short);
        descriptionUse = CSTRING(Packing_Bandage_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
    class ACE_elasticBandage: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Bandage_Elastic_Display);
        picture = QPATHTOF(ui\items\elasticBandage_x_ca.paa);
        model = "\A3\Structures_F_EPA\Items\Medical\Bandage_F.p3d";
        descriptionShort = CSTRING(Bandage_Elastic_Desc_Short);
        descriptionUse = CSTRING(Bandage_Elastic_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
    class ACE_tourniquet: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Tourniquet_Display);
        picture = QPATHTOF(ui\items\tourniquet_x_ca.paa);
        model = QPATHTOF(data\tourniquet.p3d);
        descriptionShort = CSTRING(Tourniquet_Desc_Short);
        descriptionUse = CSTRING(Tourniquet_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
    class ACE_morphine: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Morphine_Display);
        picture = QPATHTOF(ui\items\morphine_x_ca.paa);
        model = QPATHTOF(data\morphine.p3d);
        descriptionShort = CSTRING(Morphine_Desc_Short);
        descriptionUse = CSTRING(Morphine_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
    class ACE_adenosine: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Adenosine_Display);
        picture = QPATHTOF(ui\items\adenosine_x_ca.paa);
        model = QPATHTOF(data\adenosine.p3d);
        descriptionShort = CSTRING(adenosine_Desc_Short);
        descriptionUse = CSTRING(adenosine_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
    class ACE_atropine: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Atropine_Display);
        picture = QPATHTOF(ui\items\atropine_x_ca.paa);
        model = QPATHTOF(data\atropine.p3d);
        descriptionShort = CSTRING(Atropine_Desc_Short);
        descriptionUse = CSTRING(Atropine_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
    class ACE_epinephrine: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Epinephrine_Display);
        picture = QPATHTOF(ui\items\epinephrine_x_ca.paa);
        model = QPATHTOF(data\epinephrine.p3d);
        descriptionShort = CSTRING(Epinephrine_Desc_Short);
        descriptionUse = CSTRING(Epinephrine_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };

    class ACE_plasmaIV: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Plasma_IV);
        model = QPATHTOF(data\IVBag_1000ml.p3d);
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = { QPATHTOF(data\IVBag_plasma_1000ml_ca.paa) };
        picture = QPATHTOF(ui\items\plasmaIV_x_ca.paa);
        descriptionShort = CSTRING(Plasma_IV_Desc_Short);
        descriptionUse = CSTRING(Plasma_IV_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
    class ACE_plasmaIV_500: ACE_plasmaIV {
        displayName = CSTRING(Plasma_IV_500);
        model = QPATHTOF(data\IVBag_500ml.p3d);
        hiddenSelectionsTextures[] = { QPATHTOF(data\IVBag_plasma_500ml_ca.paa) };
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };
    class ACE_plasmaIV_250: ACE_plasmaIV {
        displayName = CSTRING(Plasma_IV_250);
        model = QPATHTOF(data\IVBag_250ml.p3d);
        hiddenSelectionsTextures[] = { QPATHTOF(data\IVBag_plasma_250ml_ca.paa) };
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2.5;
        };
    };
    class ACE_bloodIV: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        model = QPATHTOF(data\IVBag_1000ml.p3d);
        displayName = CSTRING(Blood_IV);
        picture = QPATHTOF(ui\items\bloodIV_x_ca.paa);
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = { QPATHTOF(data\IVBag_blood_1000ml_ca.paa) };
        descriptionShort = CSTRING(Blood_IV_Desc_Short);
        descriptionUse = CSTRING(Blood_IV_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
    class ACE_bloodIV_500: ACE_bloodIV {
        displayName = CSTRING(Blood_IV_500);
        model = QPATHTOF(data\IVBag_500ml.p3d);
        hiddenSelectionsTextures[] = { QPATHTOF(data\IVBag_blood_500ml_ca.paa) };
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };
    class ACE_bloodIV_250: ACE_bloodIV {
        displayName = CSTRING(Blood_IV_250);
        model = QPATHTOF(data\IVBag_250ml.p3d);
        hiddenSelectionsTextures[] = { QPATHTOF(data\IVBag_blood_250ml_ca.paa) };
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2.5;
        };
    };
    class ACE_salineIV: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Saline_IV);
        model = QPATHTOF(data\IVBag_1000ml.p3d);
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = { QPATHTOF(data\IVBag_saline_1000ml_ca.paa) };
        picture = QPATHTOF(ui\items\salineIV_x_ca.paa);
        descriptionShort = CSTRING(Saline_IV_Desc_Short);
        descriptionUse = CSTRING(Saline_IV_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
    class ACE_salineIV_500: ACE_salineIV {
        displayName = CSTRING(Saline_IV_500);
        model = QPATHTOF(data\IVBag_500ml.p3d);
        hiddenSelectionsTextures[] = { QPATHTOF(data\IVBag_saline_500ml_ca.paa) };
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };
    class ACE_salineIV_250: ACE_salineIV {
        displayName = CSTRING(Saline_IV_250);
        model = QPATHTOF(data\IVBag_250ml.p3d);
        hiddenSelectionsTextures[] = { QPATHTOF(data\IVBag_saline_250ml_ca.paa) };
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2.5;
        };
    };
    class ACE_quikclot: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(QuikClot_Display);
        model = QPATHTOF(data\QuikClot.p3d);
        picture = QPATHTOF(ui\items\quickclot_x_ca.paa);
        descriptionShort = CSTRING(QuikClot_Desc_Short);
        descriptionUse = CSTRING(QuikClot_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
    class ACE_personalAidKit: ACE_ItemCore {
        scope = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Aid_Kit_Display);
        picture = QPATHTOF(ui\items\personal_aid_kit_x_ca.paa);
        descriptionShort = CSTRING(Aid_Kit_Desc_Short);
        descriptionUse = CSTRING(Aid_Kit_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };
    class ACE_surgicalKit: ACE_ItemCore {
        scope=2;
        author = ECSTRING(common,ACETeam);
        displayName= CSTRING(SurgicalKit_Display);
        model = QPATHTOF(data\surgical_kit.p3d);
        picture = QPATHTOF(ui\items\surgicalKit_x_ca.paa);
        descriptionShort = CSTRING(SurgicalKit_Desc_Short);
        descriptionUse = CSTRING(SurgicalKit_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };
    class ACE_bodyBag: ACE_ItemCore {
        scope=2;
        author = ECSTRING(common,ACETeam);
        displayName= CSTRING(Bodybag_Display);
        model = QPATHTOF(data\bodybagItem.p3d);
        picture = QPATHTOF(ui\items\bodybag_x_ca.paa);
        descriptionShort = CSTRING(Bodybag_Desc_Short);
        descriptionUse = CSTRING(Bodybag_Desc_Use);
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 7;
        };
    };
};
