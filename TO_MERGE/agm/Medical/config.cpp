// PATCH CONFIG
class CfgPatches {
  class AGM_Medical {
    units[] = {"AGM_Box_Medical"};
    weapons[] = {"AGM_Bandage", "AGM_Morphine", "AGM_Epipen", "AGM_Bloodbag"};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core, AGM_Interaction};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi"};
    authorUrl = "https://github.com/KoffeinFlummi/";
  };
};

class CfgFunctions {
  class AGM_Medical {
    class AGM_Medical {
      file = "AGM_Medical\functions";
      class aiCanTreat;
      class aiInitTask;
      class aiTreat;
      class checkDamage;
      class diagnose;
      class displayText;
      class handleDamage;
      class init;
      class isDiagnosed;
      class isInMedicalVehicle;
      class itemCheck;
      class knockOut;
      class loadIntoVehicle;
      class module;
      class overdose;
      class release;
      class scream;
      class setDamage;
      class setHitPointDamage;
      class takeItem;
      class transport;
      class treat;
      class treatmentCallback;
      class unloadPatients;
      class wakeUp;
    };
  };
};

class Extended_Init_EventHandlers {
  class CAManBase {
    class AGM_Medical {
      init = "(_this select 0) addEventHandler ['HandleDamage', {_this call AGM_Medical_fnc_handleDamage}]; _this call AGM_Medical_fnc_init";
    };
  };
};
class Extended_Respawn_EventHandlers {
  class CAManBase {
    class AGM_Medical {
      respawn = "_this call AGM_Medical_fnc_init";
    };
  };
};
class Extended_Hit_EventHandlers {
  class CAManBase {
    class AGM_Medical {
      hit = "if (alive (_this select 0) and !((_this select 0) getVariable ['AGM_isUnconscious', False]) and !([(_this select 0)] call AGM_Core_fnc_isPlayer)) then {[(_this select 0)] call AGM_Medical_fnc_scream;};";
    };
  };
};
class Extended_Take_EventHandlers {
  class CAManBase {
    class AGM_Medical {
      take = "[(_this select 0)] call AGM_Medical_fnc_itemCheck;";
    };
  };
};
class Extended_GetOut_EventHandlers {
  class All {
    class AGM_Medical_LeaveVehicle {
      getOut = "if (local (_this select 2) && {(_this select 2) getVariable ['AGM_isUnconscious', false]}) then {[_this select 2, 'unconscious', 2, true] call AGM_Core_fnc_doAnimation;}";
    };
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_Medical {
    init = "call compile preprocessFileLineNumbers '\AGM_Medical\init.sqf'";
    clientInit = "call compile preprocessFileLineNumbers '\AGM_Medical\clientInit.sqf'";
  };
};

class AGM_Core_canInteractConditions {
  class AGM_Medical_canTreat {
    condition = "_player getVariable ['AGM_canTreat', true]";
  };
  class AGM_Medical_isConscious {
    condition = "!(_player getVariable ['AGM_isUnconscious', false])";
  };
  class AGM_Medical_isNotOverdosing {
    condition = "!(_player getVariable ['AGM_isOverdosing', false])";
  };
};

class AGM_Core_Options {
  class keepMedicalMenuOpen {
    displayName = "$STR_AGM_Medical_KeepMenuOpen";
    default = 0;
  };
  class alternativePainEffect {
    displayName = "$STR_AGM_Medical_AlternativePainEffect";
    default = 0;
  };
};

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

    class AGM_Actions {
      class AGM_Medical {
        displayName = "$STR_AGM_Medical_Treat";
        distance = 4;
        condition = "_target getVariable ['AGM_isTreatable', true]";
        statement = "";
        showDisabled = 1;
        enableInside = 1;
        icon = "AGM_Medical\UI\Medical_Icon_ca.paa";
        priority = 6;
        subMenu[] = {"AGM_Medical", 0};
        hotkey = "T";

