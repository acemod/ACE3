class CfgVehicles {
  class Man;
  class CAManBase: Man {
    class ACE_SelfActions {
      class ACE_Equipment {
        class GVAR(CutFence) {
          displayName = "$STR_ACE_logistics_wirecutter_CutFence";
          condition = QUOTE([_player] call FUNC(canCutFence));
          statement = QUOTE([_player] call FUNC(cutDownFence));
          exceptions[] = {};
          showDisabled = 1;
          priority = 0;
          icon = PATHTOF(UI\wirecutter_ca.paa);
          hotkey = "C";
        };
      };
    };
  };
};