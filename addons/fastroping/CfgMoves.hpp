class CfgMovesBasic {
      class DefaultDie;
      class ManActions {
          ACE_FastRoping = "ACE_FastRoping";
      };
};

class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        class Crew;
        class ACE_freefallLoop: Crew {
            file = QUOTE(PATHTOF(anim\freefallLoop.rtm));
            interpolateTo[] = {"Unconscious", 1};
            disableWeapons = 1;
            disableWeaponsLong = 1;
            canReload = 0;
            looped = 1;
            speed = 0.204082;
        };
        class ACE_freefallStart: Crew {
            file = QUOTE(PATHTOF(anim\freefallStart.rtm));
            interpolateTo[] = {"Unconscious", 1};
            disableWeapons = 1;
            disableWeaponsLong = 1;
            canReload = 0;
            looped = 0;
            speed = 0.61224502;
        };
        class ACE_slidingLoop: Crew {
            file = QUOTE(PATHTOF(anim\slidingLoop.rtm));
            interpolateTo[] = {"Unconscious", 1};
            disableWeapons = 1;
            disableWeaponsLong = 1;
            canReload = 0;
            looped = 1;
            speed = 0.441176;
        };
    };
};
