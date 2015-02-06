
class CfgVehicles {
  #define ARM_LEG_ARMOR_DEFAULT 2
  #define ARM_LEG_ARMOR_BETTER  3
  #define ARM_LEG_ARMOR_CSAT    4

  class Man;
  class CAManBase: Man {
    class HitPoints {
      class HitHead;
      class HitBody;
      // "DEACTIVE" DEFAULT HITPOINTS
      class HitHands {
        armor = 999; //armor = 2;
        explosionShielding = 0; //explosionShielding = 1;
        material = -1;
        minimalHit = 0;
        name = "";
        passThrough = 1;
        radius = 0; //radius = 0.06;
        visual = "injury_hands";
      };
      class HitLegs {
        armor = 999; //armor = 2;
        explosionShielding = 0; //explosionShielding = 1;
        material = -1;
        minimalHit = 0;
        name = "";
        passThrough = 1;
        radius = 0; //radius = 0.08;
        visual = "injury_legs";
      };

      class HitLeftArm {
        armor = ARM_LEG_ARMOR_DEFAULT; //2;
        explosionShielding = 1;
        material = -1;
        minimalHit = 0;
        name = "hand_l";
        passThrough = 1;
        radius = 0.06;
        visual = "injury_hands";
      };
      class HitRightArm: HitLeftArm {
        name = "hand_r";
      };
      class HitLeftLeg {
        armor = ARM_LEG_ARMOR_DEFAULT; //2;
        explosionShielding = 1;
        material = -1;
        minimalHit = 0;
        name = "leg_l";
        passThrough = 1;
        radius = 0.08;
        visual = "injury_legs";
      };
      class HitRightLeg: HitLeftLeg {
        name = "leg_r";
      };
    };
  };

  class SoldierWB: CAManBase {};
  class SoldierEB: CAManBase {};
  class SoldierGB: CAManBase {};

  class B_Soldier_base_F: SoldierWB {};

  class B_Soldier_04_f: B_Soldier_base_F {
    class HitPoints: HitPoints {
      class HitHead: HitHead {};
      class HitBody: HitBody {};
      class HitHands: HitHands {};
      class HitLegs: HitLegs {};

      class HitLeftArm: HitLeftArm {
        armor = ARM_LEG_ARMOR_BETTER;
      };

      class HitRightArm: HitRightArm {
        armor = ARM_LEG_ARMOR_BETTER;
      };

      class HitLeftLeg: HitLeftLeg {
        armor = ARM_LEG_ARMOR_BETTER;
      };

      class HitRightLeg: HitRightLeg {
        armor = ARM_LEG_ARMOR_BETTER;
      };
    };
  };

  class B_Soldier_05_f: B_Soldier_base_F {
    class HitPoints: HitPoints {
      class HitHead: HitHead {};
      class HitBody: HitBody {};
      class HitHands: HitHands {};
      class HitLegs: HitLegs {};

      class HitLeftArm: HitLeftArm {
        armor = ARM_LEG_ARMOR_BETTER;
      };

      class HitRightArm: HitRightArm {
        armor = ARM_LEG_ARMOR_BETTER;
      };

      class HitLeftLeg: HitLeftLeg {
        armor = ARM_LEG_ARMOR_BETTER;
      };

      class HitRightLeg: HitRightLeg {
        armor = ARM_LEG_ARMOR_BETTER;
      };
    };
  };

  class I_Soldier_base_F: SoldierGB {};

  class I_Soldier_03_F: I_Soldier_base_F {
    class HitPoints: HitPoints {
      class HitHead: HitHead {};
      class HitBody: HitBody {};
      class HitHands: HitHands {};
      class HitLegs: HitLegs {};

      class HitLeftArm: HitLeftArm {
        armor = ARM_LEG_ARMOR_BETTER;
      };

      class HitRightArm: HitRightArm {
        armor = ARM_LEG_ARMOR_BETTER;
      };

      class HitLeftLeg: HitLeftLeg {
        armor = ARM_LEG_ARMOR_BETTER;
      };

      class HitRightLeg: HitRightLeg {
        armor = ARM_LEG_ARMOR_BETTER;
      };
    };
  };

  class I_Soldier_04_F: I_Soldier_base_F {
    class HitPoints: HitPoints {
      class HitHead: HitHead {};
      class HitBody: HitBody {};
      class HitHands: HitHands {};
      class HitLegs: HitLegs {};

      class HitLeftArm: HitLeftArm {
        armor = ARM_LEG_ARMOR_BETTER;
      };

      class HitRightArm: HitRightArm {
        armor = ARM_LEG_ARMOR_BETTER;
      };

      class HitLeftLeg: HitLeftLeg {
        armor = ARM_LEG_ARMOR_BETTER;
      };

      class HitRightLeg: HitRightLeg {
        armor = ARM_LEG_ARMOR_BETTER;
      };
    };
  };

  class O_Soldier_base_F: SoldierEB {
    class HitPoints: HitPoints {
      class HitHead: HitHead {};
      class HitBody: HitBody {};
      class HitHands: HitHands {};
      class HitLegs: HitLegs {};

      class HitLeftArm: HitLeftArm {
        armor = ARM_LEG_ARMOR_CSAT;
        passThrough = 0.85;
      };

      class HitRightArm: HitRightArm {
        armor = ARM_LEG_ARMOR_CSAT;
        passThrough = 0.85;
      };

      class HitLeftLeg: HitLeftLeg {
        armor = ARM_LEG_ARMOR_CSAT;
        passThrough = 0.85;
      };

      class HitRightLeg: HitRightLeg {
        armor = ARM_LEG_ARMOR_CSAT;
        passThrough = 0.85;
      };
    };
  };

  class O_Soldier_02_F: O_Soldier_base_F {
    class HitPoints: HitPoints {
      class HitHead: HitHead {};
      class HitBody: HitBody {};
      class HitHands: HitHands {};
      class HitLegs: HitLegs {};

      class HitLeftArm: HitLeftArm {
        armor = ARM_LEG_ARMOR_CSAT;
        passThrough = 0.85;
      };

      class HitRightArm: HitRightArm {
        armor = ARM_LEG_ARMOR_CSAT;
        passThrough = 0.85;
      };

      class HitLeftLeg: HitLeftLeg {
        armor = ARM_LEG_ARMOR_CSAT;
        passThrough = 0.85;
      };

      class HitRightLeg: HitRightLeg {
        armor = ARM_LEG_ARMOR_CSAT;
        passThrough = 0.85;
      };
    };
  };
};