        class AGM_Diagnose {
          displayName = "$STR_AGM_Medical_Diagnose";
          condition = "_target getVariable ['AGM_isTreatable', true]";
          statement = "[_player, _target, 'diagnose'] call AGM_Medical_fnc_treat;";
          icon = "AGM_Medical\UI\diagnose_ca.paa";
          showDisabled = 1;
          enableInside = 1;
          priority = 1;
        };
        class AGM_Morphine {
          displayName = "$STR_AGM_Medical_Inject_Morphine";
          condition = "([_target] call AGM_Medical_fnc_isDiagnosed) and (_target getVariable ['AGM_isTreatable', true]) and alive _target and 'AGM_Morphine' in itemsWithMagazines _player";
          statement = "[_player, _target, 'morphine'] call AGM_Medical_fnc_treat;";
          showDisabled = 1;
          enableInside = 1;
          icon = "AGM_Medical\UI\agm_morphine_ca.paa";
          priority = 0.9;
        };
        class AGM_Epipen {
          displayName = "$STR_AGM_Medical_Inject_Epinephrine";
          condition = "([_target] call AGM_Medical_fnc_isDiagnosed) and (_target getVariable ['AGM_isTreatable', true]) and alive _target and 'AGM_Epipen' in itemsWithMagazines _player and _target getVariable ['AGM_isUnconscious', False]";
          statement = "[_player, _target, 'epipen'] call AGM_Medical_fnc_treat;";
          showDisabled = 1;
          enableInside = 1;
          priority = 0.8;
          icon = "AGM_Medical\UI\agm_epipen_ca.paa";
        };
        class AGM_BloodBag {
          displayName = "$STR_AGM_Medical_Transfuse_Blood";
          condition = "([_target] call AGM_Medical_fnc_isDiagnosed) and (_target getVariable ['AGM_isTreatable', true]) and alive _target and 'AGM_Bloodbag' in itemsWithMagazines _player";
          statement = "[_player, _target, 'bloodbag'] call AGM_Medical_fnc_treat;";
          showDisabled = 1;
          enableInside = 1;
          priority = 0.7;
          icon = "AGM_Medical\UI\agm_bloodbag_ca.paa";
        };
        class AGM_Bandage {
          displayName = "$STR_AGM_Medical_Bandage";
          condition = "AGM_Medical_SingleBandage and ([_target] call AGM_Medical_fnc_isDiagnosed) and (_target getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player and alive _target";
          statement = "[_player, _target, 'bandage', 'All'] call AGM_Medical_fnc_treat;";
          priority = 0.6;
          conditionShow = "AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\body.paa";
        };
        class AGM_Bandage_Head {
          displayName = "$STR_AGM_Medical_Bandage_HitHead";
          condition = "!AGM_Medical_SingleBandage and ([_target] call AGM_Medical_fnc_isDiagnosed) and (_target getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player and alive _target";
          statement = "[_player, _target, 'bandage', 'HitHead'] call AGM_Medical_fnc_treat;";
          priority = 0.6;
          conditionShow = "!AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\head.paa";
        };
        class AGM_Bandage_Body {
          displayName = "$STR_AGM_Medical_Bandage_HitBody";
          condition = "!AGM_Medical_SingleBandage and ([_target] call AGM_Medical_fnc_isDiagnosed) and (_target getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player and alive _target";
          statement = "[_player, _target, 'bandage', 'HitBody'] call AGM_Medical_fnc_treat;";
          priority = 0.5;
          conditionShow = "!AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\body.paa";
        };
        class AGM_Bandage_LeftArm {
          displayName = "$STR_AGM_Medical_Bandage_HitLeftArm";
          condition = "!AGM_Medical_SingleBandage and ([_target] call AGM_Medical_fnc_isDiagnosed) and (_target getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player and alive _target";
          statement = "[_player, _target, 'bandage', 'HitLeftArm'] call AGM_Medical_fnc_treat;";
          priority = 0.4;
          conditionShow = "!AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\arm_left.paa";
        };
        class AGM_Bandage_RightArm {
          displayName = "$STR_AGM_Medical_Bandage_HitRightArm";
          condition = "!AGM_Medical_SingleBandage and ([_target] call AGM_Medical_fnc_isDiagnosed) and (_target getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player and alive _target";
          statement = "[_player, _target, 'bandage', 'HitRightArm'] call AGM_Medical_fnc_treat;";
          priority = 0.3;
          conditionShow = "!AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\arm_right.paa";
        };
        class AGM_Bandage_LeftLeg {
          displayName = "$STR_AGM_Medical_Bandage_HitLeftLeg";
          condition = "!AGM_Medical_SingleBandage and ([_target] call AGM_Medical_fnc_isDiagnosed) and (_target getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player and alive _target";
          statement = "[_player, _target, 'bandage', 'HitLeftLeg'] call AGM_Medical_fnc_treat;";
          priority = 0.2;
          conditionShow = "!AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\leg_left.paa";
        };
        class AGM_Bandage_RightLeg {
          displayName = "$STR_AGM_Medical_Bandage_HitRightLeg";
          condition = "!AGM_Medical_SingleBandage and ([_target] call AGM_Medical_fnc_isDiagnosed) and (_target getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player and alive _target";
          statement = "[_player, _target, 'bandage', 'HitRightLeg'] call AGM_Medical_fnc_treat;";
          priority = 0.15;
          conditionShow = "!AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\leg_right.paa";
        };
      };

