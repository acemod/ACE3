
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
};
