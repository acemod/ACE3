class CfgMagazines {
    class CA_Magazine;
    class CUP_TimeBomb_M: CA_Magazine {
        scope = 1;
        ace_explosives_placeable = 1;
        useAction = 0;
        ace_explosives_setupObject = "ACE_PipeBomb_place_CUP";
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter", "DeadmanSwitch", "Cellphone"};
            class Timer {
                FuseTime = 0.5;
            };
            class Command {
                FuseTime = 0.5;
            };
        };
    };
    class CUP_Mine_M: CUP_TimeBomb_M {
        ace_explosives_placeable = 1;
        useAction = 0;
        ace_explosives_setupObject = "ACE_Mine_place_CUP";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.08;
            };
        };
    };
    class CUP_MineE_M: CUP_TimeBomb_M {
        ace_explosives_placeable = 1;
        useAction = 0;
        ace_explosives_setupObject = "ACE_MineE_place_CUP";
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.06;
            };
        };
    };

    class CUP_IED_V1_M: CUP_Mine_M {
        ace_explosives_placeable = 1;
        useAction = 0;
        ace_explosives_setupObject = "ACE_IED_V1_place_CUP";
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter", "DeadmanSwitch", "Cellphone", "PressurePlate"};
        };
    };
    class CUP_IED_V2_M: CUP_IED_V1_M {
        useAction = 0;
        ace_explosives_setupObject = "ACE_IED_V2_place_CUP";
    };
    class CUP_IED_V3_M: CUP_IED_V1_M {
        useAction = 0;
        ace_explosives_setupObject = "ACE_IED_V3_place_CUP";
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter", "DeadmanSwitch", "Cellphone", "PressurePlate"};
            class Timer {
                digDistance = 0.06;
            };
            class Command {
                digDistance = 0.06;
            };
            class MK16_Transmitter {
                digDistance = 0.06;
            };
            class DeadmanSwitch {
                digDistance = 0.06;
            };
            class Cellphone {
                digDistance = 0.06;
            };
            class PressurePlate {
                digDistance = 0.06;
            };
        };
    };
    class CUP_IED_V4_M: CUP_IED_V1_M {
        useAction = 0;
        ace_explosives_setupObject = "ACE_IED_V4_place_CUP";
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter", "DeadmanSwitch", "Cellphone", "PressurePlate"};
            class Timer {
                digDistance = 0.08;
            };
            class Command {
                digDistance = 0.08;
            };
            class MK16_Transmitter {
                digDistance = 0.08;
            };
            class DeadmanSwitch {
                digDistance = 0.08;
            };
            class Cellphone {
                digDistance = 0.08;
            };
            class PressurePlate {
                digDistance = 0.08;
            };
        };
    };
};