      class AGM_Medical_Drag {
        displayName = "$STR_AGM_Medical_Drag";
        distance = 4;
        condition = "vehicle _player == _player and vehicle _target == _target and alive _target and _target getVariable ['AGM_isTreatable', true] and _target getVariable ['AGM_isUnconscious', False] and isNull (_player getVariable ['AGM_Transporting', objNull])";
        statement = "[_player, _target, 'drag'] call AGM_Medical_fnc_transport;";
        priority = 2.1;
        icon = "AGM_Medical\UI\Medical_Icon_ca.paa";
        hotkey = "R";
      };
      class AGM_Medical_Carry {
        displayName = "$STR_AGM_Medical_Carry";
        distance = 4;
        condition = "vehicle _player == _player and vehicle _target == _target and alive _target and _target getVariable ['AGM_isTreatable', true] and _target getVariable ['AGM_isUnconscious', False] and isNull (_player getVariable ['AGM_Transporting', objNull])";
        statement = "[_player, _target, 'carry'] call AGM_Medical_fnc_transport;";
        priority = 2.0;
        icon = "AGM_Medical\UI\Medical_Icon_ca.paa";
        hotkey = "C";
      };
    };

    class AGM_SelfActions {
      class AGM_Medical {
        displayName = "$STR_AGM_Medical_Treat_Self";
        condition = "_player getVariable ['AGM_isTreatable', true]";
        statement = "";
        showDisabled = 1;
        enableInside = 1;
        priority = 6;
        icon = "AGM_Medical\UI\Medical_Icon_ca.paa";
        subMenu[] = {"AGM_Medical", 1};
        hotkey = "T";

        class AGM_Diagnose {
          displayName = "$STR_AGM_Medical_Diagnose";
          condition = "_player getVariable ['AGM_isTreatable', true]";
          statement = "[_player, _player, 'diagnose'] call AGM_Medical_fnc_treat;";
          priority = 1;
          showDisabled = 1;
          enableInside = 1;
          icon = "AGM_Medical\UI\diagnose_ca.paa";
        };
        class AGM_Morphine {
          displayName = "$STR_AGM_Medical_Inject_Morphine";
          condition = "(_player getVariable ['AGM_isTreatable', true]) and 'AGM_Morphine' in itemsWithMagazines _player";
          statement = "[_player, _player, 'morphine'] call AGM_Medical_fnc_treat;";
          priority = 0.9;
          showDisabled = 1;
          enableInside = 1;
          icon = "AGM_Medical\UI\agm_morphine_ca.paa";
        };

