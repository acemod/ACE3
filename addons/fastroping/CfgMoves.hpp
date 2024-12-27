class CfgMovesBasic {
      class DefaultDie;
      class ManActions {
          ACE_FastRoping = "ACE_FastRoping";
      };
};

class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        class Crew;
        class ACE_FastRoping: Crew {
            file = QPATHTOF(anim\fastroping.rtm);
            interpolateTo[] = {"Unconscious", 1};
            disableWeapons = 1;
            disableWeaponsLong = 1;
            canReload = 0;
        };
    };
};
