
class CfgVehicles {
  class Man;
  class CAManBase: Man {
    class ACE_SelfActions {
      class ACE_RepackMagazines {
        displayName = "$STR_ACE_MagazineRepack_RepackMagazines";
        condition = QUOTE(true);
        statement = QUOTE([_player] call FUNC(magazineRepack));
        showDisabled = 0;
        priority = -2;
        icon = PATHTOF(UI\repack_ca.paa);
        hotkey = "R";
        enableInside = 1;
      };
    };
  };
};
