
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
            type = 201;
        };
    };
    class Medikit: ItemCore {
        type = 0;
        class ItemInfo: MedikitItem {
            mass = 60;
            type = 201;
        };
    };

    // @todo localize
    class ACE_ItemCore;
    class ACE_fieldDressing: ACE_ItemCore {
        scope = 2;
        model = "\A3\Structures_F_EPA\Items\Medical\Bandage_F.p3d";
        picture = QUOTE(PATHTOF(ui\items\fieldDressing.paa));
        displayName = $STR_ACE_MEDICAL_BANDAGE_BASIC_DISPLAY;
        descriptionShort = $STR_ACE_MEDICAL_BANDAGE_BASIC_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_BANDAGE_BASIC_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass=1;
            type=201;
        };
    };
    class ACE_packingBandage: ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MEDICAL_PACKING_BANDAGE_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\packingBandage.paa));
        model = QUOTE(PATHTOF(data\packingbandage.p3d));
        descriptionShort = $STR_ACE_MEDICAL_PACKING_BANDAGE_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_PACKING_BANDAGE_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass=1;
            type=201;
        };
    };
    class ACE_elasticBandage: ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MEDICAL_BANDAGE_ELASTIC_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\elasticBandage.paa));
        model = "\A3\Structures_F_EPA\Items\Medical\Bandage_F.p3d";
        descriptionShort = $STR_ACE_MEDICAL_BANDAGE_ELASTIC_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_BANDAGE_ELASTIC_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass=1;
            type=201;
        };
    };
    class ACE_tourniquet: ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MEDICAL_TOURNIQUET_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\tourniquet.paa));
        model = QUOTE(PATHTOF(data\tourniquet.p3d));
        descriptionShort = $STR_ACE_MEDICAL_TOURNIQUET_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_TOURNIQUET_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass=1;
            type=201;
        };
    };
    class ACE_morphine: ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MEDICAL_MORPHINE_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\morphine.paa));
        model = QUOTE(PATHTOF(data\morphine.p3d));
        descriptionShort = $STR_ACE_MEDICAL_MORPHINE_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_MORPHINE_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass=1;
            type=201;
        };
    };
    class ACE_atropine: ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MEDICAL_ATROPINE_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\atropine.paa));
        model = QUOTE(PATHTOF(data\atropine.p3d));
        descriptionShort = $STR_ACE_MEDICAL_ATROPINE_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_ATROPINE_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass=1;
            type=201;
        };
    };
    class ACE_epinephrine: ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MEDICAL_EPINEPHRINE_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\epinephrine.paa));
        model = QUOTE(PATHTOF(data\epinephrine.p3d));
        descriptionShort = $STR_ACE_MEDICAL_EPINEPHRINE_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_EPINEPHRINE_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass=1;
            type=201;
        };
    };
    class ACE_plasmaIV: ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        displayName = $STR_ACE_MEDICAL_PLASMA_IV;
        picture = QUOTE(PATHTOF(ui\items\plasmaIV.paa));
        descriptionShort = $STR_ACE_MEDICAL_PLASMA_IV_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_PLASMA_IV_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
            type = 201;
        };
    };
    class ACE_plasmaIV_500: ACE_plasmaIV {
        displayName = $STR_ACE_MEDICAL_PLASMA_IV_500;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
            type = 201;
        };
    };
    class ACE_plasmaIV_250: ACE_plasmaIV {
        displayName = $STR_ACE_MEDICAL_PLASMA_IV_250;
        class ItemInfo: InventoryItem_Base_F {
            mass = 2.5;
            type = 201;
        };
    };
    class ACE_bloodIV: ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        model = "\A3\Structures_F_EPA\Items\Medical\BloodBag_F.p3d";
        displayName = $STR_ACE_MEDICAL_BLOOD_IV;
        picture = QUOTE(PATHTOF(ui\items\bloodIV.paa));
        descriptionShort = $STR_ACE_MEDICAL_BLOOD_IV_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_BLOOD_IV_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
            type = 201;
        };
    };
    class ACE_bloodIV_500: ACE_bloodIV {
        displayName = $STR_ACE_MEDICAL_BLOOD_IV_500;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
            type = 201;
        };
    };
    class ACE_bloodIV_250: ACE_bloodIV {
        displayName = $STR_ACE_MEDICAL_BLOOD_IV_250;
        class ItemInfo: InventoryItem_Base_F {
            mass = 2.5;
            type = 201;
        };
    };
    class ACE_salineIV: ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        displayName = $STR_ACE_MEDICAL_SALINE_IV;
        picture = QUOTE(PATHTOF(ui\items\salineIV.paa));
        descriptionShort = $STR_ACE_MEDICAL_SALINE_IV_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_SALINE_IV_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
            type = 201;
        };
    };
    class ACE_salineIV_500: ACE_salineIV {
        displayName = $STR_ACE_MEDICAL_SALINE_IV_500;
        class ItemInfo: InventoryItem_Base_F {
            mass = 2.5;
            type = 201;
        };
    };
    class ACE_salineIV_250: ACE_salineIV {
        displayName = $STR_ACE_MEDICAL_SALINE_IV_250;
        class ItemInfo: InventoryItem_Base_F {
            mass = 2.5;
            type = 201;
        };
    };
    class ACE_quikclot: ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MEDICAL_QUIKCLOT_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\quickclot.paa));
        descriptionShort = $STR_ACE_MEDICAL_QUIKCLOT_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_QUIKCLOT_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            type = 201;
        };
    };
    class ACE_personalAidKit: ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MEDICAL_AID_KIT_DISPLAY;
        picture = QUOTE(PATHTOF(ui\items\personal_aid_kit.paa));
        //model = QUOTE(PATHTOF(equipment\Personal-aidkits\MTP.p3d));
        descriptionShort = $STR_ACE_MEDICAL_AID_KIT_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_AID_KIT_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
            type = 201;
        };
    };
    class ACE_surgicalKit: ItemCore {
        scope=2;
        displayName= $STR_ACE_MEDICAL_SURGICALKIT_DISPLAY;
        model = QUOTE(PATHTOF(data\surgical_kit.p3d));
        picture = QUOTE(PATHTOF(ui\items\surgicalKit.paa));
        descriptionShort = $STR_ACE_MEDICAL_SURGICALKIT_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_SURGICALKIT_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
            type = 201;
        };
    };
    class ACE_bodyBag: ItemCore {
        scope=2;
        displayName= $STR_ACE_MEDICAL_BODYBAG_DISPLAY;
        model = QUOTE(PATHTOF(data\bodybagItem.p3d));
        picture = QUOTE(PATHTOF(ui\items\bodybag.paa));
        descriptionShort = $STR_ACE_MEDICAL_BODYBAG_DESC_SHORT;
        descriptionUse = $STR_ACE_MEDICAL_BODYBAG_DESC_USE;
        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
            type = 201;
        };
    };
};