        class AGM_Bandage {
          displayName = "$STR_AGM_Medical_Bandage";
          condition = "AGM_Medical_SingleBandage and (_player getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player";
          statement = "[_player, _player, 'bandage', 'All'] call AGM_Medical_fnc_treat;";
          priority = 0.6;
          conditionShow = "AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\body.paa";
        };
        class AGM_Bandage_Head {
          displayName = "$STR_AGM_Medical_Bandage_HitHead";
          condition = "!AGM_Medical_SingleBandage and (_player getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player";
          statement = "[_player, _player, 'bandage', 'HitHead'] call AGM_Medical_fnc_treat;";
          priority = 0.6;
          conditionShow = "!AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\head.paa";
        };
        class AGM_Bandage_Body {
          displayName = "$STR_AGM_Medical_Bandage_HitBody";
          condition = "!AGM_Medical_SingleBandage and (_player getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player";
          statement = "[_player, _player, 'bandage', 'HitBody'] call AGM_Medical_fnc_treat;";
          priority = 0.5;
          conditionShow = "!AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\body.paa";
        };
        class AGM_Bandage_LeftArm {
          displayName = "$STR_AGM_Medical_Bandage_HitLeftArm";
          condition = "!AGM_Medical_SingleBandage and (_player getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player";
          statement = "[_player, _player, 'bandage', 'HitLeftArm'] call AGM_Medical_fnc_treat;";
          priority = 0.4;
          conditionShow = "!AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\arm_left.paa";
        };
        class AGM_Bandage_RightArm {
          displayName = "$STR_AGM_Medical_Bandage_HitRightArm";
          condition = "!AGM_Medical_SingleBandage and (_player getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player";
          statement = "[_player, _player, 'bandage', 'HitRightArm'] call AGM_Medical_fnc_treat;";
          priority = 0.3;
          conditionShow = "!AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\arm_right.paa";
        };
        class AGM_Bandage_LeftLeg {
          displayName = "$STR_AGM_Medical_Bandage_HitLeftLeg";
          condition = "!AGM_Medical_SingleBandage and (_player getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player";
          statement = "[_player, _player, 'bandage', 'HitLeftLeg'] call AGM_Medical_fnc_treat;";
          priority = 0.2;
          conditionShow = "!AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\leg_left.paa";
        };
        class AGM_Bandage_RightLeg {
          displayName = "$STR_AGM_Medical_Bandage_HitRightLeg";
          condition = "!AGM_Medical_SingleBandage and (_player getVariable ['AGM_isTreatable', true]) and 'AGM_Bandage' in itemsWithMagazines _player";
          statement = "[_player, _player, 'bandage', 'HitRightLeg'] call AGM_Medical_fnc_treat;";
          priority = 0.15;
          conditionShow = "!AGM_Medical_SingleBandage";
          enableInside = 1;
          icon = "AGM_Medical\UI\parts\leg_right.paa";
        };
      };

      class AGM_Release {
        displayName = "$STR_AGM_Medical_Release";
        distance = 4;
        condition = "vehicle _player == _player and ((_player getVariable ['AGM_Transporting', objNull]) isKindOf 'Man')";
        statement = "[_player, (_player getVariable ['AGM_Transporting', objNull])] call AGM_Medical_fnc_release;";
        exceptions[] = {"AGM_Medical_canTreat"};
        icon = "AGM_Medical\UI\Medical_Icon_ca.paa";
        hotkey = "R";
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

  class LandVehicle;
  class Car: LandVehicle {
    class AGM_Actions {
      class AGM_Unload {
        displayName = "$STR_AGM_Medical_Unload";
        distance = 4;
        condition = "return = false; {if (_x getVariable ['AGM_isUnconscious', False]) exitWith {return = true;};} foreach (crew _target); return and vehicle _player == _player and !(_target isKindOf 'Man')";
        statement = "[_player, _target] call AGM_Medical_fnc_unloadPatients;";
      };
      class AGM_Load {
        displayName = "$STR_AGM_Medical_Load";
        distance = 4;
        condition = "!(_target isKindOf 'Man') and vehicle _player == _player and (_player getVariable ['AGM_Transporting', objNull]) isKindOf 'Man' and _target emptyPositions 'cargo' > 0";
        statement = "[_player, _target] call AGM_Medical_fnc_loadIntoVehicle;";
        exceptions[] = {"AGM_Medical_canTreat"};
      };
    };
  };
  class Tank: LandVehicle {
    class AGM_Actions {
      class AGM_Unload {
        displayName = "$STR_AGM_Medical_Unload";
        distance = 4;
        condition = "return = false; {if (_x getVariable ['AGM_isUnconscious', False]) exitWith {return = true;};} foreach (crew _target); return and vehicle _player == _player and !(_target isKindOf 'Man')";
        statement = "[_player, _target] call AGM_Medical_fnc_unloadPatients;";
      };
      class AGM_Load {
        displayName = "$STR_AGM_Medical_Load";
        distance = 4;
        condition = "!(_target isKindOf 'Man') and vehicle _player == _player and (_player getVariable ['AGM_Transporting', objNull]) isKindOf 'Man' and _target emptyPositions 'cargo' > 0";
        statement = "[_player, _target] call AGM_Medical_fnc_loadIntoVehicle;";
        exceptions[] = {"AGM_Medical_canTreat"};
      };
    };
  };
  class Air;
  class Helicopter: Air {
    class AGM_Actions {
      class AGM_Unload {
        displayName = "$STR_AGM_Medical_Unload";
        distance = 4;
        condition = "return = false; {if (_x getVariable ['AGM_isUnconscious', False]) exitWith {return = true;};} foreach (crew _target); return and vehicle _player == _player and !(_target isKindOf 'Man')";
        statement = "[_player, _target] call AGM_Medical_fnc_unloadPatients;";
      };
      class AGM_Load {
        displayName = "$STR_AGM_Medical_Load";
        distance = 4;
        condition = "!(_target isKindOf 'Man') and vehicle _player == _player and (_player getVariable ['AGM_Transporting', objNull]) isKindOf 'Man' and _target emptyPositions 'cargo' > 0";
        statement = "[_player, _target] call AGM_Medical_fnc_loadIntoVehicle;";
        exceptions[] = {"AGM_Medical_canTreat"};
      };
    };
  };
  class Ship;
  class Ship_F: Ship {
    class AGM_Actions {
      class AGM_Unload {
        displayName = "$STR_AGM_Medical_Unload";
        distance = 4;
        condition = "return = false; {if (_x getVariable ['AGM_isUnconscious', False]) exitWith {return = true;};} foreach (crew _target); return and vehicle _player == _player and !(_target isKindOf 'Man')";
        statement = "[_player, _target] call AGM_Medical_fnc_unloadPatients;";
      };
      class AGM_Load {
        displayName = "$STR_AGM_Medical_Load";
        distance = 4;
        condition = "!(_target isKindOf 'Man') and vehicle _player == _player and (_player getVariable ['AGM_Transporting', objNull]) isKindOf 'Man' and _target emptyPositions 'cargo' > 0";
        statement = "[_player, _target] call AGM_Medical_fnc_loadIntoVehicle;";
        exceptions[] = {"AGM_Medical_canTreat"};
      };
    };
  };

