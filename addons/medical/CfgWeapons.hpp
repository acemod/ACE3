
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
        displayName = $STR_ACE_MEDICAL_BANDAGE_BASIC_DISPLAY;
        descriptionShort = $STR_ACE_MEDICAL_BANDAGE_BASIC_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_BANDAGE_BASIC_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_packingBandage: ACE_ItemCore {
        scope = 2;
        displayName = $STR_ACE_MEDICAL_PACKING_BANDAGE_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\packingBandage_x_ca.paa));
        model = QUOTE(PATHTOF(data\packingbandage.p3d));
        descriptionShort = $STR_ACE_MEDICAL_PACKING_BANDAGE_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_PACKING_BANDAGE_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_elasticBandage: ACE_ItemCore {
        scope = 2;
        displayName = $STR_ACE_MEDICAL_BANDAGE_ELASTIC_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\elasticBandage_x_ca.paa));
        model = "\A3\Structures_F_EPA\Items\Medical\Bandage_F.p3d";
        descriptionShort = $STR_ACE_MEDICAL_BANDAGE_ELASTIC_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_BANDAGE_ELASTIC_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_tourniquet: ACE_ItemCore {
        scope = 2;
        displayName = $STR_ACE_MEDICAL_TOURNIQUET_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\tourniquet_x_ca.paa));
        model = QUOTE(PATHTOF(data\tourniquet.p3d));
        descriptionShort = $STR_ACE_MEDICAL_TOURNIQUET_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_TOURNIQUET_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_morphine: ACE_ItemCore {
        scope = 2;
        displayName = $STR_ACE_MEDICAL_MORPHINE_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\morphine_x_ca.paa));
        model = QUOTE(PATHTOF(data\morphine.p3d));
        descriptionShort = $STR_ACE_MEDICAL_MORPHINE_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_MORPHINE_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_atropine: ACE_ItemCore {
        scope = 2;
        displayName = $STR_ACE_MEDICAL_ATROPINE_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\atropine_x_ca.paa));
        model = QUOTE(PATHTOF(data\atropine.p3d));
        descriptionShort = $STR_ACE_MEDICAL_ATROPINE_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_ATROPINE_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;

        };
    };
    class ACE_epinephrine: ACE_ItemCore {
        scope = 2;
        displayName = $STR_ACE_MEDICAL_EPINEPHRINE_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\epinephrine_x_ca.paa));
        model = QUOTE(PATHTOF(data\epinephrine.p3d));
        descriptionShort = $STR_ACE_MEDICAL_EPINEPHRINE_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_EPINEPHRINE_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_plasmaIV: ACE_ItemCore {
        scope = 2;
        displayName = $STR_ACE_MEDICAL_PLASMA_IV;
        picture = QUOTE(PATHTOF(ui\items\plasmaIV_x_ca.paa));
        descriptionShort = $STR_ACE_MEDICAL_PLASMA_IV_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_PLASMA_IV_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
    class ACE_plasmaIV_500: ACE_plasmaIV {
        displayName = $STR_ACE_MEDICAL_PLASMA_IV_500;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };
    class ACE_plasmaIV_250: ACE_plasmaIV {
        displayName = $STR_ACE_MEDICAL_PLASMA_IV_250;
        class ItemInfo: InventoryItem_Base_F {
            mass = 2.5;
        };
    };
    class ACE_bloodIV: ACE_ItemCore {
        scope = 2;
        model = "\A3\Structures_F_EPA\Items\Medical\BloodBag_F.p3d";
        displayName = $STR_ACE_MEDICAL_BLOOD_IV;
        picture = QUOTE(PATHTOF(ui\items\bloodIV_x_ca.paa));
        descriptionShort = $STR_ACE_MEDICAL_BLOOD_IV_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_BLOOD_IV_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
    class ACE_bloodIV_500: ACE_bloodIV {
        displayName = $STR_ACE_MEDICAL_BLOOD_IV_500;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };
    class ACE_bloodIV_250: ACE_bloodIV {
        displayName = $STR_ACE_MEDICAL_BLOOD_IV_250;
        class ItemInfo: InventoryItem_Base_F {
            mass = 2.5;
        };
    };
    class ACE_salineIV: ACE_ItemCore {
        scope = 2;
        displayName = $STR_ACE_MEDICAL_SALINE_IV;
        picture = QUOTE(PATHTOF(ui\items\salineIV_x_ca.paa));
        descriptionShort = $STR_ACE_MEDICAL_SALINE_IV_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_SALINE_IV_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };
    class ACE_salineIV_500: ACE_salineIV {
        displayName = $STR_ACE_MEDICAL_SALINE_IV_500;
        class ItemInfo: InventoryItem_Base_F {
            mass = 2.5;
        };
    };
    class ACE_salineIV_250: ACE_salineIV {
        displayName = $STR_ACE_MEDICAL_SALINE_IV_250;
        class ItemInfo: InventoryItem_Base_F {
            mass = 2.5;
        };
    };
    class ACE_quikclot: ACE_ItemCore {
        scope = 2;
        displayName = $STR_ACE_MEDICAL_QUIKCLOT_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\quickclot_x_ca.paa));
        descriptionShort = $STR_ACE_MEDICAL_QUIKCLOT_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_QUIKCLOT_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_personalAidKit: ACE_ItemCore {
        scope = 2;
        displayName = $STR_ACE_MEDICAL_AID_KIT_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\personal_aid_kit_x_ca.paa));
        descriptionShort = $STR_ACE_MEDICAL_AID_KIT_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_AID_KIT_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
        };
    };
    class ACE_surgicalKit: ACE_ItemCore {
        scope=2;
        displayName= $STR_ACE_MEDICAL_SURGICALKIT_DISPLAY;
        model = QUOTE(PATHTOF(data\surgical_kit.p3d));
        picture = QUOTE(PATHTOF(ui\items\surgicalKit_x_ca.paa));
        descriptionShort = $STR_ACE_MEDICAL_SURGICALKIT_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_SURGICALKIT_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };
    class ACE_bodyBag: ACE_ItemCore {
        scope=2;
        displayName= $STR_ACE_MEDICAL_BODYBAG_DISPLAY;
        model = QUOTE(PATHTOF(data\bodybagItem.p3d));
        picture = QUOTE(PATHTOF(ui\items\bodybag_x_ca.paa));
        descriptionShort = $STR_ACE_MEDICAL_BODYBAG_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_BODYBAG_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };
};
