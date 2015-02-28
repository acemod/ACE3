
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
  class GVAR(fieldDressing): ACE_ItemCore {
    displayname = "Bandage";
    descriptionshort = "$STR_AGM_Medical_Bandage_Description";
    //model = "\A3\Structures_F_EPA\Items\Medical\Bandage_F.p3d";
    //picture = "\AGM_Medical\UI\AGM_bandage_ca.paa";
    scope = 2;
    class ItemInfo: InventoryItem_Base_F {
      mass = 2;
    };
  };
  class GVAR(morphine): GVAR(fieldDressing) {
    displayName = "Morphine";
    descriptionShort = "$STR_AGM_Medical_Morphine_Description";
    //model = "\AGM_Medical\agm_morphine.p3d";
    //picture = "\AGM_Medical\UI\AGM_morphine_ca.paa";
  };
  class GVAR(epipen): GVAR(fieldDressing) {
    displayName = "Epipen";
    descriptionShort = "$STR_AGM_Medical_Epinephrine_Description";
    //model = "\AGM_Medical\agm_epipen.p3d";
    //picture = "\AGM_Medical\UI\AGM_epipen_ca.paa";
  };
  class GVAR(bloodIV): GVAR(fieldDressing) {
    displayName = "Bloodbag";
    descriptionShort = "$STR_AGM_Medical_Bloodbag_Description";
    //model = "\A3\Structures_F_EPA\Items\Medical\BloodBag_F.p3d";
    //picture = "\AGM_Medical\UI\AGM_bloodbag_ca.paa";
    class ItemInfo: ItemInfo {
      mass = 10;
    };
  };
