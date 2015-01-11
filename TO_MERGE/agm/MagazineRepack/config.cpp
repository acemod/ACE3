class CfgPatches {
  class AGM_MagazineRepack {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core, AGM_Interaction};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"commy2", "CAA-Picard"};
    authorUrl = "https://github.com/commy2/";
  };
};

class CfgFunctions {
  class AGM_MagazineRepack {
    class AGM_MagazineRepack {
      file = "\AGM_MagazineRepack\functions";
      class magazineRepack;
      class magazineRepackCallback;
      class openSelectMagazineUI;
    };
  };
};

class CfgVehicles {
  class Man;

  class CAManBase: Man {
    class AGM_SelfActions {
      class AGM_RepackMagazines {
        displayName = "$STR_AGM_MagazineRepack_RepackMagazines";
        condition = "true";
        statement = "call AGM_MagazineRepack_fnc_magazineRepack";
        showDisabled = 0;
        priority = -2;
        icon = "AGM_MagazineRepack\UI\repack_ca.paa";
        hotkey = "R";
        enableInside = 1;
      };
    };
  };
};

class AGM_Parameters_Numeric {
  AGM_MagazineRepack_TimePerAmmo = 1.5;
  AGM_MagazineRepack_TimePerMagazine = 2.0;
};
