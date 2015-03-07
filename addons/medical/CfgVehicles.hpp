
class CfgVehicles {

    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };
    class ACE_moduleMedicalSettings: Module_F    {
        scope = 2;
        displayName = "Medical Settings [ACE]";
        icon = QUOTE(PATHTOF(ui\moduleIcon.paa));
        category = "ACE_medical";
        function = QUOTE(DFUNC(moduleMedicalSettings));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "Glowbal";
        class Arguments    {
            class level {
                displayName = "Medical Level";
                description = "What is the medical simulation level?";
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = "Disabled";
                        value = 0;
                    };
                    class normal {
                        name = "Basic";
                        value = 1;
                        default = 1;
                    };
                    class full  {
                        name = "Advanced";
                        value = 2;
                    };
                };
            };
            class medicSetting {
                displayName = "Medics setting";
                description = "What is the level of detail prefered for medics?";
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = "Disable medics";
                        value = 0;
                    };
                    class normal {
                        name = "Normal";
                        value = 1;
                        default = 1;
                    };
                    class full  {
                        name = "Advanced";
                        value = 2;
                    };
                };
            };
            class enableFor {
                displayName = "Enabled for";
                description = "Select what units the medical system will be enabled for";
                typeName = "NUMBER";
                class values {
                    class playableUnits {
                        name = "Players only";
                        value = 0;
                        default = 1;
                    };
                    class playableUnitsAndAI {
                        name = "Players and AI";
                        value = 1;
                    };
                };
            };
        };
        class ModuleDescription {
            description = "Provides a medical system for both players and AI.";
            sync[] = {};
        };
    };



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

        class ACE_Actions {
            class ACE_Head {
                class Bandage_Head {
                    displayName = "Bandage Head";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'head', 'Bandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'head', 'Bandage Head')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                };
            };
            class ACE_MainActions {
                class Bandage_Torso {
                    displayName = "Bandage Torso";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'body', 'Bandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'body', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                };
            };
            class ACE_ArmLeft {
                class Bandage_LeftArm {
                    displayName = "Bandage Right Arm";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Bandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                };
            };
            class ACE_ArmRight {
                class Bandage_RightArm {
                    displayName = "Bandage Right Arm";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'hand_r', 'Bandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'hand_r', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                };
            };
            class ACE_LegLeft {
                class Bandage_LeftLeg {
                    displayName = "Bandage Left Leg";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'leg_l', 'Bandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_l', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                };
            };
            class ACE_LegRight {
                class Bandage_RightLeg {
                    displayName = "Bandage Right Leg";
                    distance = 2.0;
                    condition = QUOTE([ARR_4(_player, _target, 'leg_r', 'Bandage')] call DFUNC(canTreat));
                    statement = QUOTE([ARR_4(_player, _target, 'leg_r', 'Bandage')] call DFUNC(treatment));
                    showDisabled = 1;
                    priority = 2;
                    hotkey = "B";
                    enableInside = 1;
                };
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