/*    class GVAR(packingBandage): ItemCore
    {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MAG_PACKING_BANDAGE_DISPLAY;
        picture = QUOTE(PATHTOF(equipment\img\packing_bandage.paa));
        model = QUOTE(PATHTOF(equipment\bandages\packingbandage.p3d));
        descriptionShort = $STR_ACE_MAG_PACKING_BANDAGE_DESC_SHORT;
        descriptionUse = $STR_ACE_MAG_PACKING_BANDAGE_DESC_USE;
        class ItemInfo: InventoryItem_Base_F
        {
            mass=1;
            type=201;
        };
    };
    class GVAR(elasticBandage): ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MAG_BANDAGE_ELASTIC_DISPLAY;
        picture = QUOTE(PATHTOF(equipment\img\bandageElastic.paa));
        model = "\A3\Structures_F_EPA\Items\Medical\Bandage_F.p3d";
        descriptionShort = $STR_ACE_MAG_BANDAGE_ELASTIC_DESC_SHORT;
        descriptionUse = $STR_ACE_MAG_BANDAGE_ELASTIC_DESC_USE;
        class ItemInfo: InventoryItem_Base_F
        {
            mass=1;
            type=201;
        };
    };
    class GVAR(tourniquet): ItemCore
    {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MAG_TOURNIQUET_DISPLAY;
        picture = QUOTE(PATHTOF(equipment\img\tourniquet.paa));
        model = QUOTE(PATHTOF(equipment\Tourniquet.p3d));
        descriptionShort = $STR_ACE_MAG_TOURNIQUET_DESC_SHORT;
        descriptionUse = $STR_ACE_MAG_TOURNIQUET_DESC_USE;
        class ItemInfo: InventoryItem_Base_F
        {
            mass=1;
            type=201;
        };
    };
    class GVAR(morphine): ItemCore
    {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MAG_MORPHINE_DISPLAY;
        picture = QUOTE(PATHTOF(equipment\img\morphine.paa));
        model = QUOTE(PATHTOF(equipment\Morphinpen.p3d));
        descriptionShort = $STR_ACE_MAG_MORPHINE_DESC_SHORT;
        descriptionUse = $STR_ACE_MAG_MORPHINE_DESC_USE;
        class ItemInfo: InventoryItem_Base_F
        {
            mass=1;
            type=201;
        };
    };
    class GVAR(atropine): ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MAG_ATROPINE_DISPLAY;
        picture = QUOTE(PATHTOF(equipment\img\atropine.paa));
        model = QUOTE(PATHTOF(equipment\Atropin-pen.p3d));
        descriptionShort = $STR_ACE_MAG_ATROPINE_DESC_SHORT;
        descriptionUse = $STR_ACE_MAG_ATROPINE_DESC_USE;
        class ItemInfo: InventoryItem_Base_F
        {
            mass=1;
            type=201;
        };
    };
    class GVAR(epinephrine): ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MAG_EPINEPHRINE_DISPLAY;
        picture = QUOTE(PATHTOF(equipment\img\epinephrine.paa));
        model = QUOTE(PATHTOF(equipment\Epipen.p3d));
        descriptionShort = $STR_ACE_MAG_EPINEPHRINE_DESC_SHORT;
        descriptionUse = $STR_ACE_MAG_EPINEPHRINE_DESC_USE;
        class ItemInfo: InventoryItem_Base_F
        {
            mass=1;
            type=201;
        };
    };
    class GVAR(plasmaIV): ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        displayName = $STR_ACE_MAG_PLASMA_IV;
        picture = QUOTE(PATHTOF(equipment\img\plasma_iv.paa));
        descriptionShort = $STR_ACE_MAG_PLASMA_IV_DESC_SHORT;
        descriptionUse = $STR_ACE_MAG_PLASMA_IV_DESC_USE;
        class ItemInfo: InventoryItem_Base_F
        {
            mass=1;
            type=201;
        };
    };
    class GVAR(plasmaIV_500): GVAR(plasmaIV) {
        displayName = $STR_ACE_MAG_PLASMA_IV_500;
    };
    class GVAR(plasmaIV_250): GVAR(plasmaIV) {
        displayName = $STR_ACE_MAG_PLASMA_IV_250;
    };
    class GVAR(bloodIV): ItemCore    {
        scope = 2;
        value = 1;
        count = 1;
        model = "\A3\Structures_F_EPA\Items\Medical\BloodBag_F.p3d";
        displayName = $STR_ACE_MAG_BLOOD_IV;
        picture = QUOTE(PATHTOF(equipment\img\bloodbag.paa));
        descriptionShort = $STR_ACE_MAG_BLOOD_IV_DESC_SHORT;
        descriptionUse = $STR_ACE_MAG_BLOOD_IV_DESC_USE;
        class ItemInfo: InventoryItem_Base_F
        {
            mass=1;
            type=201;
        };
    };
    class GVAR(bloodIV_500): GVAR(bloodIV) {
        displayName = $STR_ACE_MAG_BLOOD_IV_500;
    };
    class GVAR(bloodIV_500): GVAR(bloodIV) {
        displayName = $STR_ACE_MAG_BLOOD_IV_250;
    };
    class GVAR(salineIV): ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        displayName = $STR_ACE_MAG_SALINE_IV;
        picture = QUOTE(PATHTOF(equipment\img\saline_iv.paa));
        descriptionShort = $STR_ACE_MAG_SALINE_IV_DESC_SHORT;
        descriptionUse = $STR_ACE_MAG_SALINE_IV_DESC_USE;
        class ItemInfo: InventoryItem_Base_F
        {
            mass=1;
            type=201;
        };
    };
    class GVAR(salineIV_500): GVAR(salineIV) {
        displayName = $STR_ACE_MAG_SALINE_IV_500;
    };
    class GVAR(salineIV_250): GVAR(salineIV) {
        displayName = $STR_ACE_MAG_SALINE_IV_250;
    };
    class GVAR(quikclot): ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MAG_QUIKCLOT_DISPLAY;
        picture = QUOTE(PATHTOF(equipment\img\quickclot.paa));
        descriptionShort = $STR_ACE_MAG_QUIKCLOT_DESC_SHORT;
        descriptionUse = $STR_ACE_MAG_QUIKCLOT_DESC_USE;
        class ItemInfo: InventoryItem_Base_F
        {
            mass=1;
            type=201;
        };
    };
    class GVAR(personalAidKit): ItemCore {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = $STR_ACE_MAG_AID_KIT_DISPLAY;
        picture = QUOTE(PATHTOF(equipment\img\personal_aid_kit.paa));
        model = QUOTE(PATHTOF(equipment\Personal-aidkits\MTP.p3d));
        descriptionShort = $STR_ACE_MAG_AID_KIT_DESC_SHORT;
        descriptionUse = $STR_ACE_MAG_AID_KIT_DESC_USE;
        class ItemInfo: InventoryItem_Base_F
        {
            mass=2;
            type=201;
        };
    };
    class GVAR(surgicalKit): ItemCore
    {
        scope=2;
        displayName= $STR_ACE_MAG_SURGICALKIT_DISPLAY;
        model = QUOTE(PATHTOF(equipment\surgical_kit.p3d));
        picture = QUOTE(PATHTOF(equipment\img\surgical_kit.paa));
        descriptionShort = $STR_ACE_MAG_SURGICALKIT_DESC_SHORT;
        descriptionUse = $STR_ACE_MAG_SURGICALKIT_DESC_USE;
        class ItemInfo: InventoryItem_Base_F
        {
            mass= 5;
            type=201;
        };
    };
    class GVAR(bodyBag): ItemCore
    {
        scope=2;
        displayName= $STR_ACE_MAG_BODYBAG_DISPLAY;
        model = QUOTE(PATHTOF(equipment\bodybagItem.p3d));
        picture = QUOTE(PATHTOF(equipment\img\bodybag.paa));
        descriptionShort = $STR_ACE_MAG_BODYBAG_DESC_SHORT;
        descriptionUse = $STR_ACE_MAG_BODYBAG_DESC_USE;
        class ItemInfo: InventoryItem_Base_F
        {
            mass= 15;
            type=201;
        };
    };*/
};