  class Box_NATO_Support_F;
  class AGM_Box_Medical: Box_NATO_Support_F {
    author = "$STR_AGM_Core_AGMTeam";
    displayName = "$STR_AGM_Medical_MedicalSupplies";
    transportmaxmagazines = 128;
    transportmaxbackpacks = 0;
    maximumload = 2000;

    class TransportMagazines {};
    class TransportWeapons {};
    class TransportItems {
      class _xx_AGM_Bandage {
        count = 64;
        name = "AGM_Bandage";
      };
      /*class _xx_AGM_Bandage2 {
        count = 4;
        name = "AGM_Bandage";
      };*/
      class _xx_AGM_Morphine {
        count = 24;
        name = "AGM_Morphine";
      };
      class _xx_AGM_Epipen {
        count = 24;
        name = "AGM_Epipen";
      };
      class _xx_AGM_Bloodbag {
        count = 16;
        name = "AGM_Bloodbag";
      };
    };
  };

  class Module_F;
  class AGM_ModuleMedical: Module_F {
    author = "$STR_AGM_Core_AGMTeam";
    category = "AGM";
    displayName = "Medical System";
    function = "AGM_Medical_fnc_module";
    scope = 2;
    isGlobal = 1;
    icon = "\AGM_Medical\UI\IconMedical_ca.paa";
    class Arguments {
      class CoefDamage {
        displayName = "Damage Coef.";
        description = "Multiplier for the amount of damage received. Default: 1 (obviously)";
        typeName = "NUMBER";
        defaultValue = 1;
      };
      class CoefBleeding {
        displayName = "Bleeding Speed Coef.";
        description = "Multiplier for the rate of bleeding. Default: 1 (obviously)";
        typeName = "NUMBER";
        defaultValue = 1;
      };
      class CoefPain {
        displayName = "Pain Effect Coef.";
        description = "Multiplier for the intensity of the pain PP effect. Default: 1 (obviously)";
        typeName = "NUMBER";
        defaultValue = 1;
      };
      class CoefNonMedic {
        displayName = "Non-Medic Time Coef.";
        description = "Multiplier for the treatment time of an untrained person compared to that of a trained medic. Default: 2";
        typeName = "NUMBER";
        defaultValue = 2;
      };
      class MaxUnconsciousnessTime {
        displayName = "Max Unconsc. Time";
        description = "Maximum time (in seconds) for a unit to be unconscious before dying. -1 disables this.";
        typeName = "NUMBER";
        defaultValue = -1;
      };
      class AllowNonmedics {
        displayName = "Allow non-medics?";
        description = "Allow non-medics to use epipens and bloodbags? Default: No";
        typeName = "BOOL";
        class values {
          class Yes {
            name = "Yes";
            value = 1;
          };
          class No {
            default = 1;
            name = "No";
            value = 0;
          };
        };
      };
      class RequireDiagnosis {
        displayName = "Require diagnosis?";
        description = "Require an unconscious patient to be diagnosed before allowing treatment? Default: No";
        typeName = "BOOL";
        class values {
          class Yes {
            name = "Yes";
            value = 1;
          };
          class No {
            default = 1;
            name = "No";
            value = 0;
          };
        };
      };
      class PreventInstaDeath {
        displayName = "Prevent instant death?";
        description = "Prevent instant death and always put players in unconscious state instead? Default: No";
        typeName = "BOOL";
        class values {
          class Yes {
            name = "Yes";
            value = 1;
          };
          class No {
            default = 1;
            name = "No";
            value = 0;
          };
        };
      };
      class PreventDeathWhileUnconscious {
        displayName = "Prevent death while unconscious?";
        description = "Make unconscious units invulnerable? Default: No";
        typeName = "BOOL";
        class values {
          class Yes {
            name = "Yes";
            value = 1;
          };
          class No {
            default = 1;
            name = "No";
            value = 0;
          };
        };
      };
      class SingleBandage {
        displayName = "Single Bandage";
        description = "Use one bandage to heal the entire body? Default: No";
        typeName = "BOOL";
        class values {
          class Yes {
            name = "Yes";
            value = 1;
          };
          class No {
            default = 1;
            name = "No";
            value = 0;
          };
        };
      };
      class AllowChatWhileUnconscious {
        displayName = "Unconscious can chat?";
        description = "Allow all players to use chat while unconcious? Admin can always use the chat regardless. Default: No";
        typeName = "BOOL";
        class values {
          class Yes {
            name = "Yes";
            value = 1;
          };
          class No {
            default = 1;
            name = "No";
            value = 0;
          };
        };
      };
      class EnableOverdosing {
        displayName = "Enable Overdosing?";
        description = "Enable morphine overdoses? Default: Yes";
        typeName = "BOOL";
        class values {
          class Yes {
            default = 1;
            name = "Yes";
            value = 1;
          };
          class No {
            name = "No";
            value = 0;
          };
        };
      };
      class RequireMEDEVAC {
        displayName = "Require MEDEVAC?";
        description = "Only allow Epipens within synchronized triggers? Default: No";
        typeName = "BOOL";
        class values {
          class Yes {
            name = "Yes";
            value = 1;
          };
          class No {
            default = 1;
            name = "No";
            value = 0;
          };
        };
      };
      class AutomaticWakeup {
        displayName = "Automatic Wakeup?";
        description = "Allow units to wake up by themselves? Default: Yes";
        typeName = "BOOL";
        class values {
          class Yes {
            default = 1;
            name = "Yes";
            value = 1;
          };
          class No {
            name = "No";
            value = 0;
          };
        };
      };
      class DisableScreams {
        displayName = "Disable Screams?";
        description = "Disable screaming on hit? Default: No";
        typeName = "BOOL";
        class values {
          class Yes {
            name = "Yes";
            value = 1;
          };
          class No {
            default = 1;
            name = "No";
            value = 0;
          };
        };
      };
    };
  };
};

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

