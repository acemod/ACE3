
class Man;
class CAManBase: Man {
  class HitPoints {
    class HitHead {
      /*armor = 1;
      passThrough = 1;
      radius = 0.1;
      explosionShielding = 0.5;
      minimalHit = 0;*/
    };

    class HitBody {
      /*armor = 1;
      passThrough = 1;
      radius = 0.15;
      explosionShielding = 10;
      minimalHit = 0;*/
    };

    class HitHands {
      /*armor = 1;
      passThrough = 1;
      radius = 0.08;
      explosionShielding = 1;
      minimalHit = 0;*/
    };

    class HitLegs {
      /*armor = 1;
      passThrough = 1;
      radius = 0.1;
      explosionShielding = 1;
      minimalHit = 0;*/
    };
  };

  /*armor = 2;
  armorStructural = 5;*/
};

class Civilian: CAManBase {
  /*class HitPoints: HitPoints {
    class HitHead: HitHead {
      armor = 1;
    };

    class HitBody: HitBody {
      armor = 2;
    };

    class HitHands: HitHands {
      armor = 2;
    };

    class HitLegs: HitLegs {
      armor = 2;
    };
  };*/
};

/*class Civilian_F: Civilian {};
class C_man_1: Civilian_F {};*/

class SoldierWB: CAManBase {};
class SoldierEB: CAManBase {};
class SoldierGB: CAManBase {};

class B_Soldier_base_F: SoldierWB {
  /*class HitPoints: HitPoints {
    class HitHead: HitHead {
      armor = 1;
    };

    class HitBody: HitBody {
      armor = 2;
    };

    class HitHands: HitHands {
      armor = 2;
    };

    class HitLegs: HitLegs {
      armor = 2;
    };
  };

  armor = 2;
  armorStructural = 5;*/
};

class B_Soldier_02_f: B_Soldier_base_F {    // t-shirt
  /*class HitPoints: HitPoints {
    class HitHead: HitHead {
      armor = 1;
    };

    class HitBody: HitBody {
      armor = 1;
    };

    class HitHands: HitHands {
      armor = 1;
    };

    class HitLegs: HitLegs {
      armor = 2;
    };
  };*/

  armorStructural = 5; //7;
};

class B_Soldier_03_f: B_Soldier_base_F {    // sleeves
  /*class HitPoints: HitPoints {
    class HitHead: HitHead {
      armor = 1;
    };

    class HitBody: HitBody {
      armor = 2;
    };

    class HitHands: HitHands {
      armor = 1;
    };

    class HitLegs: HitLegs {
      armor = 2;
    };
  };*/

  armorStructural = 5; //7;
};

class B_Soldier_04_f: B_Soldier_base_F {    // heli pilot
  class HitPoints: HitPoints {
    class HitHead: HitHead {
      /*armor = 1;
      passThrough = 1;
      explosionShielding = 0.5;*/
    };

    class HitBody: HitBody {
      /*armor = 2;*/
      passThrough = 1; //0.5;
      /*explosionShielding = 2.4;*/
    };

    class HitHands: HitHands {
      armor = 2; //8;
      passThrough = 1; //0.5;
      /*explosionShielding = 1.2;*/
    };

    class HitLegs: HitLegs {
      armor = 2; //8;
      passThrough = 1; //0.5;
      /*explosionShielding = 1.2;*/
    };
  };
};

class B_Soldier_05_f: B_Soldier_base_F {    // cas pilot
  armorStructural = 5; //3;

  class HitPoints: HitPoints {
    class HitHead: HitHead {
      /*armor = 1;
      passThrough = 1;
      explosionShielding = 0.5;*/
    };

    class HitBody: HitBody {
      armor = 3; //2;
      passThrough = 1; //0.5;
      /*explosionShielding = 2.4;*/
    };

    class HitHands: HitHands {
      armor = 3; //8;
      /*passThrough = 1;
      explosionShielding = 1.2;*/
    };

    class HitLegs: HitLegs {
      armor = 3; //8;
      /*passThrough = 1;
      explosionShielding = 1.2;*/
    };
  };
};

