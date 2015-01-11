class CfgWeapons {
  class ItemCore;
  class AGM_ItemCore: ItemCore {
    type = 4096;//4;
    detectRange = -1;
    simulation = "ItemMineDetector";
  };

  class Rifle_Base_F;
  class AGM_FakePrimaryWeapon: Rifle_Base_F {
    discreteDistance[] = {};
    discreteDistanceInitIndex = 0;
    displayName = "";
    picture = "";
    model = "";
    magazines[] = {"AGM_FakeMagazine"};
    scope = 2;
  };
};

class CfgMagazines {
  class CA_Magazine;

  class AGM_FakeMagazine: CA_Magazine {
    descriptionShort = "";
    displayName = "";
    displayNameShort = "";
    count = 0;
  };
};