  class AGM_ItemCore;
  class AGM_Bandage: AGM_ItemCore {
    displayname = "$STR_AGM_Medical_Bandage_Name";
    descriptionshort = "$STR_AGM_Medical_Bandage_Description";
    model = "\A3\Structures_F_EPA\Items\Medical\Bandage_F.p3d";
    picture = "\AGM_Medical\UI\AGM_bandage_ca.paa";
    scope = 2;
    class ItemInfo: InventoryItem_Base_F {
      mass = 2;
    };
  };
  class AGM_Morphine: AGM_Bandage {
    displayName = "$STR_AGM_Medical_Morphine_Name";
    descriptionShort = "$STR_AGM_Medical_Morphine_Description";
    model = "\AGM_Medical\agm_morphine.p3d";
    picture = "\AGM_Medical\UI\AGM_morphine_ca.paa";
  };
  class AGM_Epipen: AGM_Bandage {
    displayName = "$STR_AGM_Medical_Epinephrine_Name";
    descriptionShort = "$STR_AGM_Medical_Epinephrine_Description";
    model = "\AGM_Medical\agm_epipen.p3d";
    picture = "\AGM_Medical\UI\AGM_epipen_ca.paa";
  };
  class AGM_Bloodbag: AGM_Bandage {
    displayName = "$STR_AGM_Medical_Bloodbag_Name";
    descriptionShort = "$STR_AGM_Medical_Bloodbag_Description";
    model = "\A3\Structures_F_EPA\Items\Medical\BloodBag_F.p3d";
    picture = "\AGM_Medical\UI\AGM_bloodbag_ca.paa";
    class ItemInfo: ItemInfo {
      mass = 10;
    };
  };
};

class CfgActions {
  class None;
  class HealSoldier: None {
    hideOnUse = 1;
    priority = 10;
    shortcut = "";
    show = 0;
    showWindow = 0;
    text = "Treat %1";
    textDefault = "<img image='\A3\ui_f\data\igui\cfg\actions\heal_ca.paa' size='1.8' shadow=2 />";
    textSimple = "";
  };
  class HealSoldierAuto: None {
    hideOnUse = 1;
    priority = 0;
    shortcut = "";
    show = 0;
    showWindow = 0;
    text = "Heal soldier";
    textDefault = "";
    textSimple = "";
  };
  class HealSoldierSelf: None {
    hideOnUse = 1;
    priority = 10;
    shortcut = "";
    show = 0;
    showWindow = 0;
    text = "Treat yourself";
    textDefault = "<img image='\A3\ui_f\data\igui\cfg\actions\heal_ca.paa' size='1.8' shadow=2 />";
    textSimple = "";
  };
};

// ANIMATIONS
class CfgMovesBasic {
  class Default;
  class Actions {
    class NoActions;
    class PistolStandActions: NoActions {
      grabDrag = "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2";
    };
    class LauncherKneelActions: NoActions {
      grabDrag = "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2";
    };
    class CivilStandActions: NoActions {
      grabDrag = "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2";
    };
  };
};

class CfgMovesMaleSdr: CfgMovesBasic {
  class HealBase;
  class States {
    class AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1;
    class AcinPknlMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1 {
      enableDirectControl = 1;
    };
    class AcinPknlMwlkSnonWnonDb: AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1 {
      enableDirectControl = 1;
    };