class B_Soldier_diver_base_F: B_Soldier_base_F {
  /*class HitPoints: HitPoints {
    class HitHead: HitHead {
      armor = 2;
    };

    class HitBody: HitBody {
      armor = 2;
    };

    class HitHands: HitHands {
      armor = 2;
    };

    class HitLegs: HitLegs {
      armor = 2;
    };
  };*/
};

// these appear to be broken, remnants from A2?
/*class C_man_p_fugitive_F: C_man_1 {
  class HitPoints: HitPoints {
    class HitBody: HitBody {
      armor = "0.3*10";
    };

    class HitLegs: HitLegs {
      armor = "0.3*5";
    };
  };
};

class C_man_w_worker_F: C_man_1 {
  class HitPoints: HitPoints {
    class HitBody: HitBody {
      armor = "0.6*10";
    };

    class HitHands: HitHands {
      armor = "0.5*5";
    };

    class HitLegs: HitLegs {
      armor = "0.5*5";
    };
  };
};

class C_man_hunter_1_F: C_man_1 {
  class HitPoints: HitPoints {
    class HitBody: HitBody {
      armor = "0.6*10";
    };

    class HitHands: HitHands {
      armor = "0.5*5";
    };

    class HitLegs: HitLegs {
      armor = "0.5*5";
    };
  };
};

class C_man_p_shorts_1_F: C_man_1 {
  class HitPoints: HitPoints {
    class HitLegs: HitLegs {
      armor = "0.3*5";
    };
  };
};

class C_man_pilot_F: C_man_1 {
  class HitPoints: HitPoints {
    class HitBody: HitBody {
      armor = "0.6*10";
    };

    class HitHands: HitHands {
      armor = "0.5*5";
    };

    class HitLegs: HitLegs {
      armor = "0.5*5";
    };
  };
};*/

class I_Soldier_base_F: SoldierGB {
  /*class HitPoints: HitPoints {
    class HitHead: HitHead {
      armor = 1;
    };

    class HitBody: HitBody {
      armor = 2;
    };

    class HitHands: HitHands {
      armor = 2;
    };

    class HitLegs: HitLegs {
      armor = 2;
    };
  };*/

  /*armor = 2;*/
  armorStructural = 5; //7;
};

class I_Soldier_02_F: I_Soldier_base_F {  // sleeves
  /*class HitPoints: HitPoints {
    class HitHead: HitHead {
      armor = 1;
    };

    class HitBody: HitBody {
      armor = 2;
    };

    class HitHands: HitHands {
      armor = 1;
    };

    class HitLegs: HitLegs {
      armor = 2;
    };
  };*/
};

class I_Soldier_03_F: I_Soldier_base_F {  // heli pilot
  /*armorStructural = 5;*/

  class HitPoints: HitPoints {
    class HitHead: HitHead {
      /*armor = 1;
      passThrough = 1;
      explosionShielding = 0.5;*/
    };

    class HitBody: HitBody {
      /*armor = 2;*/
      passThrough = 1; //0.5;
      /*explosionShielding = 2.4;*/
    };

    class HitHands: HitHands {
      armor = 2; //8;
      passThrough = 1; //0.5;
      /*explosionShielding = 1.2;*/
    };

    class HitLegs: HitLegs {
      armor = 2; //8;
      passThrough = 1; //0.5;
      /*explosionShielding = 1.2;*/
    };
  };
};

class I_Soldier_04_F: I_Soldier_base_F {  // cas pilot
  armorStructural = 5; //3;

  class HitPoints: HitPoints {
    class HitHead: HitHead {
      /*armor = 1;
      passThrough = 1;
      explosionShielding = 0.5;*/
    };

    class HitBody: HitBody {
      armor = 3; //2;
      passThrough = 1; //0.5;
      /*explosionShielding = 2.4;*/
    };

    class HitHands: HitHands {
      armor = 3; //8;
      /*passThrough = 1;
      explosionShielding = 1.2;*/
    };

    class HitLegs: HitLegs {
      armor = 3; //8;
      /*passThrough = 1;
      explosionShielding = 1.2;*/
    };
  };
};

