
class CfgWeapons {
    class ItemCore;
    class InventoryItem_Base_F;
    class InventoryFirstAidKitItem_Base_F;
    class MedikitItem;

    // ITEMS
    class FirstAidKit: ItemCore {
        type = 0;
        class ItemInfo: InventoryFirstAidKitItem_Base_F {
            mass = 4;
        };
    };
    class Medikit: ItemCore {
        type = 0;
        class ItemInfo: MedikitItem {
            mass = 60;
        };
    };

    class ACE_ItemCore;
    class ACE_fieldDressing: ACE_ItemCore {
        scope = 2;
        model = QUOTE(PATHTOF(data\bandage.p3d));
        picture = QUOTE(PATHTOF(ui\items\fieldDressing_x_ca.paa));
        displayName = CSTRING(Bandage_Basic_Display);
        descriptionShort = CSTRING(Bandage_Basic_Desc_Short);
        descriptionUse = CSTRING(Bandage_Basic_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_packingBandage: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(Packing_Bandage_Display);
        picture = QUOTE(PATHTOF(ui\items\packingBandage_x_ca.paa));
        model = QUOTE(PATHTOF(data\packingbandage.p3d));
        descriptionShort = CSTRING(Packing_Bandage_Desc_Short);
        descriptionUse = CSTRING(Packing_Bandage_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_elasticBandage: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(Bandage_Elastic_Display);
        picture = QUOTE(PATHTOF(ui\items\elasticBandage_x_ca.paa));
        model = "\A3\Structures_F_EPA\Items\Medical\Bandage_F.p3d";
        descriptionShort = CSTRING(Bandage_Elastic_Desc_Short);
        descriptionUse = CSTRING(Bandage_Elastic_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_tourniquet: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(Tourniquet_Display);
        picture = QUOTE(PATHTOF(ui\items\tourniquet_x_ca.paa));
        model = QUOTE(PATHTOF(data\tourniquet.p3d));
        descriptionShort = CSTRING(Tourniquet_Desc_Short);
        descriptionUse = CSTRING(Tourniquet_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_morphine: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(Morphine_Display);
        picture = QUOTE(PATHTOF(ui\items\morphine_x_ca.paa));
        model = QUOTE(PATHTOF(data\morphine.p3d));
        descriptionShort = CSTRING(Morphine_Desc_Short);
        descriptionUse = CSTRING(Morphine_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_atropine: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(Atropine_Display);
        picture = QUOTE(PATHTOF(ui\items\atropine_x_ca.paa));
        model = QUOTE(PATHTOF(data\atropine.p3d));
        descriptionShort = CSTRING(Atropine_Desc_Short);
        descriptionUse = CSTRING(Atropine_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;

        };
    };
    class ACE_epinephrine: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(Epinephrine_Display);
        picture = QUOTE(PATHTOF(ui\items\epinephrine_x_ca.paa));
        model = QUOTE(PATHTOF(data\epinephrine.p3d));
        descriptionShort = CSTRING(Epinephrine_Desc_Short);
        descriptionUse = CSTRING(Epinephrine_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };

    class ACE_plasmaIV: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(Plasma_IV);
        model = QUOTE(PATHTOF(data\IVBag_1000ml.p3d));
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = { QUOTE(PATHTOF(data\IVBag_plasma_1000ml_ca.paa)) };
        picture = QUOTE(PATHTOF(ui\items\plasmaIV_x_ca.paa));
        descriptionShort = CSTRING(Plasma_IV_Desc_Short);
        descriptionUse = CSTRING(Plasma_IV_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
    class ACE_plasmaIV_500: ACE_plasmaIV {
        displayName = CSTRING(Plasma_IV_500);
        model = QUOTE(PATHTOF(data\IVBag_500ml.p3d));
        hiddenSelectionsTextures[] = { QUOTE(PATHTOF(data\IVBag_plasma_500ml_ca.paa)) };
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };
    class ACE_plasmaIV_250: ACE_plasmaIV {
        displayName = CSTRING(Plasma_IV_250);
        model = QUOTE(PATHTOF(data\IVBag_250ml.p3d));
        hiddenSelectionsTextures[] = { QUOTE(PATHTOF(data\IVBag_plasma_250ml_ca.paa)) };
        class ItemInfo: InventoryItem_Base_F {
            mass = 2.5;
        };
    };
    class ACE_bloodIV: ACE_ItemCore {
        scope = 2;
        model = QUOTE(PATHTOF(data\IVBag_1000ml.p3d));
        displayName = CSTRING(Blood_IV);
        picture = QUOTE(PATHTOF(ui\items\bloodIV_x_ca.paa));
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = { QUOTE(PATHTOF(data\IVBag_blood_1000ml_ca.paa)) };
        descriptionShort = CSTRING(Blood_IV_Desc_Short);
        descriptionUse = CSTRING(Blood_IV_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
    class ACE_bloodIV_500: ACE_bloodIV {
        displayName = CSTRING(Blood_IV_500);
        model = QUOTE(PATHTOF(data\IVBag_500ml.p3d));
        hiddenSelectionsTextures[] = { QUOTE(PATHTOF(data\IVBag_blood_500ml_ca.paa)) };
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };
    class ACE_bloodIV_250: ACE_bloodIV {
        displayName = CSTRING(Blood_IV_250);
        model = QUOTE(PATHTOF(data\IVBag_250ml.p3d));
        hiddenSelectionsTextures[] = { QUOTE(PATHTOF(data\IVBag_blood_250ml_ca.paa)) };
        class ItemInfo: InventoryItem_Base_F {
            mass = 2.5;
        };
    };
    class ACE_salineIV: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(Saline_IV);
        model = QUOTE(PATHTOF(data\IVBag_1000ml.p3d));
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = { QUOTE(PATHTOF(data\IVBag_saline_1000ml_ca.paa)) };
        picture = QUOTE(PATHTOF(ui\items\salineIV_x_ca.paa));
        descriptionShort = CSTRING(Saline_IV_Desc_Short);
        descriptionUse = CSTRING(Saline_IV_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
    class ACE_salineIV_500: ACE_salineIV {
        displayName = CSTRING(Saline_IV_500);
        model = QUOTE(PATHTOF(data\IVBag_500ml.p3d));
        hiddenSelectionsTextures[] = { QUOTE(PATHTOF(data\IVBag_saline_500ml_ca.paa)) };
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };
    class ACE_salineIV_250: ACE_salineIV {
        displayName = CSTRING(Saline_IV_250);
        model = QUOTE(PATHTOF(data\IVBag_250ml.p3d));
        hiddenSelectionsTextures[] = { QUOTE(PATHTOF(data\IVBag_saline_250ml_ca.paa)) };
        class ItemInfo: InventoryItem_Base_F {
            mass = 2.5;
        };
    };
    class ACE_quikclot: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(QuikClot_Display);
        model = QUOTE(PATHTOF(data\QuikClot.p3d));
        picture = QUOTE(PATHTOF(ui\items\quickclot_x_ca.paa));
        descriptionShort = CSTRING(QuikClot_Desc_Short);
        descriptionUse = CSTRING(QuikClot_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_personalAidKit: ACE_ItemCore {
        scope = 2;
        displayName = CSTRING(Aid_Kit_Display);
        picture = QUOTE(PATHTOF(ui\items\personal_aid_kit_x_ca.paa));
        descriptionShort = CSTRING(Aid_Kit_Desc_Short);
        descriptionUse = CSTRING(Aid_Kit_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
    class ACE_surgicalKit: ACE_ItemCore {
        scope=2;
        displayName= CSTRING(SurgicalKit_Display);
        model = QUOTE(PATHTOF(data\surgical_kit.p3d));
        picture = QUOTE(PATHTOF(ui\items\surgicalKit_x_ca.paa));
        descriptionShort = CSTRING(SurgicalKit_Desc_Short);
        descriptionUse = CSTRING(SurgicalKit_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };
    class ACE_bodyBag: ACE_ItemCore {
        scope=2;
        displayName= CSTRING(Bodybag_Display);
        model = QUOTE(PATHTOF(data\bodybagItem.p3d));
        picture = QUOTE(PATHTOF(ui\items\bodybag_x_ca.paa));
        descriptionShort = CSTRING(Bodybag_Desc_Short);
        descriptionUse = CSTRING(Bodybag_Desc_Use);
        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    };
};