    class Unconscious: Default {
      ConnectTo[] = {};
      head = "headNo";
      forceAim = 1;
      static = 1;
    };

    class AinvPknlMstpSnonWnonDnon_medic0: HealBase {
      variantsPlayer[] = {};
    };
  };
};

// BLOOD MIST EFFECTS
class CfgCloudlets {
  class Blood;
  class AGM_BloodMist: Blood {
    particleShape = "\A3\data_f\ParticleEffects\Universal\Universal_02";
    particleFSNtieth = 8;
    particleFSIndex = 4;
    lifeTime = 1.8;
    size[] = {"((hit + 5) max 30) / 40", "((hit + 5) max 30) / 80", "((hit + 5) max 30) / 150"};
    color[] = {{1,0.1,0.1,0.10}, {1,0.1,0.1,0.05}, {1,0.1,0.1,0.025}};
    randomDirectionPeriod = 0.5;
    randomDirectionIntensity = 0.5;
  };
};

class ImpactEffectsBlood {
  class AGM_BloodMist {
    intensity = 1;
    interval = 1;
    lifeTime = 1;
    position[] = {0,0,0};
    simulation = "particles";
    type = "AGM_BloodMist";
  };
};

class AGM_Parameters_Numeric {
  AGM_Medical_CoefDamage = 1.0;
  AGM_Medical_CoefBleeding = 1.0;
  AGM_Medical_CoefPain = 1.0;
  AGM_Medical_CoefNonMedic = 2.0;
  AGM_Medical_MaxUnconsciousnessTime = -1;
};
class AGM_Parameters_Boolean {
  // Boolean Parameters (0/1)
  AGM_Medical_AllowNonMedics = 0;
  AGM_Medical_RequireDiagnosis = 0;
  AGM_Medical_PreventInstaDeath = 0;
  AGM_Medical_PreventDeathWhileUnconscious = 0;
  AGM_Medical_SingleBandage = 0;
  AGM_Medical_AllowChatWhileUnconscious = 0;
  AGM_Medical_EnableOverdosing = 1;
  AGM_Medical_RequireMEDEVAC = 0;
  AGM_Medical_AutomaticWakeup = 1;
  AGM_Medical_DisableScreams = 0;
};
#include <HintConfig.hpp>