class I_Soldier_diver_base_F: I_Soldier_base_F {
  /*class HitPoints: HitPoints {
    class HitHead: HitHead {
      armor = 2;
    };

    class HitBody: HitBody {
      armor = 2;
    };

    class HitHands: HitHands {
      armor = 2;
    };

    class HitLegs: HitLegs {
      armor = 2;
    };
  };*/
};

class O_Soldier_base_F: SoldierEB {
  class HitPoints: HitPoints {
    class HitHead: HitHead {
      /*armor = 1;
      passThrough = 1;
      explosionShielding = 0.5;*/
    };

    class HitBody: HitBody {
      armor = 4; //6;
      passThrough = 0.85; //0.5;
      /*explosionShielding = 1.5;*/
    };

    class HitHands: HitHands {
      armor = 4; //8;
      passThrough = 0.85; //0.5;
      /*explosionShielding = 0.8;*/
    };

    class HitLegs: HitLegs {
      armor = 4; //8;
      passThrough = 0.85; //0.5;
      /*explosionShielding = 0.8;*/
    };
  };

  /*armor = 2;
  armorStructural = 5;*/
};

class O_officer_F: O_Soldier_base_F {
  class HitPoints: HitPoints {
    class HitHead: HitHead {
      /*armor = 1;
      passThrough = 1;
      explosionShielding = 0.5;*/
    };

    class HitBody: HitBody {
      /*armor = 2;
      passThrough = 1;
      explosionShielding = 10;*/
    };

    class HitHands: HitHands {
      /*armor = 2;
      passThrough = 1;
      explosionShielding = 1;*/
    };

    class HitLegs: HitLegs {
      armor = 2; //8;
      passThrough = 1; //0.5;
      /*explosionShielding = 1;*/
    };
  };
};

class O_Soldier_02_F: O_Soldier_base_F {  // crew ?
  armorStructural = 5; //3;

  class HitPoints: HitPoints {
    class HitHead: HitHead {
      /*armor = 1;
      passThrough = 1;
      explosionShielding = 0.5;*/
    };

    class HitBody: HitBody {
      armor = 4; //6;
      passThrough = 0.85; //0.5;
      /*explosionShielding = 1.5;*/
    };

    class HitHands: HitHands {
      armor = 4; //8;
      passThrough = 0.85; //1;
      /*explosionShielding = 0.8;*/
    };

    class HitLegs: HitLegs {
      armor = 4; //8;
      passThrough = 0.85; //1;
      /*explosionShielding = 0.8;*/
    };
  };
};

class O_Soldier_diver_base_F: O_Soldier_base_F {
  /*class HitPoints: HitPoints {
    class HitHead: HitHead {
      armor = 2;
    };

    class HitBody: HitBody {
      armor = 2;
    };

    class HitHands: HitHands {
      armor = 2;
    };

    class HitLegs: HitLegs {
      armor = 2;
    };
  };*/
};

class O_Soldier_VR_F: O_Soldier_base_F {
  /*class HitPoints: HitPoints {
    class HitHead: HitHead {
      armor = 1;
      passThrough = 1;
      explosionShielding = 0.5;
    };

    class HitBody: HitBody {
      armor = 2;
      passThrough = 1;
      explosionShielding = 10;
    };

    class HitHands: HitHands {
      armor = 2;
      passThrough = 1;
      explosionShielding = 1;
    };

    class HitLegs: HitLegs {
      armor = 2;
      passThrough = 1;
      explosionShielding = 1;
    };
  };*/
};

class O_Protagonist_VR_F: O_Soldier_base_F {
  /*class HitPoints: HitPoints {
    class HitHead: HitHead {
      armor = 1;
      passThrough = 1;
      explosionShielding = 0.5;
    };

    class HitBody: HitBody {
      armor = 2;
      passThrough = 1;
      explosionShielding = 10;
    };

    class HitHands: HitHands {
      armor = 2;
      passThrough = 1;
      explosionShielding = 1;
    };

    class HitLegs: HitLegs {
      armor = 2;
      passThrough = 1;
      explosionShielding = 1;
    };
  };*/
};
